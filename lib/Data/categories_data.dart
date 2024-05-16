import 'package:cipherx/Model/expense_categories.dart';
import 'package:flutter/material.dart';

final categories = {
  ExpenseCategories.food: Category(
    'Food',
    Colors.orange.withOpacity(0.2),
    const Icon(
      Icons.lunch_dining,
      color: Colors.orange,
      size: 30,
    ),
  ),
  ExpenseCategories.shopping: Category(
    'Shopping',
    Colors.red.withOpacity(0.2),
    const Icon(
      Icons.shopping_bag,
      color: Colors.red,
      size: 30,
    ),
  ),
  ExpenseCategories.subscription: Category(
    'Subscription',
    Colors.purple.withOpacity(0.2),
    const Icon(
      Icons.subscriptions,
      color: Colors.purple,
      size: 30,
    ),
  ),
  ExpenseCategories.travel: Category(
    'Travel',
    Colors.blue.withOpacity(0.2),
    const Icon(
      Icons.drive_eta,
      color: Colors.blue,
      size: 30,
    ),
  ),
};

List<Map<String, dynamic>> transactionsData = [
  {
    'icon': const Icon(
      Icons.fastfood,
      color: Colors.orange,
      size: 30,
    ),
    'color': Colors.orange.withOpacity(0.2),
    'name': 'Food',
    'description': 'Eat some Food',
    'totalAmount': '-₹45.00',
    'date': '03:30 PM',
  },
  {
    'icon': const Icon(
      Icons.shopping_bag,
      color: Colors.red,
      size: 30,
    ),
    'color': Colors.red.withOpacity(0.2),
    'name': 'Shopping',
    'description': 'Buy some grocery',
    'totalAmount': '-₹230.00',
    'date': '10:00 AM',
  },
  {
    'icon': const Icon(
      Icons.subscriptions,
      color: Colors.purple,
      size: 30,
    ),
    'color': Colors.purple.withOpacity(0.2),
    'name': 'Subscription',
    'description': 'Disney+ Annual',
    'totalAmount': '-₹79.00',
    'date': '03:30 PM',
  },
  {
    'icon': const Icon(
      Icons.drive_eta,
      color: Colors.blue,
      size: 30,
    ),
    'color': Colors.blue.withOpacity(0.2),
    'name': 'Travel',
    'description': 'Chandigarh to Pune',
    'totalAmount': '-₹350.00',
    'date': '10:00 AM',
  }
];
