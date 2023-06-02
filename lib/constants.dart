import 'package:flutter/material.dart';

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
  ''
];

List<String> selectedBusNames = [];

List<String> bottomNavTitle = [
  'Home',
  'Buses',
  'Favourites',
  'Profile',
];
List bottomNavIcon = [
  Icons.home,
  Icons.directions_bus,
  Icons.star,
  Icons.person,
];

bool isBottomNavIconSelected = false;
