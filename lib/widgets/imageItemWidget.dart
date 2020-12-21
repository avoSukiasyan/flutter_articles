import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

class ImageItemWidget extends StatelessWidget {
  String imageUrl;

  ImageItemWidget({this.imageUrl});

  Widget setImage() {
    if (imageUrl.contains('https')) {
      return Image.network(
        this.imageUrl,
        height: 130,
        width: 140,
        fit: BoxFit.fill,
        errorBuilder:
            (BuildContext context, Object exception, StackTrace stackTrace) {
          return Text('Your error widget...');
        },
      );
    } else {
      Image.file(File(imageUrl), height: 130, width: 140, fit: BoxFit.fill,
          errorBuilder:
              (BuildContext context, Object exception, StackTrace stackTrace) {
        return Text('Your error widget...');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [setImage(), SizedBox()],
    );
  }
}
