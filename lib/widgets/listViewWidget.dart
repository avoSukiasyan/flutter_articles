import 'package:flutter/cupertino.dart';
import 'package:manufacturer/enum/enum.dart';
import 'package:manufacturer/model/article.dart';
import 'package:manufacturer/widgets/ItemWidget.dart';

class ListViewWidget extends StatelessWidget {
  List<Article> articles;
  RemoveFrom from;

  void Function(int id, ChangeList action, RemoveFrom from) changeListItems;

  ListViewWidget({@required this.articles, this.changeListItems, this.from});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      scrollDirection: Axis.vertical,
      children: articles
          .map((item) => ItemWidget(
                from: this.from,
                article: item,
                changeListItems: changeListItems,
              ))
          .toList(),
    );
  }
}
