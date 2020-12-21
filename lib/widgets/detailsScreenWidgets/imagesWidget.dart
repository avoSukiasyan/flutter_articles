import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:manufacturer/model/article.dart';

class ImagesWidget extends StatelessWidget {
  Article article;

  ImagesWidget({@required this.article});

  Image setImage( String imagePath) {
    if (imagePath.contains('https')) {
      return Image.network(
        imagePath,
        fit: BoxFit.fill,
        errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
          return Text('Your error widget...');
        },
      );
    } else {
      return Image.file( File(imagePath),
        fit: BoxFit.fill,
        errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
          return Text('Your error widget...');
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // Fixme better to use slivers
    return Container(
        width: MediaQuery.of(context).size.width,
        height: (this.article.images.length * 150).toDouble(),
        child: GridView(
          padding: EdgeInsets.only(top: 10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 2, mainAxisSpacing: 2),
          physics: BouncingScrollPhysics(),
          children: this.article.images.map((String item) {
            return Container(
                padding: EdgeInsets.all(2),
                child: setImage(item));
          }).toList(),
        ));
  }
}

//this.photos.map((String item) => ImageItemWidget(imageUrl: item)).toList(),
