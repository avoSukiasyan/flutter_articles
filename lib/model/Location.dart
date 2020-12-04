import 'dart:wasm';
import 'package:flutter/cupertino.dart';

class Location {
  double latitude;
  double longitude;

  Location({@required latitude, @required longitude});

  Location.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data["longitude"] = this.longitude;
    return data;
  }
}
