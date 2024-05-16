import 'package:cipherx/Model/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class HomeScreenBodyFourthPart extends StatefulWidget {
  const HomeScreenBodyFourthPart({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  State<HomeScreenBodyFourthPart> createState() => _HomeScreenBodyFinalState();
}

class _HomeScreenBodyFinalState extends State<HomeScreenBodyFourthPart> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.expenses.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(
              widget.expenses[index],
            ),
            onDismissed: (direction) {
              setState(
                () {
                  widget.expenses.removeAt(index);
                },
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text('Expense Deleted'),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: widget.expenses[index].category.color,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              widget.expenses[index].category.icon,
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.expenses[index].category.title,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  widget.expenses[index].description,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black.withOpacity(0.8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '-${widget.expenses[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.red[400],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.expenses[index].formattedDate,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
