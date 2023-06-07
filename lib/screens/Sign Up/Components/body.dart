import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/constants.dart';
import 'package:shuttle_tracker_app/main.dart';
import 'package:shuttle_tracker_app/screens/Log%20In/log_in_screen.dart';
import 'package:shuttle_tracker_app/screens/newprofile/new_profile_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

bool isPasswordIconClicked = true;

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png'),
                const SizedBox(width: 7.5),
                const Text(
                  'CAMPRIDE',
                  style: TextStyle(
                    color: black,
                    fontSize: 24,
                    fontFamily: 'Habibi',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 14.5,
            ),
            const Center(
              child: Text(
                'Never miss a ride with CAMPRIDE',
                style: TextStyle(
                  color: black,
                  fontFamily: 'Habibi',
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 89,
            ),
            const Text(
              'Your Email Address',
              style: TextStyle(
                color: black,
                fontFamily: 'inter',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 14),
            TextField(
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              decoration: InputDecoration(
                filled: true,
                fillColor: white,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: black, width: 1),
                  borderRadius: BorderRadius.circular(22),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primary, width: 1),
                  borderRadius: BorderRadius.circular(22),
                ),
                hintText: 'Enter your email address',
                hintStyle: const TextStyle(
                  color: grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'choose a password',
              style: TextStyle(
                color: black,
                fontFamily: 'inter',
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
              decoration: InputDecoration(
                filled: true,
                fillColor: white,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: black, width: 1),
                  borderRadius: BorderRadius.circular(22),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primary, width: 1),
                  borderRadius: BorderRadius.circular(22),
                ),
                hintText: 'Enter your password here',
                hintStyle: const TextStyle(
                  color: grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
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
                        )
                      : const Icon(Icons.visibility_off),
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 36),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const NewProfileScreen()),
                  ),
                );
              },
              child: Container(
                height: 63,
                width: 375,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: black, width: 1),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    SizedBox(width: 132),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    // Spacer(),
                    // Icon(Icons.arrow_forward_ios_rounded, color: black),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 19,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 1,
                    width: 139,
                    decoration: const BoxDecoration(
                      color: grey,
                    ),
                  ),
                  const SizedBox(
                    width: 21,
                  ),
                  const Text(
                    'or',
                    style: TextStyle(
                      color: black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 21,
                  ),
                  Container(
                    height: 1,
                    width: 139,
                    decoration: const BoxDecoration(
                      color: grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 33,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                  height: 63,
                  width: 375,
                  decoration: BoxDecoration(
                    color: grey,
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: black,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(
                          width: 59,
                        ),
                        Image.asset(
                          'assets/icons/google.png',
                          height: 25,
                          width: 25,
                        ),
                        const SizedBox(
                          width: 22,
                        ),
                        const Text(
                          'Sign up with Google',
                          style: TextStyle(
                            color: black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 24,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                  height: 63,
                  width: 375,
                  decoration: BoxDecoration(
                    color: grey,
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: black,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(
                          width: 59,
                        ),
                        Image.asset(
                          'assets/icons/apple.png',
                          height: 25,
                          width: 25,
                        ),
                        const SizedBox(
                          width: 22,
                        ),
                        const Text(
                          'Sign up with Apple',
                          style: TextStyle(
                            color: black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Already a member?',
                  style: TextStyle(
                    color: black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const LogInScreen()),
                      ),
                    );
                  },
                  child: Text(
                    'Login here',
                    style: TextStyle(
                      color: primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
