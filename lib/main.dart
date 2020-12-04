import 'package:flutter/material.dart';
import 'package:manufacturer/Screens/dashboard.dart';

void main() {
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
