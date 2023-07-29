import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TestMap extends StatefulWidget {
  final LatLng? initialSelectedPosition;

  const TestMap({Key? key, this.initialSelectedPosition}) : super(key: key);

  @override
  _TestMapState createState() => _TestMapState();
}

class _TestMapState extends State<TestMap> {
  GoogleMapController? mapController;
  LatLng selectedPosition = LatLng(6.6745, -1.5716); // Default position
  LatLng? currentLocation;

  DatabaseReference _databaseRef = FirebaseDatabase.instance.ref();
  Marker? _destinationMarker;
  Marker? _commercialMarker;

  // Coordinates for the fixed poly line
  LatLng coordinate1 = LatLng(6.6691, -1.5676);
  LatLng coordinate2 = LatLng(6.6704, -1.5742);

  @override
  void initState() {
    super.initState();
    // _getLocation();
    _getCommercialCoordinates();
    _getDestinationCoordinates();
  }

  onMapCreated(GoogleMapController controller) {
    mapController = controller;
    if (widget.initialSelectedPosition != null) {
      mapController?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: widget.initialSelectedPosition!, zoom: 18),
      ));
    }
  }

  Future<void> _getCommercialCoordinates() async {
    DatabaseReference commercialRef = _databaseRef.child('GPS');

    // Set up a stream to listen for changes in the commercial coordinates
    commercialRef.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;

      if (data != null) {
        double? commercialLatitude = data['f_latitude'] as double?;
        double? commercialLongitude = data['f_longitude'] as double?;

        if (commercialLatitude != null && commercialLongitude != null) {
          // Now, you have the updated commercial latitude and longitude.
          // You can use this data to update the marker on the map or draw a route from the current location to the commercial location if you want.

          if (mapController != null) {
            // Update the marker for the commercial location
            setState(() {
              _commercialMarker = Marker(
                markerId: MarkerId('commercial_location'),
                position: LatLng(commercialLatitude, commercialLongitude),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueOrange,
                ),
                infoWindow: InfoWindow(title: 'Commercial Bus', onTap: () {}),
              );
            });
          }
        }
      }
    });
  }

  Future<void> _getDestinationCoordinates() async {
    DatabaseReference destinationRef = _databaseRef.child('Commercial');

    // Set up a stream to listen for changes in the destination coordinates
    destinationRef.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;

      if (data != null) {
        double? destinationLatitude = data['f_latitude'] as double?;
        double? destinationLongitude = data['f_longitude'] as double?;

        if (destinationLatitude != null && destinationLongitude != null) {
          // Now, you have the updated destination latitude and longitude.
          // You can use this data to update the marker on the map or draw a route from the current location to the destination location if you want.

          if (mapController != null) {
            // Update the marker for the bus destination
            setState(() {
              _destinationMarker = Marker(
                markerId: MarkerId('bus_destination'),
                position: LatLng(destinationLatitude, destinationLongitude),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueBlue),
                infoWindow: InfoWindow(
                  title: 'Brunei Bus',
                ),
              );
            });
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            cameraTargetBounds: CameraTargetBounds(LatLngBounds(
              northeast: LatLng(6.755010, -1.423322),
              southwest: LatLng(6.599917, -1.748450),
            )),
            initialCameraPosition: CameraPosition(
              target: currentLocation ?? selectedPosition,
              zoom: 14.4746,
            ),
            onMapCreated: onMapCreated,
            markers: {
              if (currentLocation != null)
                Marker(
                  markerId: MarkerId('user_location'),
                  position: currentLocation!,
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueAzure),
                ),
              if (_destinationMarker != null) _destinationMarker!,
              if (_commercialMarker != null) _commercialMarker!,
            },
            polylines: {
              // Polyline for the fixed line between the two coordinates
              Polyline(
                polylineId: PolylineId('fixed_polyline'),
                color: Colors.red,
                width: 5,
                points: [coordinate1, coordinate2],
              ),
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: true,
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      elevation: 10,
                      backgroundColor: Colors.grey[50],
                      foregroundColor: Colors.blueGrey,
                      onPressed: () async {
                        bool serviceEnabled =
                            await Geolocator.isLocationServiceEnabled();
                        if (serviceEnabled) {
                          Position pos = await Geolocator.getCurrentPosition();
                          LatLng currentPos =
                              LatLng(pos.latitude, pos.longitude);
                          setState(() {
                            currentLocation = currentPos;
                            mapController?.animateCamera(
                              CameraUpdate.newCameraPosition(
                                CameraPosition(target: currentPos, zoom: 18),
                              ),
                            );
                          });
                        }
                      },
                      child: const Icon(Icons.my_location),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
