import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

const String kGoogleApiKey = 'YOUR_GOOGLE_MAPS_API_KEY';

class EstimatedPolyTestMap extends StatefulWidget {
  final LatLng? initialSelectedPosition;

  const EstimatedPolyTestMap({Key? key, this.initialSelectedPosition}) : super(key: key);

  @override
  _EstimatedPolyTestMapState createState() => _EstimatedPolyTestMapState();
}

class _EstimatedPolyTestMapState extends State<EstimatedPolyTestMap> {
  GoogleMapController? mapController;
  LatLng selectedPosition = LatLng(6.6745, -1.5716); // Default position
  LatLng? currentLocation;

  DatabaseReference _databaseRef = FirebaseDatabase.instance.ref();
  Marker? _destinationMarker;
  Marker? _commercialMarker;

  PolylinePoints _polylinePoints = PolylinePoints();
  List<LatLng> _polylineCoordinates = [];

  @override
  void initState() {
    super.initState();
    _getCommercialCoordinates();
    _getBruneiCoordinates();
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
    DatabaseReference commercialRef = _databaseRef.child('Commercial');

    commercialRef.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        double? commercialLatitude = data['f_latitude'] as double?;
        double? commercialLongitude = data['f_longitude'] as double?;

        if (commercialLatitude != null && commercialLongitude != null) {
          setState(() {
            _commercialMarker = Marker(
              markerId: MarkerId('commercial_location'),
              position: LatLng(commercialLatitude, commercialLongitude),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueOrange,
              ),
              infoWindow: InfoWindow(title: 'Commercial Bus'),
            );
          });
        }
      }
    });
  }

  Future<void> _getBruneiCoordinates() async {
    DatabaseReference destinationRef = _databaseRef.child('GPS');

    destinationRef.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        double? destinationLatitude = data['f_latitude'] as double?;
        double? destinationLongitude = data['f_longitude'] as double?;

        if (destinationLatitude != null && destinationLongitude != null) {
          setState(() {
            _destinationMarker = Marker(
              markerId: MarkerId('bus_destination'),
              position: LatLng(destinationLatitude, destinationLongitude),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueBlue,
              ),
              infoWindow: InfoWindow(title: 'Brunei Bus'),
            );
          });
        }
      }
    });
  }

  Future<void> _drawPolyline(LatLng start, LatLng end) async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await _polylinePoints.getRouteBetweenCoordinates(
      kGoogleApiKey,
      PointLatLng(start.latitude, start.longitude),
      PointLatLng(end.latitude, end.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    setState(() {
      _polylineCoordinates = polylineCoordinates;
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
                    BitmapDescriptor.hueAzure,
                  ),
                ),
              if (_destinationMarker != null) _destinationMarker!,
              if (_commercialMarker != null) _commercialMarker!,
            },
            polylines: {
              Polyline(
                polylineId: PolylineId('fixed_polyline'),
                color: Colors.red,
                width: 3,
                points: _polylineCoordinates,
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
                            Position pos =
                                await Geolocator.getCurrentPosition();
                            LatLng currentPos =
                                LatLng(pos.latitude, pos.longitude);
                            setState(() {
                              currentLocation = currentPos;
                              mapController?.animateCamera(
                                CameraUpdate.newCameraPosition(
                                  CameraPosition(
                                    target: currentPos,
                                    zoom: 18,
                                  ),
                                ),
                              );
                            });
                          }
                        },
                        child: const Icon(Icons.my_location),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
