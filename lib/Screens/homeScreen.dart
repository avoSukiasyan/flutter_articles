import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manufacturer/Screens/createArticle.dart';
import 'package:manufacturer/enum/enum.dart';
import 'package:manufacturer/model/article.dart';
import 'package:manufacturer/widgets/listViewWidget.dart';

class HomeScreen extends StatefulWidget {
  List<Article> articles;
  void Function(int id, ChangeList action, RemoveFrom from) changeListItems;

  HomeScreen({
    @required this.articles,
    this.changeListItems,
  });

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }

  void addArtcile(Article art) {
    art.id = widget.articles.length ++;
    art.bookmarked = false;
    art.elapsedTimeInHour = 1;
    if (art.images == null) {
      art.images = [];
    }
    if (art.userImage == null) {
      art.userImage = "";
    }
    setState(() {
      widget.articles.add(art);
    });
  }

  FloatingActionButton addArticle() {
    return FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CreateArticle(
                    out: addArtcile,
                  )));
        },
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add_box,
          color: Colors.black,
        ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        floatingActionButton: addArticle(),
        appBar: AppBar(
          elevation: 10.0,
          centerTitle: false,
          backgroundColor: Colors.white,
          title: Text("Articles", style: TextStyle(color: Colors.black)),
        ),
        body: ListViewWidget(
          articles: widget.articles,
          changeListItems: widget.changeListItems,
          from: RemoveFrom.articles,
        ));
  }
}
