import 'package:flutter/material.dart';

class MoneyOverlook extends StatelessWidget {
  const MoneyOverlook(
      {super.key,
      required this.color,
      required this.title,
      required this.amount});

  final Color color;
  final String title;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_downward,
                  color: color,
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  amount,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
