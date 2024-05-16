import 'package:flutter/material.dart';
import 'package:cipherx/Screens/homescreen.dart';
import 'package:cipherx/Screens/auth_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CipherXScreen extends StatelessWidget {
  const CipherXScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Image.asset(
            'dev_assets/splash.png',
          ),
          Positioned(
            bottom: 125,
            left: 20,
            right: 20,
            child: Container(
              height: 150,
              width: 500,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Column(
                        children: [
                          DefaultTextStyle(
                            style: TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                            ),
                            child: Text(
                              'Welcome to',
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          DefaultTextStyle(
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                            ),
                            child: Text(
                              'CIPHERX',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 110,
                            height: 110,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.purple.shade50),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => StreamBuilder(
                                    stream: FirebaseAuth.instance
                                        .authStateChanges(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return const HomeScreen();
                                      }
                                      return const AuthScreen();
                                    },
                                  ),
                                ),
                              );
                            },
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 75,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DefaultTextStyle(
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    child: Text(
                      'The best way to track your expenses.',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
