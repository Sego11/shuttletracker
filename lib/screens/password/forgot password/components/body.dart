// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/constants.dart';
import 'package:shuttle_tracker_app/screens/Log%20In/log_in_screen.dart';
import 'package:shuttle_tracker_app/screens/password/mail%20check/mail_check_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _emailcontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailcontroller.text.trim(),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MailCheckScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            content: Text(
              e.message.toString(),
            ),
          );
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/forgot.png',
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Enter your registered email to receive',
                  style: TextStyle(
                    color: grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                const Text(
                  'password reset instruction',
                  style: TextStyle(
                    color: grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 44,
                ),
              ],
            ),
          ),
          const Text(
            'Enter Email ID',
            style: TextStyle(
              color: black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          TextField(
            controller: _emailcontroller,
            autofocus: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                  borderSide: const BorderSide(
                    color: black,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                  borderSide: BorderSide(
                    color: primary,
                    width: 1,
                  ),
                ),
                hintText: 'cousin@gmail.com',
                hintStyle: const TextStyle(
                  color: grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                )),
          ),
          const SizedBox(
            height: 32,
          ),
          GestureDetector(
            onTap: passwordReset,
            // onTap: () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: ((context) => const MailCheckScreen()),
            //     ),
            //   );
            // },
            child: Center(
              child: Container(
                height: 63,
                width: 375,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color: black,
                    width: 1,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Send',
                    style: TextStyle(
                      color: black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 105,
          ),
        ],
      ),
    );
  }
}
