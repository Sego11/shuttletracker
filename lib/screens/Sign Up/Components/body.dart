import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shuttle_tracker_app/constants.dart';

class Body extends StatefulWidget {
  final VoidCallback showLoginScreen;

  const Body({
    super.key,
    required this.showLoginScreen,
  });

  @override
  State<Body> createState() => _BodyState();
}

bool isSignUpClicked = false;
bool isPasswordIconClicked = true;

class _BodyState extends State<Body> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

//validation
  Future signUp() async {
    try {
      if (passwordConfirmed()) {
        setState(() {
          isSignUpClicked = true;
        });
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        loggedUserID = FirebaseAuth.instance.currentUser!.uid;

        await FirebaseFirestore.instance.collection('users').add({
          'User ID': loggedUserID,
          'Email': _emailController.text.trim(),
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
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
      } else if (e.code == 'email-already-in-use') {
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
      } else if (e.code == 'invalid-email') {
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
  }

  bool isTextFieldChecked() {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

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
              height: 50,
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
            const SizedBox(
              height: 5,
            ),
            TextField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'[a-zA-Z.@0-9]'),
                ),
                LengthLimitingTextInputFormatter(30)
              ],
              controller: _emailController,
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
              height: 10,
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
              height: 5,
            ),
            TextField(
              controller: _passwordController,
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
            const SizedBox(
              height: 10,
            ),
            const Text(
              'confirm password',
              style: TextStyle(
                color: black,
                fontFamily: 'inter',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: _confirmPasswordController,
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
                hintText: 'Confirm your password here',
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
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: signUp,
              //() {
              //   if (isTextFieldChecked()) {

              //   } else {
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       SnackBar(
              //         duration: const Duration(seconds: 2),
              //         behavior: SnackBarBehavior.floating,
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(20),
              //         ),
              //         content: const Padding(
              //           padding: EdgeInsets.symmetric(horizontal: 14.0),
              //           child: Text(
              //             'A Textfield cannot be empty',
              //             style: TextStyle(height: 1.3),
              //             textAlign: TextAlign.center,
              //           ),
              //         ),
              //       ),
              //     );
              //   }
              // },
              // onTap: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: ((context) => const NewProfileScreen()),
              //     ),
              //   );
              // },
              child: Container(
                height: 63,
                width: 375,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: black, width: 1),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                // ignore: prefer_const_constructors
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
              height: 15,
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
              height: 20,
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
              height: 15,
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
              height: 15,
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
                  onTap: widget.showLoginScreen,
                  // onTap: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: ((context) => const LogInScreen()),
                  //     ),
                  //   );
                  // },
                  child: Text(
                    ' Login here',
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
