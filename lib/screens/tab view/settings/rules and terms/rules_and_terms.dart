import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/components/backbutton.dart';
import 'package:shuttle_tracker_app/constants.dart';

class RulesAndTermsScreen extends StatelessWidget {
  const RulesAndTermsScreen({super.key});

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
        title: const Text("Rules and Terms"),
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
