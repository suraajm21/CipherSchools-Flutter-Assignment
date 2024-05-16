import 'package:cipherx/Provider/expense_provider.dart';
import 'package:cipherx/Home%20Screen%20Body%20Parts/homescreenbody_fourth_part.dart';
import 'package:cipherx/Home%20Screen%20Body%20Parts/homescreenbody_third_part.dart';
import 'package:cipherx/Home%20Screen%20Body%20Parts/homescreenbody_second_part.dart';
import 'package:cipherx/Widgets/homescreenbody_first_part_money_overlook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreenBodyFirstPart extends ConsumerStatefulWidget {
  const HomeScreenBodyFirstPart({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _HomeScreenBodyFirstHalfState();
  }
}

class _HomeScreenBodyFirstHalfState
    extends ConsumerState<HomeScreenBodyFirstPart> {
  late Future<void> expensesFuture;

  @override
  void initState() {
    super.initState();
    expensesFuture = ref.read(expenseProvider.notifier).loadExpenses();
  }

  @override
  Widget build(BuildContext context) {
    final userExpenses = ref.watch(expenseProvider);

    Widget mainContent = const Center(
      child: Text(
        'No expenses found. Start adding some!',
      ),
    );

    if (userExpenses.isNotEmpty) {
      mainContent = FutureBuilder(
        future: expensesFuture,
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : HomeScreenBodyFourthPart(
                    expenses: userExpenses,
                  ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Text(
            'Account Balance',
            style: TextStyle(color: Colors.black.withOpacity(0.4)),
          ),
          const Text(
            '₹38000',
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              MoneyOverlook(
                  color: Colors.green.shade400,
                  title: 'Income',
                  amount: '₹50000'),
              const SizedBox(
                width: 10,
              ),
              MoneyOverlook(
                  color: Colors.red.shade400,
                  title: 'Expenses',
                  amount: '₹38000'),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const HomeScreenBodySecondPart(),
          const HomeScreenBodyThirdPart(),
          const SizedBox(
            height: 30,
          ),
          mainContent,
        ],
      ),
    );
  }
}
