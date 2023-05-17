import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SimpleMap extends StatefulWidget {
  const SimpleMap({super.key});

  @override
  State<SimpleMap> createState() => _SimpleMapState();
}

class _SimpleMapState extends State<SimpleMap> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition initialPosition =
      CameraPosition(target: LatLng(39.57, 32.53), zoom: 10.0);
  static const CameraPosition targetPosition =
      CameraPosition(target: LatLng(41.0122, 28.976), zoom: 14.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          initialCameraPosition: initialPosition,
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          }),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            goSomewhere();
          },
          label: Text("Go!"),
          icon: Icon(Icons.directions_walk)),
    );
  }

  Future<void> goSomewhere() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(targetPosition));
  }
}
