import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/constants.dart';
import '../../../Log In/log_in_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

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
            height: 100,
          ),
          Image.asset(
            'assets/images/mail.png',
          ),
          const SizedBox(
            height: 37,
          ),
          Column(
            children: [
              const Text(
                'Kindly Check Your Mail',
                style: TextStyle(
                  color: black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                'we have sent you a password recovery instruction',
                style: TextStyle(
                  color: black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                'to your mail',
                style: TextStyle(
                  color: black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => LogInScreen(
                              showSignUpScreen: () {},
                            )),
                      ),
                    );
                  },
                  child: Text(
                    'Back to login',
                    style: TextStyle(
                      color: primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
