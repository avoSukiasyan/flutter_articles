import 'package:flutter/material.dart';
import 'package:manufacturer/model/article.dart';

class ArticleWidget extends StatelessWidget {
  Article article;

  ArticleWidget({this.article});

  @override
Widget build(BuildContext buildContext) => Padding(
  padding: const EdgeInsets.all(8.0),
  child: Row(
        children: [
          Expanded(
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
          ClipRRect(
            borderRadius: BorderRadius.circular(90),
            child: Image.network(
              '${this.article.userImage}',
              width: 48,
              height: 48,
            ),
          ),
        ],
      ),
);
}
