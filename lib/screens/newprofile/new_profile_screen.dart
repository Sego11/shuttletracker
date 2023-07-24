// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/constants.dart';
import 'package:shuttle_tracker_app/screens/newprofile/components/body.dart';

class NewProfileScreen extends StatelessWidget {
  const NewProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: header,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset('assets/images/logo.png'),
          ),
        ],
        title: const Text(
          'Create Profile',
          style: TextStyle(
            color: black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Body(),
      ),
    );
  }
}
