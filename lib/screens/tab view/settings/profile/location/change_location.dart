import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/components/backbutton.dart';
import 'package:shuttle_tracker_app/constants.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/settings/profile/location/component/body.dart';

class ChangeLocationScreen extends StatelessWidget {
  const ChangeLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const DefaultBackButton(),
        backgroundColor: header,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: Image.asset(
              'assets/images/logo.png',
            ),
          ),
        ],
        title: const Text('Change Location'),
        titleTextStyle: const TextStyle(
          color: black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
      ),
      body: const Body(),
    );
  }
}
