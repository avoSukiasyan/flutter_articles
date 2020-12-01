import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'package:manufacturer/Screens/dashboard.dart';

void main() {
  GoogleMap.init("AIzaSyBiRV3-06C5Fbk1qrPlzRmgTEjSMhBk0Uo");
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Dashboard(),
    );
  }
}
