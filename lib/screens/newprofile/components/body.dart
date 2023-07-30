// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shuttle_tracker_app/constants.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/tab_view.dart';

import '../../tab view/settings/profile/editprofile/component/body.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

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

  Future createProfile() async {
    final document = await FirebaseFirestore.instance
        .collection('users')
        .where('User ID', isEqualTo: loggedUserID)
        .get();

    final docID = document.docs.single.id;

    await uploadImage(profileFilePath);

    await addUserDetails(
      docID,
      _nameController.text.trim(),
      int.parse(_phoneNumberController.text.trim()),
      int.parse(_studentIDController.text.trim()),
    );

    Navigator.push(
        context,
        MaterialPageRoute(
          // ignore: prefer_const_constructors
          builder: (((context) => TabView())),
        ));
  }

  Future addUserDetails(
    String docID,
    String name,
    int phoneNumber,
    int studentId,
  ) async {
    await FirebaseFirestore.instance.collection('users').doc(docID).update({
      'Name': name,
      'Phone Number': phoneNumber,
      'Student ID': studentId,
      'Pic': profileFileURL,
    });
  }

  void addImage() async {
    final result = await FilePicker.platform.pickFiles(
        allowedExtensions: ['jpeg', 'jpg', 'png', 'heic'],
        type: FileType.custom,
        allowMultiple: false);

    if (result!.files.isNotEmpty) {
      setState(() {
        profileFilePath = result.files.single.path!;
      });
    }
  }

  Future uploadImage(String filePath) async {
    try {
      File file = File(filePath);
      final querySnapshot = await FirebaseStorage.instance
          .ref('$loggedUserID/Profile')
          .child('profile')
          .putFile(file);

      profileFileURL = await querySnapshot.ref.getDownloadURL();
      print(profileFileURL);
    } catch (e) {
      print(e.toString());
    }
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
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
                  : Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: FileImage(File(profileFilePath)),
                            fit: BoxFit.cover,
                          )),
                    ),
              const SizedBox(
                width: 22,
              ),
              GestureDetector(
                onTap: addImage,
                child: Text(
                  'Add photo',
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
                  RegExp(r'[a-zA-Z\s]'),
                ),
                LengthLimitingTextInputFormatter(30)
              ],
              controller: _nameController,
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
                  RegExp(r'[a-zA-Z.@0-9 ]'),
                ),
                LengthLimitingTextInputFormatter(30)
              ],
              controller: _emailController,
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
          GestureDetector(
            onTap: () {
              if (istextfieldchecked()) {
                createProfile();
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
              width: 375,
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
                  'Continue',
                  style: TextStyle(
                    color: black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
