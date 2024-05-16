import 'package:cipherx/Profile%20Screen%20Parts/profilescreen_seond_part.dart';
import 'package:flutter/material.dart';

class ProfileScreenFirstPart extends StatelessWidget {
  const ProfileScreenFirstPart({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.purple.shade50),
                    ),
                    const Icon(
                      Icons.person,
                      size: 75,
                    )
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Username',
                      style: TextStyle(
                          fontSize: 15, color: Colors.black.withOpacity(0.8)),
                    ),
                    const Text(
                      'Khushi Sharma',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit_outlined,
                    size: 30,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const ProfileScreenSecondPart(),
          ],
        ),
      ),
    );
  }
}
