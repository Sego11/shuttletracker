import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/constants.dart';
import 'package:shuttle_tracker_app/main.dart';
import 'package:shuttle_tracker_app/screens/Sign%20Up/sign_up_screen.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/home/home_screen.dart';
import 'package:shuttle_tracker_app/screens/password/forgot%20password/forgot_password_screen.dart';

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
              'Enter email Address',
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
              'Enter password',
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
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 226),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const ForgotPassword()),
                    ),
                  );
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: purple,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const HomeScreen()),
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
                      'Login',
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
                          'Sign in with Google',
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
                          'Sign in with Apple',
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
                  'Not a member?',
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
                        builder: ((context) => const SignUpScreen()),
                      ),
                    );
                  },
                  child: Text(
                    'Sign up here',
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
