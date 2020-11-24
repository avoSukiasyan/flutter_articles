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

  final void Function(int id, ChangeList action, RemoveFrom from)
      changeListItems;

  ItemWidget({@required this.from, this.article, this.changeListItems});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkResponse(
        onTap: () {
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
          child: Container(
              padding: EdgeInsets.only(left: 0, top: 10),
              child: Column(
                children: [
                  ArticleWidget(article: this.article),
                  DescriptionWidget(description: this.article.description),
                  NatureList(photos: this.article.images),
                  BottomLineWidget(),
                ],
              )),
        ));
  }
}
