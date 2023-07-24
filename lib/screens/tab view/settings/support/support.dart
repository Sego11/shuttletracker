import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/components/backbutton.dart';
import 'package:shuttle_tracker_app/constants.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const DefaultBackButton(),
        automaticallyImplyLeading: false,
        backgroundColor: header,
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
        title: const Text("Support"),
        titleTextStyle: const TextStyle(
          color: black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
      ),
    );
  }
}
