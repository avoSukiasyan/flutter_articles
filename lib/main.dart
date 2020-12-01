import 'package:flutter/material.dart';
import 'package:manufacturer/Screens/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

// Fixme why StatefulWidget, could be Stateless
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
