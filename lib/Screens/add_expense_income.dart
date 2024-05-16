import 'package:cipherx/Data/categories_data.dart';
import 'package:cipherx/Model/expense_categories.dart';
import 'package:cipherx/Provider/expense_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class AddExpense extends ConsumerStatefulWidget {
  const AddExpense({super.key});

  @override
  ConsumerState<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends ConsumerState<AddExpense> {
  final _descriptonController = TextEditingController();
  final _amountController = TextEditingController();
  var _selectedExpense = categories[ExpenseCategories.food];
  DateTime? selectDate;
  var switchTile = false;

  void _saveExpense() {
    final enteredAmount = int.tryParse(_amountController.text);
    final enterdedescription = _descriptonController.text;

    if (enteredAmount == null) {
      return;
    }

    if (enterdedescription.isEmpty) {
      return;
    }

    ref.read(expenseProvider.notifier).addExpense(
        enteredAmount, enterdedescription, _selectedExpense, selectDate!);

    Navigator.of(context).pop();
  }

  void _datePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: selectDate,
      firstDate: firstDate,
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
    );

    if (newDate != null) {
      setState(() {
        selectDate = newDate;
      });
    }
  }

  @override
  void dispose() {
    _descriptonController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 100,
        title: switchTile ? const Text('Income') : const Text('Expense'),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('Expense'),
                    const SizedBox(
                      width: 10,
                    ),
                    Switch(
                      value: switchTile,
                      onChanged: (value) {
                        setState(
                          () {
                            switchTile = value;
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('Income'),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'How much?',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '0',
                          hintStyle: const TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          prefixIcon: const Icon(Icons.currency_rupee),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            selectDate == null
                                ? 'No Date Selected'
                                : formatter.format(selectDate!),
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: _datePicker,
                            icon: const Icon(
                              Icons.calendar_month,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField(
                        value: _selectedExpense,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.08),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none)),
                        items: [
                          for (final expense in categories.entries)
                            DropdownMenuItem(
                              value: expense.value,
                              child: Row(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          color: expense.value.color,
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                      ),
                                      expense.value.icon,
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(expense.value.title)
                                ],
                              ),
                            ),
                        ],
                        onChanged: (value) {
                          setState(
                            () {
                              _selectedExpense = value!;
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _descriptonController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.08),
                    hintText: 'Description',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  height: kToolbarHeight,
                  child: ElevatedButton(
                    onPressed: _saveExpense,
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        foregroundColor: Colors.white,
                        backgroundColor: Theme.of(context).colorScheme.primary),
                    child: const Text(
                      'Continue',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
