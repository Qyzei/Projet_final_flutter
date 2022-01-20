// ignore_for_file: prefer_const_constructors

import '/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatelessWidget {
  final String name;
  final String address;
  MapsPage(this.name, this.address);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Location',
          textAlign: TextAlign.center,
        ),
        backgroundColor: purple,
      ),
      body: SafeArea(
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target: LatLng(-6.1741672, 106.8193037),
            zoom: 14.0,
          ),
          markers: {
            Marker(
                markerId: MarkerId("-6.1741672, 106.8193037"),
                position: LatLng(-6.1741672, 106.8193037),
                infoWindow: InfoWindow(title: name, snippet: address),
                icon: BitmapDescriptor.defaultMarker),
          },
        ),
      ),
    );
  }
}
