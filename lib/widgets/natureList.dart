import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:manufacturer/widgets/imageItemWidget.dart';

class NatureList extends StatelessWidget {
  // Fixme change to final List<String> photos;
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
    return SizedBox(
        height: checkPhotos(),
        child: photos.length == 0
            // Fixme change to Container,
            // Fixme why is this
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
                    .map((String item) => Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8.0),
                        child: ImageItemWidget(imageUrl: item)))
                    .toList(),
              ));
  }
}
