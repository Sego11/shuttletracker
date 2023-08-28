// ignore_for_file: unused_local_variable, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shuttle_tracker_app/constants.dart';
import 'package:shuttle_tracker_app/model/bus.dart';
import 'package:shuttle_tracker_app/model/selected_bus_model.dart';
import 'package:shuttle_tracker_app/model/user.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/bus/sub/adding%20bus/adding_bus_screen.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/settings/profile/editprofile/component/body.dart';

List<dynamic> allUsers = [];
List<dynamic> allBuses = [];

class ReadData {
  Future addBus(
    String name,
    String number,
    String destination,
    int seatNumber,
    String start,
  ) async {
    final document = await FirebaseFirestore.instance.collection('buses').add({
      'Bus Name': name,
      'Bus Number': number,
      'Destination': destination,
      'Seat Number': seatNumber,
      'Start': start,
    });

    final id = document.id;

    await FirebaseFirestore.instance
        .collection('buses')
        .doc(id)
        .update({'Bus ID': id});
  }

  Future deleteBus(int index) async {
    try {
      await FirebaseFirestore.instance
          .collection('buses')
          .doc(allBuses[index].id)
          .delete()
          .catchError((err) {
        print(throw Exception(err.toString()));
      });
    } on FirebaseException catch (error) {
      print(error.toString());
    } catch (e) {
      print(e.toString());
    }
  }

  Future updateBus(
    String busId,
    String name,
    String number,
    String destination,
    int seatNumber,
    String start,
  ) async {
    final document =
        await FirebaseFirestore.instance.collection('buses').doc(busId).update({
      'Bus Name': name,
      'Bus Number': number,
      'Destination': destination,
      'Seat Number': seatNumber,
      'Start': start,
    });
  }

  Future getSelectedBuses() async {
    selectedBusNames.clear();
    specificBusDestination.clear();
    specificBusNumber.clear();
    specificBusStart.clear();
    specificBusSeatNumber.clear();
    specificBusName.clear();
    addedBuses.clear();
    final document = await FirebaseFirestore.instance
        .collection('added buses')
        .where('User ID', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    if (document.docs.isNotEmpty) {
      final data = document.docs.single.data();
      final selectedBusIDs = data['Added Bus IDs'];

      for (var busId in selectedBusIDs) {
        final document = await FirebaseFirestore.instance
            .collection('buses')
            .doc(busId)
            .get();
        final documentData = document.data()!;

        final selectedBusData = SelectedBusModel(
            name: documentData['Bus Name'],
            number: documentData['Bus Number'],
            start: documentData['Start'],
            destination: documentData['Destination'],
            seatNumber: documentData['Seat Number'],
            id: documentData['Bus ID']);

        if (!selectedBusNames.contains(selectedBusData.name)) {
          selectedBusNames.add(selectedBusData.name);
          specificBusNumber.add(selectedBusData.number);
          specificBusSeatNumber.add(selectedBusData.seatNumber);
          specificBusStart.add(selectedBusData.start);
          specificBusDestination.add(selectedBusData.destination);
          specificBusName.add(selectedBusData.name);
        }
        if (!addedBuses.contains(selectedBusData.id)) {
          addedBuses.add(selectedBusData.id);
        }
      }
    }

    return selectedBusNames;
  }

  Future getSpecificBusInfo() async {
    specificBusDestination.clear();
    specificBusNumber.clear();
    specificBusStart.clear();
    specificBusSeatNumber.clear();
    specificBusName.clear();
    selectedBusNames.clear();
    addedBuses.clear();
    final document = await FirebaseFirestore.instance
        .collection('added buses')
        .where('User ID', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    if (document.docs.isNotEmpty) {
      final data = document.docs.single.data();
      final selectedBusIDs = data['Added Bus IDs'];

      for (var busId in selectedBusIDs) {
        final document = await FirebaseFirestore.instance
            .collection('buses')
            .doc(busId)
            .get();
        final documentData = document.data()!;

        final selectedBusData = SelectedBusModel(
            name: documentData['Bus Name'],
            number: documentData['Bus Number'],
            start: documentData['Start'],
            destination: documentData['Destination'],
            seatNumber: documentData['Seat Number'],
            id: documentData['Bus ID']);

        if (!selectedBusNames.contains(selectedBusData.name)) {
          selectedBusNames.add(selectedBusData.name);
          specificBusNumber.add(selectedBusData.number);
          specificBusSeatNumber.add(selectedBusData.seatNumber);
          specificBusStart.add(selectedBusData.start);
          specificBusDestination.add(selectedBusData.destination);
          specificBusName.add(selectedBusData.name);
        }
        if (!addedBuses.contains(selectedBusData.id)) {
          addedBuses.add(selectedBusData.id);
        }
      }
    }
  }

  Future getUserData() async {
    final document = await FirebaseFirestore.instance
        .collection('users')
        .where('User ID', isEqualTo: loggedUserID)
        .get();

    if (document.docs.isNotEmpty) {
      final docID = document.docs.single.id;

      final querySnapshot =
          await FirebaseFirestore.instance.collection('users').doc(docID).get();

      final documentData = querySnapshot.data()!;

      final userData = UserData(
          name: documentData['Name'],
          studentId: documentData['Student ID'],
          phoneNumber: documentData['Phone Number'],
          email: documentData['Email'],
          pic: documentData['Pic']);

      profileFileURL = userData.pic;

      allUsers.add(userData);
    }
  }

  Future getAllbuses() async {
    allBuses.clear();
    busNames.clear();

    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('buses').get();

      if (querySnapshot.docs.isNotEmpty) {
        for (var document in querySnapshot.docs) {
          final documentData = document.data();
          final bus = BusData(
              id: documentData['Bus ID'],
              name: documentData['Bus Name'],
              number: documentData['Bus Number'],
              seatNumber: documentData['Seat Number'],
              start: documentData['Start'],
              destination: documentData['Destination']);
          allBuses.add(bus);
          busNames.add(bus.name);
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
