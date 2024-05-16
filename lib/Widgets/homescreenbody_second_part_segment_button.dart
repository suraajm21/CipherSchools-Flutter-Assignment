import 'package:flutter/material.dart';

class SegmentButton extends StatelessWidget {
  const SegmentButton({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.2),
        borderRadius: BorderRadius.circular(40),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Colors.orange, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
