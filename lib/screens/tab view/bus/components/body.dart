import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/constants.dart';

import '../../../../components/selected_bus_type_screen.dart';

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
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: selectedBusNames.isNotEmpty ? 45 : 300,
            ),
            selectedBusNames.isNotEmpty
                ? TextField(
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
                  )
                : const SizedBox(),
            const SizedBox(
              height: 45,
            ),
            selectedBusNames.isNotEmpty
                ? ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (((context, index) {
                      return SelectedBusType(
                        screen: (() {
                          setState(() {
                            selectedBusNames.removeAt(index);
                          });
                          Navigator.pop(context);
                        }),
                        selectedBusName: selectedBusNames[index],
                        selectedBusIndex: index,
                      );
                    })),
                    separatorBuilder: ((context, index) {
                      return const SizedBox(
                        height: 45,
                      );
                    }),
                    itemCount: selectedBusNames.length)
                : const Center(
                    child: Text(
                      'No Bus Added',
                      style: TextStyle(
                        fontSize: 16,
                        color: black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
