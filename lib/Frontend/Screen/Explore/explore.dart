import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:solution_chanllenge/Frontend/Screen/Explore/Explore%20Widgets/search_bar.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final Location _locationController = Location();
  final Completer<GoogleMapController> _mapController = Completer<GoogleMapController>();
  LatLng? _currentPosition;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.42796133580664, 75.085749655962),
    zoom: 11.4746,
  );

  @override
  void initState() {
    super.initState();
    getLocationUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              if (!_mapController.isCompleted) {
                _mapController.complete(controller);
              }
            },
            initialCameraPosition: _kGooglePlex,
            markers: _currentPosition == null
                ? {}
                : {
              Marker(
                markerId: const MarkerId("_currentLocation"),
                icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
                position: _currentPosition!,
              ),
            },
          ),
          Searchbar(),
        ],
      ),
    );
  }

  Future<void> _cameraToPosition(LatLng position) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition newCameraPosition = CameraPosition(target: position, zoom: 15);
    await controller.animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));
  }

  Future<void> getLocationUpdate() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

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
        LatLng newPosition = LatLng(currentLocation.latitude!, currentLocation.longitude!);
        setState(() {
          _currentPosition = newPosition;
        });
        _cameraToPosition(newPosition);
      }
    });
  }
}
