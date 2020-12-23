import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

class ImageItemWidget extends StatelessWidget {
  String imageUrl;

  ImageItemWidget({this.imageUrl});

  Widget articleImage() {
    if (imageUrl.contains('https')) {
      return Image.network(
        this.imageUrl,
        height: 114,
        width: 169,
        fit: BoxFit.cover,
        errorBuilder:
            (BuildContext context, Object exception, StackTrace stackTrace) {
          return Text('Your error widget...');
        },
      );
    } else {
      Image.file(File(imageUrl), height: 114, width: 169, fit: BoxFit.cover,
          errorBuilder:
              (BuildContext context, Object exception, StackTrace stackTrace) {
        return Text('Your error widget...');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return articleImage();
  }
}
