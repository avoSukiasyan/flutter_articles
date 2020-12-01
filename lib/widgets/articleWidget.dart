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
        // Fixme can be removed
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: Stack(
          children: [
            // FixMe better to use padding
            Container(
              // FixMe use expanded (see simplified sample)
              padding: EdgeInsets.only(right: 60, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${this.article.userName} - ${this.article.elapsedTimeInHour} hrs ago',
                    maxLines: 1,
                    style: TextStyle(fontSize: 15, fontFamily: 'NotoSansJP'),
                  ),
                  // Fixme use text overflow ellipsize
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

  // Fixme simplified
  // Widget build(BuildContext buildContext) => Padding(
  //   padding: const EdgeInsets.all(8.0),
  //   child: Row(
  //         children: [
  //           Expanded(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   '${this.article.userName} - ${this.article.elapsedTimeInHour} hrs ago',
  //                   maxLines: 1,
  //                   style: TextStyle(fontSize: 15, fontFamily: 'NotoSansJP'),
  //                 ),
  //                 Text(
  //                   '${this.article.title}',
  //                   maxLines: 1,
  //                   style: TextStyle(
  //                     fontSize: 20,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           ClipRRect(
  //             borderRadius: BorderRadius.circular(90),
  //             child: Image.network(
  //               '${this.article.userImage}',
  //               width: 48,
  //               height: 48,
  //             ),
  //           ),
  //         ],
  //       ),
  // );
}
