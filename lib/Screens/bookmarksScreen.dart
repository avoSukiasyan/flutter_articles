import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:manufacturer/enum/enum.dart';
import 'package:manufacturer/model/article.dart';
import 'package:manufacturer/parsingJson/dataManager.dart';
import 'package:manufacturer/widgets/listViewWidget.dart';

class BookmarksScreen extends StatefulWidget {
  List<Article> articles;

  void Function(int id, ChangeList action, RemoveFrom from) changeListItems;

  BookmarksScreen({
    @required this.articles,
    this.changeListItems,
  });

  @override
  _BookmarksScreen createState() => _BookmarksScreen();
}

class _BookmarksScreen extends State<BookmarksScreen> {
  var selectSearch = false;
  var startLoading = false;

  AppBar _appBarActionsReturnText() {
    return selectSearch == false
        ? AppBar(
            actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  color: Colors.black,
                  onPressed: () {
                    setState(() {
                      selectSearch = true;
                    });
                  },
                )
              ],
            elevation: 10.0,
            centerTitle: false,
            backgroundColor: Colors.white,
            title: Text(
              "Bookmarks",
              style: TextStyle(color: Colors.black),
            ))
        : AppBar(
            leading: IconButton(
              icon: Icon(Icons.close),
              color: Colors.black,
              onPressed: () {
                DataManager.searchListAction("")
                    .then((value) => widget.articles = value);
                setState(() {
                  selectSearch = false;
                });
              },
            ),
            elevation: 10.0,
            centerTitle: false,
            backgroundColor: Colors.white,
            title: Container(
              padding: EdgeInsets.only(left: 15),
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black12),
              child: TextField(
                onChanged: (value) {},
                onSubmitted: _onSubmitted,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Search'),
              ),
            ));
  }

  void _onSubmitted(String name) async {
    setState(() {
      startLoading = true;
    });
    final items = await DataManager.searchListAction(name);
    setState(() {
      startLoading = false;
      widget.articles = items;
    });
  }

  Widget body() {
    if (startLoading) {
      return Center(
        child: Loading(
            indicator: BallPulseIndicator(), size: 70.0, color: Colors.blue),
      );
    } else {
      return ListViewWidget(
          articles: widget.articles,
          from: RemoveFrom.bookmark,
          changeListItems: widget.changeListItems);
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: _appBarActionsReturnText(), body: body());
  }
}
