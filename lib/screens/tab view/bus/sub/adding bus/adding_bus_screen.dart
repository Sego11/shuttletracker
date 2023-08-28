// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shuttle_tracker_app/components/backbutton.dart';
import 'package:shuttle_tracker_app/constants.dart';
import 'package:shuttle_tracker_app/screens/read%20data/get_bus_name.dart';
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

  Future addBuses(int index) async {
    if (!addedBuses.contains(busIDs[index])) {
      addedBuses.add(busIDs[index]);
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

        Navigator.pop(context, true);
      } catch (e) {
        print(e.toString());
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0),
            child: Text(
              'Bus has already been added',
              style: TextStyle(height: 1.3),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primary,
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
                            addBuses(index);
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
