import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //GPS coordinates of Massey University, New Zealand. Latitude: -41.3009 Longitude: 174.7720. :
  static const LatLng schoolLatLng = LatLng(-41.3009, 174.7720);
  static const LatLng companyLatLng = LatLng(37.5233273, 126.921252);

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  static const CameraPosition initPos =
      CameraPosition(target: schoolLatLng, zoom: 15.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          // mapType: MapType.hybrid,
          initialCameraPosition: initPos,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          }),
    );
  }
}
