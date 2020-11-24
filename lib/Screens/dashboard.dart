import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manufacturer/Screens/bookmarksScreen.dart';
import 'package:manufacturer/Screens/homeScreen.dart';
import 'package:manufacturer/enum/enum.dart';
import 'package:manufacturer/model/article.dart';
import 'package:manufacturer/parsingJson/dataManager.dart';

class Dashboard extends StatefulWidget {
  @override
  _Dashboard createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _currentIndex = 0;
  Widget currentScreen;

  var _model = DataManager.getJson();
  var articles = DataManager.articles;
  var bookmarksArticles = DataManager.bookmarksArticles;

  Widget onTabAction(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


  void changeListItems(int id, ChangeList action, RemoveFrom from) {
    setState(() {
      DataManager.changeListItems(id, action, from);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    _tabController = new TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: null,
          bottomNavigationBar: Container(
              child: BottomNavigationBar(
            fixedColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: onTabAction,
            elevation: 10,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.archive),
                title: Text('Articles'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                title: Text('Bookmark'),
              ),
            ],
          )),
          body: IndexedStack(
            index: _currentIndex,
            children: [
              HomeScreen(articles: articles, changeListItems: changeListItems),
              BookmarksScreen(
                  articles: bookmarksArticles, changeListItems: changeListItems)
            ],
          ),
        ));
  }
}
