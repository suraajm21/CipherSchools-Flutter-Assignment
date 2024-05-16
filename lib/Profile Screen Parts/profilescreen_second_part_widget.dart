import 'package:flutter/material.dart';

class ProfileScreenSecondPartWidget extends StatelessWidget {
  const ProfileScreenSecondPartWidget(
      {super.key, required this.icon, required this.name});

  final Icon icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              icon,
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
