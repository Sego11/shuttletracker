// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/constants.dart';
import 'package:shuttle_tracker_app/screens/admin/admin_buses.dart';
import 'package:shuttle_tracker_app/screens/admin/admin_users.dart';

import '../auth/main_page.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {

    void logOut() {
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
                  height: 57,
                ),
                const Text(
                  'Are you sure you want to log out?',
                  style: TextStyle(
                    color: black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        selectedBusNames.clear();
                        FirebaseAuth.instance.signOut();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainPage(),
                            ),
                                (route) => false);
                      },
                      child: Container(
                        height: 63,
                        width: 109,
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
                            'Yes',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: red,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 63,
                        width: 109,
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
                            'No',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        }),
      );
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: primary,
        title: Text(
          'Admin Page',
        ),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: black,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AdminBusesScreen()));
              },
              child: Container(
                height: 75,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    22,
                  ),
                  border: Border.all(color: black, width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/buses.png'),
                      Text(
                        'Buses',
                        style: TextStyle(
                          color: black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UsersScreen(),
                    ));
              },
              child: Container(
                height: 75,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    22,
                  ),
                  border: Border.all(color: black, width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/profile.png'),
                      Text(
                        'Users',
                        style: TextStyle(
                          color: black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: logOut,
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      22,
                    ),
                    border: Border.all(
                      color: black,
                      width: 1,
                    )),
                child: Center(
                  child: Text(
                    'Log Out',
                    style: TextStyle(
                      color: black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
