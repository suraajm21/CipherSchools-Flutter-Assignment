import 'package:cipherx/Model/expense_categories.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMMMd();

const uuid = Uuid();

class Expense {
  Expense({
    required this.amount,
    required this.description,
    required this.date,
    required this.category,
    String? id,
  }) : id = id ?? uuid.v4();

  final String id;

  final int amount;
  final String description;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}
