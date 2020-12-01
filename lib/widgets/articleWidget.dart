import 'package:flutter/material.dart';
import 'package:manufacturer/model/article.dart';
import 'package:flutter/material.dart';

class ArticleWidget extends StatelessWidget {
  Article article;

  ArticleWidget({this.article});


  Widget location() {
    return article.location != null ? Container(
      alignment: Alignment.center,
      child: Image.asset(
        'assets/images/location.jpg',
        width: 20,
        height: 20,
      ),
    ) : SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        padding: EdgeInsets.only(right: 7, left: 10),
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            location(),
            Container(
              width: MediaQuery.of(context).size.width * 0.78,
             // padding: EdgeInsets.only(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomRight,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    '${this.article.userImage}',
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
