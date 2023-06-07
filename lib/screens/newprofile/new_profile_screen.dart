import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/components/backbutton.dart';
import 'package:shuttle_tracker_app/constants.dart';
import 'package:shuttle_tracker_app/screens/Log%20In/log_in_screen.dart';
import 'package:shuttle_tracker_app/screens/newprofile/components/body.dart';

class NewProfileScreen extends StatelessWidget {
  const NewProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const DefaultBackButton(),
        automaticallyImplyLeading: false,
        backgroundColor: header,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 70,
              ),
              const Text(
                'Create Profile',
                style: TextStyle(
                  color: black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Image.asset('assets/images/logo.png'),
            ],
          ),
        ),
      ),
      body: const Body(),
      // floatingActionButton: GestureDetector(
      //   onTap: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => const LogInScreen(),
      //       ),
      //     );
      //   },
      //   child: Container(
      //     height: 60,
      //     width: 60,
      //     decoration: BoxDecoration(
      //       color: primary,
      //       shape: BoxShape.circle,
      //       border: Border.all(color: black, width: 1),
      //     ),
      //     child: Center(
      //         child: Icon(
      //       Icons.add,
      //       color: white,
      //       size: 40,
      //     )),
      //   ),
      // ),
    );
  }
}
