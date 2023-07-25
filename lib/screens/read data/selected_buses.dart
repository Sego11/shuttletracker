import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shuttle_tracker_app/constants.dart';
import 'package:shuttle_tracker_app/model/selected_bus_model.dart';
import 'package:shuttle_tracker_app/model/user.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/bus/sub/adding%20bus/adding_bus_screen.dart';
import 'package:shuttle_tracker_app/screens/tab%20view/settings/profile/editprofile/component/body.dart';

List<dynamic> allUsers = [];

class ReadData {
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
}
