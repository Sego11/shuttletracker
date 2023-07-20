// ignore_for_file: use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class GetBusName extends StatelessWidget {
  // const GetBusName({super.key});

  final String busId;

  const GetBusName({required this.busId});

  @override
  Widget build(BuildContext context) {
    //getting the collection

    CollectionReference buses = FirebaseFirestore.instance.collection('buses');

    return FutureBuilder<DocumentSnapshot>(
      future: buses.doc(busId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          dynamic data = snapshot.data!.data() as dynamic;
          return Text(
            '${data['Bus Name']}',
            style: const TextStyle(
              color: black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          );
        }
        return Text('Loading');
      }),
    );
  }
}
