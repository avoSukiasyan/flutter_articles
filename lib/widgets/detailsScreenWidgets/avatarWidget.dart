import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manufacturer/model/article.dart';

class AvatarWidgete extends StatelessWidget {
  Article article;

  AvatarWidgete({this.article});

  Widget setAvatar() {
    if (article.userImage !=null) {
      if (article.userImage.contains('https')) {
        return Image.network(
          this.article.userImage,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        );
      } else {
        return Image.file(File(this.article.userImage),
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        );
      }
    } else
      SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
            //  width: MediaQuery.of(context).size.width * 0.3,
            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Fixme useless Container
                Container(
                  child: Text(
                      '${article.userName} - ${this.article.runtimeType} hrs ago'),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(90),
                    child: setAvatar()
                  ),
                )
              ],
            )),
        Container(
          padding: EdgeInsets.only(top: 20, left: 10, right: 10),
          alignment: Alignment.centerLeft,
          child: Text(
            this.article.description,
            style: TextStyle(fontSize: 15),
          ),
        )
      ],
    );
  }
}
