import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shuttle_tracker_app/constants.dart';
import 'package:shuttle_tracker_app/model/selected_bus_model.dart';

class ReadData {
  Future getSelectedBuses() async {
    final document = await FirebaseFirestore.instance
        .collection('added buses')
        .where('User ID', isEqualTo: loggedUserID)
        .get();

    if (document.docs.isNotEmpty) {
      List<String> selectedBusIDs = document.docs.single.get('Added Bus IDs');

      selectedBusIDs.forEach(
        (busId) async {
          final document = await FirebaseFirestore.instance
              .collection('buses')
              .doc(busId)
              .get();
          final documentData = document.data()!;

          final selectedBusData = SelectedBusModel(
              name: documentData['Bus Name'],
              number: documentData['Bus Number'],
              start: documentData['Start'],
              destination: documentData['Bus Name'],
              seatNumber: documentData['Bus Name'],
              id: documentData['Bus Name']);

          
        },
      );
    }
    ;
  }
}
