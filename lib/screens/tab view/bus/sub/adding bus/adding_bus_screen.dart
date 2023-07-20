// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/components/backbutton.dart';
import 'package:shuttle_tracker_app/constants.dart';
import 'package:shuttle_tracker_app/screens/read%20data/get_bus_name.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/bus/bus_screen.dart';
import '../../../../../components/bus_type.dart';

class AddingBusScreen extends StatefulWidget {
  const AddingBusScreen({super.key});

  @override
  State<AddingBusScreen> createState() => _AddingBusScreenState();
}

List addedBuses = [];

class _AddingBusScreenState extends State<AddingBusScreen> {
  Future getBusId() async {
    busIDs.clear();
    await FirebaseFirestore.instance.collection('buses').get().then(
          // ignore: avoid_function_literals_in_foreach_calls
          (snapshot) => snapshot.docs.forEach(
            (buses) {
              // print(buses.reference);
              busIDs.add(buses.reference.id);
            },
          ),
        );
  }

  Future addBuses() async {
    try {
      final document = await FirebaseFirestore.instance
          .collection('added buses')
          .where('User ID', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();

      if (document.docs.isNotEmpty) {
        // print(loggedUserID);

        final docID = document.docs.single.id;
        await FirebaseFirestore.instance
            .collection('added buses')
            .doc(docID)
            .update({
          'Added Bus IDs': addedBuses,
        });
      } else {
        // print(loggedUserID);
        await FirebaseFirestore.instance.collection('added buses').add({
          'User ID': FirebaseAuth.instance.currentUser!.uid,
          'Added Bus IDs': addedBuses,
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: header,
        leading: const DefaultBackButton(),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: Image.asset('assets/images/logo.png'),
          ),
        ],
      ),
      body: SingleChildScrollView(
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
              FutureBuilder(
                future: getBusId(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return BusType(
                          isBusListScreen: true,
                          addedBus: () {
                            if (!addedBuses.contains(busIDs[index])) {
                              addedBuses.add(busIDs[index]);
                            }
                            addBuses();
                            // Navigator.pop(context, busNames[index]);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BusScreen()));
                          },
                          allBuses: GetBusName(
                            busId: busIDs[index],
                          ),
                          busName: '',
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 45);
                      },
                      itemCount: busIDs.length,
                    );
                  }
                  return Center(
                    child: CupertinoActivityIndicator(),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}