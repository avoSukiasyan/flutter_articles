import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manufacturer/Screens/mapScreen.dart';
import 'package:manufacturer/enum/enum.dart';
import 'package:manufacturer/model/article.dart';
import 'package:manufacturer/widgets/detailsScreenWidgets/avatarWidget.dart';
import 'package:manufacturer/widgets/detailsScreenWidgets/imagesWidget.dart';
import 'package:manufacturer/widgets/detailsScreenWidgets/userNameWidget.dart';

class DetailScreen extends StatefulWidget {
  Article article;
  RemoveFrom from;

  var bookmarkedCheck = false;

  final void Function(int itemId, ChangeList action, RemoveFrom from)
      changeListItems;

  DetailScreen({this.article, this.changeListItems, this.from});

  @override
  _DetailScreen createState() => _DetailScreen();
}

class _DetailScreen extends State<DetailScreen> {
  List<IconButton> checkBookmarks() {
    return widget.article.bookmarked == false
        ? [
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  widget.changeListItems(
                      widget.article.id, ChangeList.removeItem, widget.from);
                  Navigator.of(context).pop();
                }),
            IconButton(
                icon: Icon(Icons.bookmark),
                onPressed: () {
                  widget.changeListItems(
                      widget.article.id, ChangeList.addItem, widget.from);
                  Navigator.of(context).pop();
                })
          ]
        : [
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  widget.changeListItems(
                      widget.article.id, ChangeList.removeItem, widget.from);
                  Navigator.of(context).pop();
                }),
          ];
  }

  Text appBarTitle() {
    switch (widget.from) {
      case RemoveFrom.articles:
        return Text("Article Detail");
      case RemoveFrom.bookmark:
        return Text("Bookmark Detail");
    }
  }

  Widget showMapButton() {
    return widget.article.location != null
        ? FloatingActionButton(
            backgroundColor: Colors.white,
            child: Tab(
                icon: Image.asset(
              'assets/images/location.jpg',
              width: 20,
              height: 20,
            )),
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, Animation<double> animation,
                        Animation<double> secondaryAnimation) => MapScreen(location: widget.article.location),
                    opaque: false),
              );
            },
          )
        : SizedBox();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: appBarTitle(),
          actions: checkBookmarks(),
        ),
        body: ListView(
          children: [
            UserNameWidget(article: widget.article),
            AvatarWidgete(
              article: widget.article,
            ),
            ImagesWidget(article: widget.article),
          ],
        ),
        floatingActionButton: showMapButton());
  }
}
