import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/constants.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/bus/bus_screen.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/bus/sub/adding%20bus/adding_bus_screen.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/tab_view.dart';

import '../../../../../../components/bus_type.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 28,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 45,
            ),
            TextField(
              decoration: InputDecoration(
                fillColor: white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    22,
                  ),
                  borderSide: const BorderSide(
                    color: black,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    22,
                  ),
                  borderSide: BorderSide(
                    color: primary,
                    width: 1,
                  ),
                ),
                hintText: 'Search',
                hintStyle: const TextStyle(
                  color: grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                suffixIcon: const Icon(
                  Icons.search,
                  color: black,
                  size: 25,
                ),
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            ListView.separated(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return BusType(
                  addedBus: () {
                    //prevents duplicates of bus names in selectedBusNames list
                    if (!selectedBusNames.contains(busNames[index])) {
                      setState(() {
                        selectedBusNames.add(busNames[index]);
                      });
                    }
                    Navigator.of(context).pop(true);
                  },
                  busName: busNames[index],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 45);
              },
              itemCount: busNames.length,
            ),
          ],
        ),
      ),
    );
  }
}
