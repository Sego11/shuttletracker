import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shuttle_tracker_app/constants.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

String profileFileName = '';
String profileFilePath = '';

class _BodyState extends State<Body> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _studentIDController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _studentIDController.dispose();
    super.dispose();
  }

  Future editProfile() async {
    final document = await FirebaseFirestore.instance
        .collection('users')
        .where('User ID', isEqualTo: loggedUserID)
        .get();

    final docID = document.docs.single.id;

    await addUserDetails(
      docID,
      _nameController.text.trim(),
      _emailController.text.trim(),
      int.parse(_phoneNumberController.text.trim()),
      int.parse(_studentIDController.text.trim()),
    );

    // // ignore: use_build_context_synchronously
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       // ignore: prefer_const_constructors
    //       builder: (((context) => TabView())),
    //     ));
  }

  Future addUserDetails(
    String docID,
    String name,
    String email,
    int phoneNumber,
    int studentId,
  ) async {
    await FirebaseFirestore.instance.collection('users').doc(docID).update({
      'Name': name,
      'Email': email,
      'Phone Number': phoneNumber,
      'Student ID': studentId,
    });
  }

  bool istextfieldchecked() {
    if (_emailController.text.isNotEmpty &&
        _nameController.text.isNotEmpty &&
        _phoneNumberController.text.isNotEmpty &&
        _studentIDController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  // void addImage() async {
  //   final result = await FilePicker.platform.pickFiles(
  //       allowedExtensions: ['jpeg', 'jpg', 'png','heic'],
  //       type: FileType.custom,
  //       allowMultiple: false);

  //   if (result!.files.isNotEmpty) {
  //     profileFileName = result.files.single.name;
  //     profileFilePath = result.files.single.path!;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 39,
          ),
          Row(
            children: [
              profileFilePath == ''
                  ? Image.asset('assets/images/person.png')
                  : Image.file(
                      File(profileFilePath),
                    ),
              const SizedBox(
                width: 22,
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Photo Upload+',
                  style: TextStyle(
                    color: primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 29,
          ),
          const Text(
            'Name:',
            style: TextStyle(
              color: black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            child: TextField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'[a-zA-Z@]'),
                ),
                LengthLimitingTextInputFormatter(30)
              ],
              controller: _nameController,
              cursorColor: black,
              keyboardType: TextInputType.name,
              enableSuggestions: true,
              decoration: InputDecoration(
                fillColor: white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                  borderSide: const BorderSide(
                    color: black,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                  borderSide: BorderSide(
                    color: primary,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Email Address:',
            style: TextStyle(
              color: black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            child: TextField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'[a-zA-Z@.0-9]'),
                ),
                LengthLimitingTextInputFormatter(50)
              ],
              controller: _emailController,
              cursorColor: black,
              enableSuggestions: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                fillColor: white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                  borderSide: const BorderSide(
                    color: black,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                  borderSide: BorderSide(
                    color: primary,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'Phone Number:',
            style: TextStyle(
              color: black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            child: TextField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'[0-9]'),
                ),
                LengthLimitingTextInputFormatter(10)
              ],
              controller: _phoneNumberController,
              cursorColor: black,
              keyboardType: TextInputType.phone,
              enableSuggestions: false,
              decoration: InputDecoration(
                fillColor: white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                  borderSide: const BorderSide(
                    color: black,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                  borderSide: BorderSide(
                    color: primary,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'Student ID:',
            style: TextStyle(
              color: black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            child: TextField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'[0-9]'),
                ),
                LengthLimitingTextInputFormatter(8)
              ],
              controller: _studentIDController,
              cursorColor: black,
              enableSuggestions: false,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                  borderSide: const BorderSide(
                    color: black,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                  borderSide: BorderSide(
                    color: primary,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 65,
          ),
          // GestureDetector(
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: ((context) => const TabView()),
          //       ),
          //     );
          //   },
          Center(
            child: GestureDetector(
              onTap: () {
                if (istextfieldchecked()) {
                  editProfile();

                  Navigator.pop(
                    context,
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        content: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14.0),
                          child: Text(
                            'Profile Updated Successfully!',
                            style: TextStyle(height: 1.3),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      content: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.0),
                        child: Text(
                          'A Textfield cannot be empty',
                          style: TextStyle(height: 1.3),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                }
              },
              child: Container(
                height: 63,
                width: 350,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color: black,
                    width: 1,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
