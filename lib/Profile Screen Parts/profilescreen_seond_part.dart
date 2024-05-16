import 'package:cipherx/Profile%20Screen%20Parts/profilescreen_second_part_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreenSecondPart extends StatelessWidget {
  const ProfileScreenSecondPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(0.01),
        ),
        color: Colors.grey.withOpacity(0.03),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ProfileScreenSecondPartWidget(
            icon: Icon(
              Icons.account_balance_wallet,
              size: 30,
              color: Theme.of(context).colorScheme.primary,
            ),
            name: 'Account',
          ),
          ProfileScreenSecondPartWidget(
            icon: Icon(
              Icons.settings,
              size: 30,
              color: Theme.of(context).colorScheme.primary,
            ),
            name: 'Settings',
          ),
          ProfileScreenSecondPartWidget(
            icon: Icon(
              Icons.file_upload_outlined,
              size: 30,
              color: Theme.of(context).colorScheme.primary,
            ),
            name: 'Export Data',
          ),
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            child: const ProfileScreenSecondPartWidget(
              icon: Icon(
                Icons.logout,
                size: 30,
                color: Colors.red,
              ),
              name: 'Logout',
            ),
          )
        ],
      ),
    );
  }
}
