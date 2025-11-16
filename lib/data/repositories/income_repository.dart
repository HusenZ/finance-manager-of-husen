import 'package:dartz/dartz.dart';
import '../models/income.dart';
import '../services/firebase_service.dart';
import '../services/hive_service.dart';

class IncomeRepository {
  final FirebaseService _firebaseService;
  final HiveService _hiveService;

  IncomeRepository(this._firebaseService, this._hiveService);

  // Create income
  Future<Either<String, Income>> createIncome(Income income) async {
    try {
      // Save to Hive first (offline-first)
      await _hiveService.saveIncome(income);

      // Try to sync to Firebase
      try {
        await _firebaseService.createIncome(income);
        final syncedIncome = income.copyWith(isSynced: true);
        await _hiveService.saveIncome(syncedIncome);
        return Right(syncedIncome);
      } catch (e) {
        // If Firebase fails, return the Hive version
        return Right(income);
      }
    } catch (e) {
      return Left('Failed to create income: ${e.toString()}');
    }
  }

  // Get all incomes for a user
  Future<Either<String, List<Income>>> getIncomes(String userId) async {
    try {
      // Try to fetch from Firebase first
      final result = await _firebaseService.getIncomes(userId);
      return result.fold(
        (error) async {
          // Fallback to Hive if Firebase fails
          final incomes = await _hiveService.getIncomes(userId);
          return Right(incomes);
        },
        (incomes) async {
          // Update Hive cache
          for (var income in incomes) {
            await _hiveService.saveIncome(income);
          }
          return Right(incomes);
        },
      );
    } catch (e) {
      return Left('Failed to load incomes: ${e.toString()}');
    }
  }

  // Get incomes for a specific month
  Future<Either<String, List<Income>>> getIncomesForMonth(
    String userId,
    DateTime month,
  ) async {
    try {
      final result = await getIncomes(userId);
      return result.fold(
        (error) => Left(error),
        (incomes) {
          final filtered = incomes.where((income) {
            return income.date.year == month.year &&
                income.date.month == month.month;
          }).toList();
          return Right(filtered);
        },
      );
    } catch (e) {
      return Left('Failed to load monthly incomes: ${e.toString()}');
    }
  }

  // Update income
  Future<Either<String, Income>> updateIncome(Income income) async {
    try {
      final updatedIncome = income.copyWith(
        updatedAt: DateTime.now(),
        isSynced: false,
      );

      // Update Hive first
      await _hiveService.saveIncome(updatedIncome);

      // Try to sync to Firebase
      try {
        await _firebaseService.updateIncome(updatedIncome);
        final syncedIncome = updatedIncome.copyWith(isSynced: true);
        await _hiveService.saveIncome(syncedIncome);
        return Right(syncedIncome);
      } catch (e) {
        return Right(updatedIncome);
      }
    } catch (e) {
      return Left('Failed to update income: ${e.toString()}');
    }
  }

  // Delete income
  Future<Either<String, void>> deleteIncome(
    String userId,
    String incomeId,
  ) async {
    try {
      // Delete from Hive first
      await _hiveService.deleteIncome(incomeId);

      // Try to delete from Firebase
      try {
        await _firebaseService.deleteIncome(userId, incomeId);
      } catch (e) {
        // If Firebase fails, the Hive deletion was successful anyway
      }

      return const Right(null);
    } catch (e) {
      return Left('Failed to delete income: ${e.toString()}');
    }
  }

  // Search incomes
  Future<Either<String, List<Income>>> searchIncomes(
    String userId,
    String query,
  ) async {
    try {
      final result = await getIncomes(userId);
      return result.fold(
        (error) => Left(error),
        (incomes) {
          final filtered = incomes.where((income) {
            return income.description.toLowerCase().contains(query.toLowerCase()) ||
                income.source.toLowerCase().contains(query.toLowerCase()) ||
                income.notes?.toLowerCase().contains(query.toLowerCase()) == true;
          }).toList();
          return Right(filtered);
        },
      );
    } catch (e) {
      return Left('Failed to search incomes: ${e.toString()}');
    }
  }

  // Filter incomes by source
  Future<Either<String, List<Income>>> filterBySource(
    String userId,
    String source,
  ) async {
    try {
      final result = await getIncomes(userId);
      return result.fold(
        (error) => Left(error),
        (incomes) {
          final filtered = incomes.where((income) {
            return income.source.toLowerCase() == source.toLowerCase();
          }).toList();
          return Right(filtered);
        },
      );
    } catch (e) {
      return Left('Failed to filter incomes: ${e.toString()}');
    }
  }

  // Get total income for a month
  Future<Either<String, double>> getTotalIncomeForMonth(
    String userId,
    DateTime month,
  ) async {
    try {
      final result = await getIncomesForMonth(userId, month);
      return result.fold(
        (error) => Left(error),
        (incomes) {
          final total = incomes.fold<double>(0, (sum, income) => sum + income.amount);
          return Right(total);
        },
      );
    } catch (e) {
      return Left('Failed to calculate total income: ${e.toString()}');
    }
  }

  // Get recurring incomes
  Future<Either<String, List<Income>>> getRecurringIncomes(String userId) async {
    try {
      final result = await getIncomes(userId);
      return result.fold(
        (error) => Left(error),
        (incomes) {
          final recurring = incomes.where((income) => income.isRecurring).toList();
          return Right(recurring);
        },
      );
    } catch (e) {
      return Left('Failed to load recurring incomes: ${e.toString()}');
    }
  }

  // Sync unsynced incomes
  Future<Either<String, void>> syncIncomes(String userId) async {
    try {
      final incomes = await _hiveService.getIncomes(userId);
      final unsynced = incomes.where((income) => !income.isSynced).toList();

      for (var income in unsynced) {
        try {
          await _firebaseService.createIncome(income);
          final syncedIncome = income.copyWith(isSynced: true);
          await _hiveService.saveIncome(syncedIncome);
        } catch (e) {
          // Continue with other incomes even if one fails
          continue;
        }
      }

      return const Right(null);
    } catch (e) {
      return Left('Failed to sync incomes: ${e.toString()}');
    }
  }
}
