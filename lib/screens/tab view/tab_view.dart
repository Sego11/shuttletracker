import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/constants.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/map/map.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/bus/bus_screen.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/settings/settings_screen.dart';

// ignore: must_be_immutable
class TabView extends StatefulWidget {
  const TabView({super.key});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  final PageController pageController = PageController();

  ValueNotifier<int> currentIndexNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            MapScreen(),
            BusScreen(),
            // FavouriteScreen(),
            SettingsScreen(),
          ],
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: currentIndexNotifier,
        builder: (context, value, child) {
          return BottomNavigationBar(
            selectedItemColor: primary,
            type: BottomNavigationBarType.fixed,
            currentIndex: value,
            onTap: (index) {
              if (index != currentIndexNotifier.value) {
                currentIndexNotifier.value = index;
                pageController.jumpToPage(currentIndexNotifier.value);
              }
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
                activeIcon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.directions_bus),
                label: 'Buses',
                activeIcon: Icon(Icons.directions_bus_outlined),
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.star_outline),
              //   label: 'Favourites',
              //   activeIcon: Icon(Icons.star),
              // ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                label: 'Settings',
                activeIcon: Icon(Icons.settings),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }
}
