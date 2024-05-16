import 'package:cipherx/Screens/add_expense_income.dart';
import 'package:cipherx/Home%20Screen%20Body%20Parts/homscreenbody_first_part.dart';
import 'package:cipherx/Profile%20Screen%20Parts/profilescreen_first_part.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  late Color selectedItem = Theme.of(context).colorScheme.primary;
  Color unselectedItem = Colors.grey;

  void _openAddExpense() {
    showModalBottomSheet(
        context: context, builder: (context) => const AddExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: index == 0
          ? AppBar(
              title: Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.purple.shade50),
                      ),
                      const Icon(Icons.person)
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            )
          : null,
      body: index == 0
          ? const HomeScreenBodyFirstPart()
          : index == 3
              ? const ProfileScreenFirstPart()
              : null,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        selectedLabelStyle:
            TextStyle(color: index == 0 ? selectedItem : unselectedItem),
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: 'Budget',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddExpense,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
