import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  Location _locationController = Location();
  final Completer<GoogleMapController> _mapController = Completer<GoogleMapController>();
  LatLng? _currentPosition;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.42796133580664, 75.085749655962),
    zoom: 11.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(20.42796133580664, 75.085749655962),
    tilt: 59.440717697143555,
    zoom: 13.151926040649414,
  );

  @override
  void initState() {
    super.initState();
    getLocationUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GoogleMap(
        onMapCreated: ((GoogleMapController controller)=> _mapController.complete(controller)),
        initialCameraPosition: _kGooglePlex,
        markers: {
          if (_currentPosition != null)
            Marker(
              markerId: const MarkerId("_currentLocation"),
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
              position: _currentPosition!,
            ),
        },
      ),
    );
  }
  Future<void> _cameraToPosition(LatLng position) async{
    final GoogleMapController controller =  await _mapController.future;
    CameraPosition newCameraPosition = CameraPosition(target: position, zoom:10);
    await controller.animateCamera(CameraUpdate.newCameraPosition(newCameraPosition),);
  }

  Future<void> getLocationUpdate() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    // Check if location services are enabled
    _serviceEnabled = await _locationController.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
      if (!_serviceEnabled) {
        debugPrint("Location services are disabled.");
        return;
      }
    }


    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted == PermissionStatus.deniedForever) {
        debugPrint("Location permissions are permanently denied.");
        return;
      }
    }

    if (_permissionGranted != PermissionStatus.granted) {
      debugPrint("Location permission not granted.");
      return;
    }

    _locationController.onLocationChanged.listen((LocationData currentLocation) {
      if (currentLocation.latitude != null && currentLocation.longitude != null) {
        setState(() {
          _currentPosition = LatLng(currentLocation.latitude!, currentLocation.longitude!);
          _cameraToPosition(_currentPosition!);
        });
      }
    });
  }
}