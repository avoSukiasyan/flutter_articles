import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:manufacturer/enum/enum.dart';
import 'dart:async' show Future;
import 'dart:convert';
import 'package:manufacturer/model/article.dart';
import 'package:http/http.dart' as http;

// Fixme create  singleton class for this
class DataManager {
  static List<Article> articles = [];
  static List<Article> bookmarksArticles = [];

  static Future<String> getJson() async {
    final json = await rootBundle.loadString('assets/json/jsonFile.json');
    final jsonData = jsonDecode(json);
    (jsonData["articles"] as List).forEach((element) {
      final artile = Article.fromJson(element);
      articles.add(artile);
      if (artile.bookmarked == true) {
        bookmarksArticles.add(artile);
      }
    });
    return json;
  }

  static void changeListItems(int id, ChangeList action, RemoveFrom from) {
    {
      if (action == ChangeList.removeItem) {
        switch (from) {
          case RemoveFrom.articles:
            articles.removeWhere((element) => element.id == id);
            break;
          case RemoveFrom.bookmark:
            bookmarksArticles.removeWhere((element) => element.id == id);
            break;
        }
      }

      if (action == ChangeList.addItem) {
        articles.asMap().forEach((index, item) {
          if (item.id == id) {
            item.bookmarked = true;
            articles[index] = item;
            bookmarksArticles.add(item);
          }
        });
      }
    }
  }

  static Future<List<Article>> getSearchData(String searchname) async {
    List<Article> list = [];
    final searchUrl = 'https://jsonkeeper.com/b/3FE1';
    final res = await http.get(searchUrl);
    final jsonData = json.decode(res.body);
    final dataArticles = jsonData["articles"];
    for (var item in dataArticles) {
      final article = Article.fromJson(item);
      list.add(article);
    }
    return list
        .where((Article element) => element.userName.contains(searchname))
        .toList();
  }

  static Future<List<Article>> searchListAction(String name) async {
    // Fixme use !name.isEmpty ?? false
    if (!name.isEmpty) {
      final list = await getSearchData(name);
      return list;
    } else {
      return bookmarksArticles;
    }
  }
}
