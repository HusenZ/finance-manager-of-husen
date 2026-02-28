import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/category_repository.dart';
import '../../../data/models/category.dart';
import '../../../core/utils/app_logger.dart';
import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;

  CategoryBloc({required CategoryRepository categoryRepository})
    : _categoryRepository = categoryRepository,
      super(const CategoryState.initial()) {
    on<LoadCategories>(_onLoadCategories);
    on<CreateCategory>(_onCreateCategory);
    on<UpdateCategory>(_onUpdateCategory);
    on<DeleteCategory>(_onDeleteCategory);
  }

  Future<void> _onLoadCategories(
    LoadCategories event,
    Emitter<CategoryState> emit,
  ) async {
    try {
      emit(const CategoryState.loading());

      final result = await _categoryRepository.getAllCategories(
        userId: event.userId,
      );

      result.fold(
        (error) {
          AppLogger.error('Failed to load categories: $error');
          emit(CategoryState.error(message: error));
        },
        (categories) {
          emit(CategoryState.loaded(categories: categories));
        },
      );
    } catch (e) {
      AppLogger.error('Load categories error', error: e);
      emit(const CategoryState.error(message: 'An unexpected error occurred'));
    }
  }

  Future<void> _onCreateCategory(
    CreateCategory event,
    Emitter<CategoryState> emit,
  ) async {
    try {
      emit(const CategoryState.loading());

      final result = await _categoryRepository.createCategory(
        userId: event.userId,
        name: event.name,
        icon: event.icon,
        color: event.color,
      );

      result.fold(
        (error) {
          AppLogger.error('Failed to create category: $error');
          emit(CategoryState.error(message: error));
        },
        (category) {
          AppLogger.info('Category created: ${category.name}');
          emit(
            const CategoryState.success(message: 'Category added successfully'),
          );
          add(LoadCategories(userId: event.userId));
        },
      );
    } catch (e) {
      AppLogger.error('Create category error', error: e);
      emit(const CategoryState.error(message: 'An unexpected error occurred'));
    }
  }

  Future<void> _onUpdateCategory(
    UpdateCategory event,
    Emitter<CategoryState> emit,
  ) async {
    try {
      emit(const CategoryState.loading());

      final category = Category(
        id: event.id,
        userId: event.userId,
        name: event.name,
        icon: event.icon,
        color: event.color,
        isCustom: event.isCustom,
        createdAt: event.createdAt,
      );

      final result = await _categoryRepository.updateCategory(
        category: category,
      );

      result.fold(
        (error) {
          AppLogger.error('Failed to update category: $error');
          emit(CategoryState.error(message: error));
        },
        (updatedCategory) {
          AppLogger.info('Category updated: ${updatedCategory.name}');
          emit(
            const CategoryState.success(
              message: 'Category updated successfully',
            ),
          );
          add(LoadCategories(userId: event.userId));
        },
      );
    } catch (e) {
      AppLogger.error('Update category error', error: e);
      emit(const CategoryState.error(message: 'An unexpected error occurred'));
    }
  }

  Future<void> _onDeleteCategory(
    DeleteCategory event,
    Emitter<CategoryState> emit,
  ) async {
    try {
      emit(const CategoryState.loading());

      final result = await _categoryRepository.deleteCategory(
        userId: event.userId,
        categoryId: event.categoryId,
      );

      result.fold(
        (error) {
          AppLogger.error('Failed to delete category: $error');
          emit(CategoryState.error(message: error));
        },
        (_) {
          AppLogger.info('Category deleted: ${event.categoryId}');
          emit(
            const CategoryState.success(
              message: 'Category deleted successfully',
            ),
          );
          add(LoadCategories(userId: event.userId));
        },
      );
    } catch (e) {
      AppLogger.error('Delete category error', error: e);
      emit(const CategoryState.error(message: 'An unexpected error occurred'));
    }
  }
}
