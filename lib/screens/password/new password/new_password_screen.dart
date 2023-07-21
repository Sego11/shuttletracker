import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/constants.dart';
import 'package:shuttle_tracker_app/screens/password/new%20password/components/body.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: header,
        automaticallyImplyLeading: false,
        // leading: const DefaultBackButton(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: Image.asset('assets/images/logo.png'),
          ),
        ],
      ),
      body: const Body(),
    );
  }
}
