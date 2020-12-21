import 'package:flutter/material.dart';
import 'package:manufacturer/model/Location.dart';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:manufacturer/model/Location.dart';

typedef MarkerOutput = void Function( Location loc );

class MapScreen extends StatefulWidget {
  Location location;
  MarkerOutput out;

  MapScreen({this.location, this.out});

  @override
  _MapScreen createState() => _MapScreen();
}

class _MapScreen extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  String _mapStyle;

  CameraPosition setPosition() {
    if (widget.location == null) {
      return CameraPosition(
        target: LatLng(40.8987987, 41.080808),
        zoom: 5,
      );
    }
    return CameraPosition(
      target: LatLng(widget.location.latitude, widget.location.longitude),
      zoom: 5,
    );
  }

  List<Marker> addMarkers() {
    List<Marker> _markers = [];
    if (widget.location != null) {
      _markers.addAll([
        Marker(
          markerId: MarkerId('Location'),
          infoWindow: InfoWindow(title: 'The title of the marker'),
          position: LatLng(widget.location.latitude, widget.location.longitude),
        )
      ]);
    }
    return _markers;
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
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            color: Colors.white.withOpacity(0.8),
            width: 500,
            height: 800,
            child: Center(
                child: Container(
              color: Colors.transparent,
              width: 300,
              height: 400,
              child: GoogleMap(
                  onTap: (loc) {
                    var location = Location();
                    location.latitude = loc.latitude;
                    location.longitude = loc.longitude;
                    widget.out(location);
                    Navigator.pop(context);
                  },
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  initialCameraPosition: setPosition(),
                  markers: Set<Marker>.of(addMarkers()),
                  mapType: MapType.normal,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  }),
            )),
          ),
        ));
  }
}
