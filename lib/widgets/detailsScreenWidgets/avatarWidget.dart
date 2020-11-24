import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manufacturer/model/article.dart';

class AvatarWidgete extends StatelessWidget {
  Article article;

  AvatarWidgete({this.article});

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
                Container(
                  child: Text('${article.userName} - ${this.article.runtimeType} hrs ago'),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                      this.article.userImage,
                      width: 60,
                      height: 60,
                    ),
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
