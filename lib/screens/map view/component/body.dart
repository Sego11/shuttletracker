// ignore_for_file: prefer_const_constructors, prefer_const_declarations, use_build_context_synchronously, library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String kGoogleApiKey = 'AIzaSyBjJxgufd72ExWl-LIU_c_0GujNBKrIzzM';

class Body extends StatefulWidget {
  final LatLng? initialSelectedPosition;
  final String busName;

  const Body({
    Key? key,
    this.initialSelectedPosition,
    required this.busName,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  GoogleMapController? mapController;
  LatLng selectedPosition = LatLng(6.6745, -1.5716); // Default position
  LatLng? currentLocation;

  final DatabaseReference _databaseRef = FirebaseDatabase.instance.ref();
  Marker? _bruneiMarker;
  Marker? _commercialMarker;

  final PolylinePoints _polylinePoints = PolylinePoints();
  List<LatLng> _polylineCoordinates = [];
  BitmapDescriptor busIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor busStops = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    super.initState();
    widget.busName == 'Commercial Bus' ? _getCommercialCoordinates() : null;
    widget.busName == 'Brunei Bus' ? _getBruneiCoordinates() : null;

    BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty,
      'assets/images/busIcon2.png',
    ).then((icon) {
      setState(() {
        busIcon = icon;
      });
    });

    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/images/busstop.png")
        .then((icon) {
      setState(() {
        busStops = icon;
      });
    });
  }

  onMapCreated(GoogleMapController controller) {
    mapController = controller;
    if (widget.initialSelectedPosition != null) {
      mapController?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: widget.initialSelectedPosition!, zoom: 18),
      ));
    }
  }

  Future<Duration?> calculateETA(LatLng start, LatLng end) async {
    final String apiKey =
        'AIzaSyBjJxgufd72ExWl-LIU_c_0GujNBKrIzzM'; // Replace with your API key
    final String apiUrl =
        'https://maps.googleapis.com/maps/api/directions/json';

    final response = await http.get(
      Uri.parse(
        '$apiUrl?origin=${start.latitude},${start.longitude}&destination=${end.latitude},${end.longitude}&mode=driving&key=$apiKey',
      ),
    );

    if (response.statusCode == 200) {
      final directionsData = json.decode(response.body);
      final routes = directionsData['routes'] as List<dynamic>;

      if (routes.isNotEmpty) {
        final durationInSeconds =
            routes[0]['legs'][0]['duration']['value'] as int;
        return Duration(seconds: durationInSeconds);
      }
    }

    return null; // Error occurred or no route found
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
          // Now, you have the updated commercial latitude and longitude.
          // You can use this data to update the marker on the map or draw a route from the current location to the commercial location if you want.

          if (mapController != null) {
            // Update the marker for the commercial location
            setState(() {
              _commercialMarker = Marker(
                markerId: MarkerId('commercial_location'),
                position: LatLng(commercialLatitude, commercialLongitude),
                icon: busIcon,
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
                    }),
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
          // Now, you have the updated destination latitude and longitude.
          // You can use this data to update the marker on the map or draw a route from the current location to the destination location if you want.

          if (mapController != null) {
            // Update the marker for the bus destination
            setState(() {
              _bruneiMarker = Marker(
                markerId: MarkerId('brunei_location'),
                position: LatLng(destinationLatitude, destinationLongitude),
                icon: busIcon,
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
                    }),
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
                      BitmapDescriptor.hueMagenta),
                ),
              if (_bruneiMarker != null) _bruneiMarker!,
              if (_commercialMarker != null) _commercialMarker!,
             widget.busName =='Commercial Bus' ? Marker(

                markerId: MarkerId('marker1'),
                position: LatLng(6.6827, -1.5769),
                icon: busStops,
                infoWindow: InfoWindow(
                  title: 'Commercial Bus Stop',
                  onTap: () async {
                    if (_commercialMarker != null) {
                      LatLng busPosition = _commercialMarker!.position;
                      LatLng destination = LatLng(6.6827, -1.5769);

                      Duration? eta =
                          await calculateETA(busPosition, destination);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          content: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14.0),
                            child: Text(
                              'Estimated Time of Arrival: ${eta?.inMinutes} minutes ${eta?.inSeconds.remainder(60)} seconds',
                              style: TextStyle(height: 1.3),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ):Marker(markerId: MarkerId('value')),
              Marker(
                markerId: MarkerId('marker2'),
                position: LatLng(6.6691, -1.5676),
                icon: busStops,
                infoWindow: InfoWindow(title: 'KSB Bus Stop'),
                onTap: () async {
                  if (_commercialMarker != null) {
                    LatLng busPosition = _commercialMarker!.position;
                    LatLng destination = LatLng(6.6691, -1.5676);

                    Duration? eta =
                        await calculateETA(busPosition, destination);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        content: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14.0),
                          child: Text(
                            'Estimated Time of Arrival: ${eta?.inMinutes} minutes ${eta?.inSeconds.remainder(60)} seconds',
                            style: TextStyle(height: 1.3),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  } else if (_bruneiMarker != null) {
                    LatLng busPosition = _bruneiMarker!.position;
                    LatLng destination = LatLng(6.6691, -1.5676);

                    Duration? eta =
                        await calculateETA(busPosition, destination);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        content: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14.0),
                          child: Text(
                            'Estimated Time of Arrival: ${eta?.inMinutes} minutes ${eta?.inSeconds.remainder(60)} seconds',
                            style: TextStyle(height: 1.3),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
              widget.busName== 'Brunei Bus'?
              Marker(
                markerId: MarkerId('marker3'),
                position: LatLng(6.6704, -1.5742),
                icon: busStops,
                infoWindow: InfoWindow(title: 'Brunei Bus Stop'),
                onTap: () async {
                  if (_bruneiMarker != null) {
                    LatLng busPosition = _bruneiMarker!.position;
                    LatLng destination = LatLng(6.6704, -1.5742);

                    Duration? eta =
                        await calculateETA(busPosition, destination);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        content: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14.0),
                          child: Text(
                            'Estimated Time of Arrival: ${eta?.inMinutes} minutes ${eta?.inSeconds.remainder(60)} seconds',
                            style: TextStyle(height: 1.3),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ): Marker(markerId: MarkerId('value')),
              Marker(
                markerId: MarkerId('marker4'),
                position: LatLng(6.6752, -1.5679),
                icon: busStops,
                infoWindow: InfoWindow(title: 'Casley Hayford Bus Stop'),
                onTap: () async {
                  if (_commercialMarker != null) {
                    LatLng busPosition = _commercialMarker!.position;
                    LatLng destination = LatLng(6.6752, -1.5679);

                    Duration? eta =
                        await calculateETA(busPosition, destination);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        content: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14.0),
                          child: Text(
                            'Estimated Time of Arrival: ${eta?.inMinutes} minutes ${eta?.inSeconds.remainder(60)} seconds',
                            style: TextStyle(height: 1.3),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  } else if (_bruneiMarker != null) {
                    LatLng busPosition = _bruneiMarker!.position;
                    LatLng destination = LatLng(6.6752, -1.5679);

                    Duration? eta =
                        await calculateETA(busPosition, destination);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        content: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14.0),
                          child: Text(
                            'Estimated Time of Arrival: ${eta?.inMinutes} minutes ${eta?.inSeconds.remainder(60)} seconds',
                            style: TextStyle(height: 1.3),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
              Marker(
                markerId: MarkerId('marker5'),
                position: LatLng(6.6745, -1.5676),
                icon: busStops,
                infoWindow: InfoWindow(title: 'Pharmacy Bus Stop'),
                onTap: () async {
                  if (_commercialMarker != null) {
                    LatLng busPosition = _commercialMarker!.position;
                    LatLng destination = LatLng(6.6745, -1.5676);

                    Duration? eta =
                        await calculateETA(busPosition, destination);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        content: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14.0),
                          child: Text(
                            'Estimated Time of Arrival: ${eta?.inMinutes} minutes ${eta?.inSeconds.remainder(60)} seconds',
                            style: TextStyle(height: 1.3),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  } else if (_bruneiMarker != null) {
                    LatLng busPosition = _bruneiMarker!.position;
                    LatLng destination = LatLng(6.6745, -1.5676);

                    Duration? eta =
                        await calculateETA(busPosition, destination);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        content: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14.0),
                          child: Text(
                            'Estimated Time of Arrival: ${eta?.inMinutes} minutes ${eta?.inSeconds.remainder(60)} seconds',
                            style: TextStyle(height: 1.3),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
              widget.busName == 'Commercial Bus' ?
              Marker(
                markerId: MarkerId('marker6'),
                position: LatLng(6.6793, -1.5728),
                icon: busStops,
                infoWindow: InfoWindow(title: 'Conti Bus Stop B'),
                onTap: () async {
                  if (_commercialMarker != null) {
                    LatLng busPosition = _commercialMarker!.position;
                    LatLng destination = LatLng(6.6793, -1.5728);

                    Duration? eta =
                        await calculateETA(busPosition, destination);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        content: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14.0),
                          child: Text(
                            'Estimated Time of Arrival: ${eta?.inMinutes} minutes ${eta?.inSeconds.remainder(60)} seconds',
                            style: TextStyle(height: 1.3),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ):Marker(markerId: MarkerId('value')),

              widget.busName == 'Commercial Bus' ?

              Marker(
                markerId: MarkerId('marker7'),
                position: LatLng(6.6796, -1.5730),
                icon: busStops,
                infoWindow: InfoWindow(title: 'Conti Bus Stop B'),
                onTap: () async {
                  if (_commercialMarker != null) {
                    LatLng busPosition = _commercialMarker!.position;
                    LatLng destination = LatLng(6.6796, -1.5730);

                    Duration? eta =
                        await calculateETA(busPosition, destination);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        content: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14.0),
                          child: Text(
                            'Estimated Time of Arrival: ${eta?.inMinutes} minutes ${eta?.inSeconds.remainder(60)} seconds',
                            style: TextStyle(height: 1.3),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ):Marker(markerId: MarkerId('value')),
            },
            polylines: {
              // Polyline for the fixed line between the two coordinates
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
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
