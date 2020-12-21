import 'dart:io';

import 'package:flutter/material.dart';
import 'package:manufacturer/model/article.dart';
import 'package:flutter/material.dart';

class ArticleWidget extends StatelessWidget {
  Article article;

  ArticleWidget({this.article});

  Widget location() {
    return article.location != null
        ? Container(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/location.jpg',
              width: 15,
              height: 15,
            ),
          )
        : SizedBox();
  }

  Image setAvatar() {
    if (article.userImage == null) {
      return Image();
    }
    if (article.userImage.contains('https')) {
      return Image.network(this.article.userImage,
        width: 48,
        height: 48,
        fit: BoxFit.cover,
      );
    } else {
      return Image.file( File(this.article.userImage),
        width: 48,
        height: 48,
        fit: BoxFit.cover,
      );
    }
  }

  @override
  Widget build(BuildContext buildContext) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      location(),
                      Text(
                        '${this.article.userName} - ${this.article.elapsedTimeInHour} hrs ago',
                        maxLines: 1,
                        style:
                            TextStyle(fontSize: 15, fontFamily: 'NotoSansJP'),
                      ),
                    ],
                  ),
                  Text(
                    '${this.article.title}',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: setAvatar()
            ),
          ],
        ),
      );
}
