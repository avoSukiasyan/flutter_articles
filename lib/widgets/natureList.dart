import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:manufacturer/widgets/imageItemWidget.dart';

class NatureList extends StatelessWidget {
  List<String> photos = [];

  NatureList({this.photos});

  double checkPhotos() {
    if (photos.length == 0) {
      return 20;
    } else {
      return 120;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        padding: EdgeInsets.only(right: 20, left: 10, top: 6),
        height: checkPhotos(),
        child: photos.length == 0
            ? SizedBox(
                child: Container(
                  color: Colors.white,
                ),
                height: 10,
                width: 10,
              )
            : ListView(
                scrollDirection: Axis.horizontal,
                children: this
                    .photos
                    .map((String item) => ImageItemWidget(imageUrl: item))
                    .toList(),
              ));
  }
}
