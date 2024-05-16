import 'package:flutter/material.dart';


enum ExpenseCategories { food, shopping, subscription, travel }

class Category {
  Category(this.title,this.color,this.icon);

  final String title;
  final Color color;
  final Icon icon;
}
