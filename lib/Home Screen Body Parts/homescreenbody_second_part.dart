import 'package:cipherx/Widgets/homescreenbody_second_part_segment_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreenBodySecondPart extends StatefulWidget {
  const HomeScreenBodySecondPart({super.key});

  @override
  State<HomeScreenBodySecondPart> createState() =>
      _HomeScreenBodySecondHalfState();
}

class _HomeScreenBodySecondHalfState extends State<HomeScreenBodySecondPart> {
  bool isSelected = true;
  String? _currentText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: CupertinoSegmentedControl(
        selectedColor: Colors.black.withOpacity(0.4),
        borderColor: Colors.white,
        children: {
          'Today': _currentText == 'Today'
              ? const SegmentButton(
                  title: 'Today',
                )
              : Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
          'Week': _currentText == 'Week'
              ? const SegmentButton(
                  title: 'Week',
                )
              : Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Week',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
          'Month': _currentText == 'Month'
              ? const SegmentButton(
                  title: 'Month',
                )
              : Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Month',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
          'Year': _currentText == 'Year'
              ? const SegmentButton(
                  title: 'Year',
                )
              : Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Year',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
        },
        onValueChanged: (String value) {
          setState(
            () {
              _currentText = value;
            },
          );
        },
      ),
    );
  }
}
