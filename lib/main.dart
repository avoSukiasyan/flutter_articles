import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'package:manufacturer/Screens/dashboard.dart';

void main() {
  GoogleMap.init("AIzaSyBiRV3-06C5Fbk1qrPlzRmgTEjSMhBk0Uo");
  runApp(MyApp());
}

// Fixme why StatefulWidget, could be Stateless
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Dashboard(),
    );
  }
}
