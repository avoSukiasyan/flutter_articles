import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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
