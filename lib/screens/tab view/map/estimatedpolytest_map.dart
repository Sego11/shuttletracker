import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

const String kGoogleApiKey = 'AIzaSyBjJxgufd72ExWl-LIU_c_0GujNBKrIzzM';

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
  String _estimatedTime = '';

  // A constant average speed in meters per second (you can adjust this)
  static const double AVERAGE_SPEED_MPS = 10.0;

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
    bool isBusButtonClicked = false;
    DatabaseReference commercialRef = _databaseRef.child('Commercial');

    // Set up a stream to listen for changes in the commercial coordinates
    commercialRef.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;

      if (data != null) {
        double? commercialLatitude = data['f_latitude'] as double?;
        double? commercialLongitude = data['f_longitude'] as double?;

        if (commercialLatitude != null && commercialLongitude != null) {
          if (mapController != null) {
            // Update the marker for the commercial location
            setState(() {
              _commercialMarker = Marker(
                markerId: MarkerId('commercial_location'),
                position: LatLng(commercialLatitude, commercialLongitude),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueOrange,
                ),
                infoWindow: InfoWindow(
                  title: 'Commercial Bus',
                  onTap: () {
                    isBusButtonClicked = !isBusButtonClicked;
                    if (isBusButtonClicked) {
                      setState(() {
                        _drawPolyline(
                          LatLng(6.6827, -1.5769),
                          LatLng(6.6691, -1.5676),
                        );
                      });
                    } else {
                      _drawPolyline(
                        LatLng(0, 0),
                        LatLng(0, 0),
                      );
                    }
                  },
                ),
              );
            });
          }
        }
      }
    });
  }

  Future<void> _getBruneiCoordinates() async {
    bool isBusButtonClicked = false;
    DatabaseReference destinationRef = _databaseRef.child('GPS');

    // Set up a stream to listen for changes in the destination coordinates
    destinationRef.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;

      if (data != null) {
        double? destinationLatitude = data['f_latitude'] as double?;
        double? destinationLongitude = data['f_longitude'] as double?;

        if (destinationLatitude != null && destinationLongitude != null) {
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
                  onTap: () {
                    isBusButtonClicked = !isBusButtonClicked;
                    if (isBusButtonClicked) {
                      setState(() {
                        _drawPolyline(
                          LatLng(6.6691, -1.5676),
                          LatLng(6.6704, -1.5742),
                        );
                      });
                    } else {
                      _drawPolyline(
                        LatLng(0, 0),
                        LatLng(0, 0),
                      );
                    }
                  },
                ),
              );
            });
          }
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
      _estimatedTime = calculateEstimatedTime(start, end);
    });
  }

  String calculateEstimatedTime(LatLng start, LatLng end) {
    double distanceInMeters = Geolocator.distanceBetween(
      start.latitude,
      start.longitude,
      end.latitude,
      end.longitude,
    );
    double estimatedTimeInSeconds = distanceInMeters / AVERAGE_SPEED_MPS;
    Duration duration = Duration(seconds: estimatedTimeInSeconds.toInt());
    String formattedTime =
        '${duration.inMinutes} min ${duration.inSeconds.remainder(60)} sec';
    return formattedTime;
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
                  SizedBox(height: 10),
                  if (_estimatedTime.isNotEmpty)
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(color: Colors.grey, blurRadius: 3)
                        ],
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Text('Estimated Time: $_estimatedTime'),
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
