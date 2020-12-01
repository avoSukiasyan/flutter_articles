import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manufacturer/model/article.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:ui' as ui;

import 'package:manufacturer/widgets/dismissWidget.dart';

class MapScreen extends StatefulWidget {
  Article article;

  MapScreen({@required this.article});

  @override
  _MapScreen createState() => _MapScreen();
}

class _MapScreen extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  String _mapStyle;

  CameraPosition setPosition() {
    return CameraPosition(
      target: LatLng(
          widget.article.location.latitude, widget.article.location.longitude),
      zoom: 5,
    );
  }

  Future<void> _goMap() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(setPosition()));
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    rootBundle.loadString('assets/json/mapStyle.txt').then((value) {
      _mapStyle = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        DismissWidget(dismissCallBack: null),
        Center(
            child: BackdropFilter(
          filter: ui.ImageFilter.blur(
            sigmaX: 6.0,
            sigmaY: 6.0,
          ),
          child: Container(
            width: 300,
            height: 300,
            child: GoogleMap(
              initialCameraPosition: setPosition(),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                controller.setMapStyle(_mapStyle);
              },
            ),
          ),
        ))
      ],
    );
  }
}
