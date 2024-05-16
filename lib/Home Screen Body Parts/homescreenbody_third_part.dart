import 'package:flutter/material.dart';

class HomeScreenBodyThirdPart extends StatelessWidget {
  const HomeScreenBodyThirdPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Recent Transaction',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text(
            'See All',
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ],
    );
  }
}
