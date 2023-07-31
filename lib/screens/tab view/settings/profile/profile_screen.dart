// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/components/backbutton.dart';
import 'package:shuttle_tracker_app/constants.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/settings/profile/component/body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const DefaultBackButton(),
        automaticallyImplyLeading: false,
        backgroundColor: primary,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: Image.asset(
              'assets/images/logo.png',
            ),
          )
        ],
        title: const Text('Profile'),
        titleTextStyle: const TextStyle(
          color: black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Body(),
      ),
    );
  }
}
