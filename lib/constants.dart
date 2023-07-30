import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/settings/faqs/faqs.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/settings/profile/appinfo/app_info.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/settings/profile/changepassword/change_password.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/settings/profile/editprofile/edit_profile.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/settings/profile/profile_screen.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/settings/rate%20us/rate_us.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/settings/rules%20and%20terms/rules_and_terms.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/settings/support/support.dart';

const white = Color(0xffffffff);
const black = Colors.black;
final primary = const Color(0xff008000).withOpacity(0.38);
const grey = Color(0xffd9d9d9);
const purple = Color(0xff800080);
const header = Color(0xffF0F1F5);
const red = Color(0xffFF1313);
const bottomColor = Color(0xff808080);
const String google_api_key = "AIzaSyBjJxgufd72ExWl-LIU_c_0GujNBKrIzzM";

late double width;
late double height;

double screenHeight = height / 932;
double screenWidth = width / 430;

List<String> busNames = [
  // 'Brunei Bus',
  // 'Commercial Bus',
  // 'Gaza Bus',
  // 'Bomso Bus',
];

List<String> selectedBusNames = [];

List<String> settingsButtonText = [
  'Profile',
  // 'Dark theme',
  'Rules and Terms',
  "FAQ's",
  'Rate us',
  'Support',
];

List settingsIcon = [
  Image.asset(
    'assets/images/profile.png',
    scale: 1.2,
  ),
  // Image.asset(
  //   'assets/images/theme.png',
  //   scale: 1.2,
  // ),
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
  const RulesAndTermsScreen(),
  const FaqsScreen(),
  const RateUsScreen(),
  const SupportScreen(),
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
 
];

List<Widget> profilescreens = [
  const EditProfileScreen(),
  const ChangePasswordScreen(),
  const AppInfoScreen(),
];

List faveBusName = [
  'Brunei Bus',
  'Commercial Bus',
  'Gaza Bus',
  'Bomso Bus',
];
List faveBusNumber = [
  '5464-12',
  '4301-15',
  '2643-09',
  '9665-10',
];
List faveDestination = [
  'KSB',
  'KSB',
  'Pharmacy Block',
  'KSB',
];
List faveSeatNumber = [
  '32',
  '16',
  '40',
  '8',
];

String busNameSelected = '';
String busNumberSelected = '';
String busDestinationSelected = '';
String busSeatNumberSelected = '';

List favBusList = [];
bool isFavIconClicked = false;

String loggedUserID = '';

List<String> busIDs = [];

List specificBusName = [];
List specificBusNumber = [];
List specificBusDestination = [];
List specificBusSeatNumber = [];
List specificBusStart = [];


