import 'package:cipherx/Data/categories_data.dart';
import 'package:cipherx/Model/expense_categories.dart';
import 'package:cipherx/Model/expense_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(
    path.join(dbPath, 'expenses.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_expenses(id TEXT PRIMARY KEY, amount INT,date DATE, description TEXT, category TEXT)');
    },
    version: 1,
  );
  return db;
}

class ExpenseNotifier extends StateNotifier<List<Expense>> {
  ExpenseNotifier() : super(const []);

  Future<void> loadExpenses() async {
    final db = await _getDatabase();
    final data = await db.query('user_expenses');
    final expenses = data
        .map(
          (e) => Expense(
              id: e['id'] as String,
              amount: e['amount'] as int,
              description: e['description'] as String,
              date: e['date'] as DateTime,
              category: e['category'] as Category),
        )
        .toList();

    state = expenses;
  }

  void addExpense(
      int amount, String description, var category, DateTime date) async {
    final newExpense = Expense(
        amount: amount,
        description: description,
        category: category,
        date: date);

    final db = await _getDatabase();
    final newCategory = categories.entries
        .firstWhere(
            (catItem) => catItem.value.title == newExpense.category.title)
        .value;
    db.insert('user_expenses', {
      'id': newExpense.id,
      'amount': newExpense.amount,
      'date': newExpense.date,
      'description': newExpense.description,
      'category': newCategory
    });

    state = [newExpense, ...state];
  }
}

final expenseProvider = StateNotifierProvider<ExpenseNotifier, List<Expense>>(
  (ref) => ExpenseNotifier(),
);
