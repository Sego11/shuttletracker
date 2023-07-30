// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/constants.dart';

class EditBusesListScreen extends StatefulWidget {
  final String busFieldText;
  final String busFieldHintText;
  final TextEditingController controller;

  const EditBusesListScreen({
    super.key,
    required this.busFieldText,
    required this.busFieldHintText, required this.controller,
  });

  @override
  State<EditBusesListScreen> createState() => _EditBusesListScreenState();
}

class _EditBusesListScreenState extends State<EditBusesListScreen> {

  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
        ),
        Text(
          widget.busFieldText,
          style: TextStyle(
            color: black,
            fontFamily: 'inter',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: widget.controller,
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
            hintText: widget.busFieldHintText,
            hintStyle: const TextStyle(
              color: grey,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
