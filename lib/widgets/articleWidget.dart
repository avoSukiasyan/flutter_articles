import 'package:flutter/material.dart';
import 'package:manufacturer/model/article.dart';

class ArticleWidget extends StatelessWidget {
  Article article;

  ArticleWidget({this.article});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        padding: EdgeInsets.only(right: 20),
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(right: 60, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    width: 0,
                    child: Container(
                        color: Colors.white), // replace with your image
                  ),
                  Text(
                    '${this.article.userName} - ${this.article.elapsedTimeInHour} hrs ago',
                    maxLines: 1,
                    style: TextStyle(fontSize: 15, fontFamily: 'NotoSansJP'),
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
            Stack(
              children: [
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        '${this.article.userImage}',
                        width: 70,
                        height: 70,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
