import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:manufacturer/model/article.dart';

class UserNameWidget extends StatelessWidget {
  Article article;

  UserNameWidget({@required this.article});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // Fixme use Padding
    return Container(
      padding: EdgeInsets.only(top: 10, left: 10),
      child: Text(
        this.article.title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
        // Fixme maxLines = 100 ?
        maxLines: 100,
      ),
    );
  }
}
