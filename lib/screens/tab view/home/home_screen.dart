import 'package:flutter/material.dart';
import 'Components/body.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        centerTitle: false,
      ),
      body: const Body(),
    );
  }
}

