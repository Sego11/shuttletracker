import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/constants.dart';
import 'package:shuttle_tracker_app/main.dart';
import 'package:shuttle_tracker_app/screens/Log%20In/log_in_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

bool isPasswordIconClicked = true;
bool isNewPasswordIconClicked = true;

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    void passwordChange() {
      showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 13,
                ),
                Image.asset(
                  'assets/images/complete.png',
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Password Changed Successfully',
                  style: TextStyle(
                    color: black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 54,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) =>  LogInScreen(showSignUpScreen: () {  },)),
                      ),
                    );
                  },
                  child: Container(
                    height: 54,
                    width: 246,
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
                        'Continue',
                        style: TextStyle(
                          color: black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          );
        }),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 37,
          ),
          Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/password.png',
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Create New Password',
                  style: TextStyle(
                    color: black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Enter New Password',
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
            obscureText: isPasswordIconClicked ? true : false,
            autofocus: false,
            autocorrect: false,
            decoration: InputDecoration(
              fillColor: white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  22,
                ),
                borderSide: const BorderSide(
                  color: black,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  22,
                ),
                borderSide: BorderSide(
                  color: primary,
                  width: 1,
                ),
              ),
              hintText: 'min.8 characters',
              hintStyle: const TextStyle(
                color: grey,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              suffixIcon: IconButton(
                splashColor: Colors.transparent,
                onPressed: () {
                  setState(() {
                    isPasswordIconClicked = !isPasswordIconClicked;
                  });
                },
                icon: isPasswordIconClicked
                    ? const Icon(
                        Icons.visibility,
                        color: black,
                      )
                    : const Icon(
                        Icons.visibility_off,
                        color: black,
                      ),
              ),
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          const Text(
            'Confirm New Password',
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
            obscureText: isNewPasswordIconClicked ? true : false,
            autofocus: false,
            autocorrect: false,
            decoration: InputDecoration(
              fillColor: white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  22,
                ),
                borderSide: const BorderSide(
                  color: black,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  22,
                ),
                borderSide: BorderSide(
                  color: primary,
                  width: 1,
                ),
              ),
              hintText: 'min.8 characters',
              hintStyle: const TextStyle(
                color: grey,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              suffixIcon: IconButton(
                splashColor: Colors.transparent,
                onPressed: () {
                  setState(() {
                    isNewPasswordIconClicked = !isNewPasswordIconClicked;
                  });
                },
                icon: isNewPasswordIconClicked
                    ? const Icon(
                        Icons.visibility,
                        color: black,
                      )
                    : const Icon(
                        Icons.visibility_off,
                        color: black,
                      ),
              ),
            ),
          ),
          const SizedBox(
            height: 39,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                passwordChange();
              },
              child: Container(
                height: 63,
                width: 375,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(
                    22,
                  ),
                  border: Border.all(
                    color: black,
                    width: 1,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Create',
                    style: TextStyle(
                      color: black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
