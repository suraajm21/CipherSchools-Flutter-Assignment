import 'package:cipherx/Widgets/google_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var isLogin = true;
  final form = GlobalKey<FormState>();
  var enteredEmail = '';
  var enteredPassword = '';
  var enteredName = '';

  void signUserIn() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  void submit() async {
    final isValid = form.currentState!.validate();

    if (!isValid) {
      return;
    }

    form.currentState!.save();

    try {
      if (isLogin) {
        final userCredential = await _firebase.signInWithEmailAndPassword(
            email: enteredEmail, password: enteredPassword);
      } else {
        final userCredentials = await _firebase.createUserWithEmailAndPassword(
            email: enteredEmail, password: enteredPassword);
        FirebaseFirestore.instance
            .collection('users')
            .doc(userCredentials.user!.uid)
            .set({'username': enteredName, 'email': enteredEmail});
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {}
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid E-mail or Password'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: isLogin ? const Text('Sign In') : const Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 100),
        child: SafeArea(
          child: Form(
            key: form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!isLogin)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      autocorrect: false,
                      textCapitalization: TextCapitalization.none,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.4),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.1),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      enableSuggestions: false,
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty ||
                            value.trim().length < 4) {
                          return 'Please enter a valid name.';
                        }

                        return null;
                      },
                      onSaved: (newValue) {
                        enteredName = newValue!;
                      },
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                    decoration: InputDecoration(
                      hintText: 'E-Mail',
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.1),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty ||
                          !value.contains('@')) {
                        return 'Please enter a valid email address.';
                      }

                      return null;
                    },
                    onSaved: (newValue) {
                      enteredEmail = newValue!;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.1),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().length < 6) {
                        return 'Password must be at least 6 characters long.';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      enteredPassword = newValue!;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: submit,
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    margin: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        isLogin ? 'Sign In' : 'Sign Up',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Or with',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.60),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        width: 350,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(20)),
                        child: GestureDetector(
                          onTap: () => GoogleAuth().signInWithGoogle(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'image/google.png',
                                height: 40,
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              Text(
                                isLogin
                                    ? 'Sign In with Google'
                                    : 'Sign Up with Google',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(isLogin
                        ? "Don't have an account? "
                        : 'Already a memeber? '),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isLogin = !isLogin;
                        });
                      },
                      child: Text(
                        isLogin ? 'Register Now' : 'Login',
                        style: const TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
