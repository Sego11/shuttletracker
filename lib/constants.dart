import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/screens/newprofile/new_profile_screen.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/settings/profile/appinfo/app_info.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/settings/profile/changepassword/change_password.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/settings/profile/editprofile/edit_profile.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/settings/profile/location/change_location.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/settings/profile/profile_screen.dart';

const white = Color(0xffffffff);
const black = Colors.black;
final primary = const Color(0xff008000).withOpacity(0.38);
const grey = Color(0xffd9d9d9);
const purple = Color(0xff800080);
const header = Color(0xffF0F1F5);
const red = Color(0xffFF1313);
const bottomColor = Color(0xff808080);

late double width;
late double height;

double screenHeight = height / 932;
double screenWidth = width / 430;

List<String> busNames = [
  'Brunei Bus',
  'Commercial Bus',
  'Gaza Bus',
  'Bomso Bus',
];

List<String> selectedBusNames = [];

List<String> settingsButtonText = [
  'Profile',
  'Dark theme',
  'Rules and Terms',
  "FAQ's",
  'Rate us',
  'Support',
];
// List settings = [
//   Icons.home,
//   Icons.directions_bus,
//   Icons.star,
//   Icons.person,
// ];

List settingsIcon = [
  Image.asset(
    'assets/images/profile.png',
    scale: 1.2,
  ),
  Image.asset(
    'assets/images/theme.png',
    scale: 1.2,
  ),
  Image.asset(
    'assets/images/terms.png',
    scale: 1.2,
  ),
  Image.asset(
    "assets/images/FAQ's.png",
    scale: 1.2,
  ),
  Image.asset(
    'assets/images/rate.png',
    scale: 1.2,
  ),
  Image.asset(
    'assets/images/support.png',
    scale: 1.2,
  ),
];

List<Widget> settingsscreens = [
  const ProfileScreen(),
  NewProfileScreen(),
  NewProfileScreen(),
  NewProfileScreen(),
  NewProfileScreen(),
  NewProfileScreen(),
];

int selectedBusNameCount = 0;

List<String> profileButtonText = [
  'Edit profile',
  'Change password',
  'App information',
  // "Change location",
];
List profileIcons = [
  Image.asset(
    'assets/images/prof.png',
    scale: 1.2,
  ),
  Image.asset(
    'assets/images/pass.png',
    scale: 1.2,
  ),
  Image.asset(
    'assets/images/info.png',
    scale: 1.2,
  ),
  // Image.asset(
  //   "assets/images/loc.png",
  //   scale: 1.2,
  // ),
];

List<Widget> profilescreens = [
  const EditProfileScreen(),
  const ChangePasswordScreen(),
  const AppInfoScreen(),
  // const ChangeLocationScreen(),
];
