import 'package:flutter/material.dart';
import 'package:manufacturer/Screens/detailScreen.dart';
import 'package:manufacturer/enum/enum.dart';
import 'package:manufacturer/model/article.dart';
import 'package:manufacturer/widgets/articleWidget.dart';
import 'package:manufacturer/widgets/bottomLineWidget.dart';
import 'package:manufacturer/widgets/descriptionWidget.dart';
import 'package:manufacturer/widgets/natureList.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemWidget extends StatelessWidget {
  Article article;

  RemoveFrom from;

  // Fixme use typeAlias
  final void Function(int id, ChangeList action, RemoveFrom from)
      changeListItems;

  ItemWidget({@required this.from, this.article, this.changeListItems});

  Widget imageList() {
    return this.article.images.isEmpty != true ?  NatureList(photos: this.article.images) : SizedBox(width: 5, height: 5);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkResponse(
        onTap: () {
          // Fixme move tap handling out of item
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailScreen(
                    from: this.from,
                    article: this.article,
                    changeListItems: this.changeListItems,
                  )));
        },
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          actions: [
            IconSlideAction(
              color: Colors.red,
              caption: 'Remove',
              icon: Icons.delete,
              onTap: () => changeListItems(
                  this.article.id, ChangeList.removeItem, this.from),
            ),
          ],
          // Use padding instead
          child: Container(
            // Fixme left:0, default is 0
              padding: EdgeInsets.only(left: 0, top: 10),
              child: Column(
                children: [
                  // Fixme, do not separate content to different classes,
                  // as those classes are only used here
                  ArticleWidget(article: this.article),
                  DescriptionWidget(description: this.article.description),
                  imageList(),
                  BottomLineWidget(),
                ],
              )),
        ));
  }
}
