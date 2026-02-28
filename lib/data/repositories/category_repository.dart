import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';
import '../services/firebase_service.dart';
import '../services/hive_service.dart';
import '../models/category.dart';
import '../../core/utils/app_logger.dart';
import '../../core/constants/app_constants.dart';
import '../../services/subscription_service.dart';

class CategoryRepository {
  final FirebaseService _firebaseService;
  final HiveService _hiveService;
  final SubscriptionService _subscriptionService;
  final Uuid _uuid;

  CategoryRepository({
    required FirebaseService firebaseService,
    required HiveService hiveService,
    required SubscriptionService subscriptionService,
    Uuid? uuid,
  }) : _firebaseService = firebaseService,
       _hiveService = hiveService,
       _subscriptionService = subscriptionService,
       _uuid = uuid ?? const Uuid();

  Future<Either<String, void>> initializeDefaultCategories(
    String userId,
  ) async {
    try {
      final categories = AppConstants.defaultCategories.map((categoryData) {
        return Category(
          id: _uuid.v4(),
          userId: userId,
          name: categoryData['name']!,
          icon: categoryData['icon']!,
          color: categoryData['color']!,
          isCustom: false,
          createdAt: DateTime.now(),
        );
      }).toList();

      await _hiveService.saveCategories(categories);

      if (_subscriptionService.canUseCloudSync()) {
        for (final category in categories) {
          await _firebaseService.saveCategory(category);
        }
      }

      AppLogger.info('Default categories initialized');
      return const Right(null);
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to initialize default categories',
        error: e,
        stackTrace: stackTrace,
      );
      return Left('Failed to initialize categories: ${e.toString()}');
    }
  }

  Future<Either<String, Category>> createCategory({
    required String userId,
    required String name,
    required String icon,
    required String color,
  }) async {
    try {
      final existing = await _hiveService.getAllCategories();
      final currentCustomCount = existing.where((c) => c.isCustom).length;
      if (!_subscriptionService.canAddCategory(currentCustomCount)) {
        return const Left('Free tier allows up to 3 custom categories.');
      }

      final category = Category(
        id: _uuid.v4(),
        userId: userId,
        name: name,
        icon: icon,
        color: color,
        isCustom: true,
        createdAt: DateTime.now(),
      );

      await _hiveService.saveCategory(category);
      if (!_subscriptionService.canUseCloudSync()) {
        return Right(category);
      }

      final result = await _firebaseService.saveCategory(category);

      return result.fold(
        (error) {
          AppLogger.warning(
            'Category saved locally but failed to sync: $error',
          );
          return Right(category);
        },
        (_) {
          AppLogger.info('Category created and synced: ${category.name}');
          return Right(category);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to create category',
        error: e,
        stackTrace: stackTrace,
      );
      return Left('Failed to create category: ${e.toString()}');
    }
  }

  Future<Either<String, Category>> updateCategory({
    required Category category,
  }) async {
    try {
      final updatedCategory = category.copyWith(updatedAt: DateTime.now());

      await _hiveService.saveCategory(updatedCategory);
      if (!_subscriptionService.canUseCloudSync()) {
        return Right(updatedCategory);
      }

      final result = await _firebaseService.saveCategory(updatedCategory);

      return result.fold(
        (error) {
          AppLogger.warning(
            'Category updated locally but failed to sync: $error',
          );
          return Right(updatedCategory);
        },
        (_) {
          AppLogger.info(
            'Category updated and synced: ${updatedCategory.name}',
          );
          return Right(updatedCategory);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to update category',
        error: e,
        stackTrace: stackTrace,
      );
      return Left('Failed to update category: ${e.toString()}');
    }
  }

  Future<Either<String, void>> deleteCategory({
    required String userId,
    required String categoryId,
  }) async {
    try {
      await _hiveService.deleteCategory(categoryId);
      if (!_subscriptionService.canUseCloudSync()) {
        return const Right(null);
      }

      final result = await _firebaseService.deleteCategory(userId, categoryId);

      return result.fold(
        (error) {
          AppLogger.warning(
            'Category deleted locally but failed to sync: $error',
          );
          return const Right(null);
        },
        (_) {
          AppLogger.info('Category deleted and synced: $categoryId');
          return const Right(null);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete category',
        error: e,
        stackTrace: stackTrace,
      );
      return Left('Failed to delete category: ${e.toString()}');
    }
  }

  Future<Either<String, List<Category>>> getAllCategories({
    required String userId,
  }) async {
    try {
      final localCategories = await _hiveService.getAllCategories();

      if (localCategories.isEmpty) {
        // Initialize with default categories if none exist
        await initializeDefaultCategories(userId);
        return Right(await _hiveService.getAllCategories());
      }

      // Sync from Firestore in the background for paid tiers
      if (_subscriptionService.canUseCloudSync()) {
        _syncCategoriesFromFirestore(userId);
      }

      return Right(localCategories);
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to get all categories',
        error: e,
        stackTrace: stackTrace,
      );
      return Left('Failed to get categories: ${e.toString()}');
    }
  }

  Future<Either<String, List<Category>>> getCustomCategories({
    required String userId,
  }) async {
    try {
      final result = await getAllCategories(userId: userId);

      return result.fold((error) => Left(error), (categories) {
        final customCategories = categories.where((c) => c.isCustom).toList();
        return Right(customCategories);
      });
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to get custom categories',
        error: e,
        stackTrace: stackTrace,
      );
      return Left('Failed to get categories: ${e.toString()}');
    }
  }

  Future<String?> suggestCategory(String description) async {
    try {
      final lowerDescription = description.toLowerCase();

      for (final entry in AppConstants.categoryKeywords.entries) {
        for (final keyword in entry.value) {
          if (lowerDescription.contains(keyword)) {
            AppLogger.debug(
              'Suggested category: ${entry.key} for description: $description',
            );
            return entry.key;
          }
        }
      }

      return null;
    } catch (e) {
      AppLogger.warning('Failed to suggest category: $e');
      return null;
    }
  }

  Future<void> _syncCategoriesFromFirestore(String userId) async {
    try {
      final result = await _firebaseService.getCategories(userId);

      result.fold(
        (error) => AppLogger.warning(
          'Failed to sync categories from Firestore: $error',
        ),
        (categories) async {
          await _hiveService.saveCategories(categories);
          AppLogger.info(
            'Synced ${categories.length} categories from Firestore',
          );
        },
      );
    } catch (e) {
      AppLogger.warning('Background category sync failed: $e');
    }
  }

  Future<Either<String, void>> syncAllCategories(String userId) async {
    try {
      if (!_subscriptionService.canUseCloudSync()) {
        return const Right(null);
      }
      final result = await _firebaseService.getCategories(userId);

      return result.fold((error) => Left(error), (categories) async {
        await _hiveService.saveCategories(categories);
        AppLogger.info('Successfully synced all categories');
        return const Right(null);
      });
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to sync categories',
        error: e,
        stackTrace: stackTrace,
      );
      return Left('Failed to sync: ${e.toString()}');
    }
  }
}
