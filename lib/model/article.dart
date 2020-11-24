import 'package:flutter/material.dart';
import 'package:manufacturer/enum/enum.dart';

class Article {
  int id;
  String userName;
  int elapsedTimeInHour;
  bool bookmarked;
  String userImage;
  String title;
  String description;
  List<String> images;

  Article(
      {this.id,
      this.userName,
      this.elapsedTimeInHour,
      this.bookmarked,
      this.userImage,
      this.title,
      this.description,
      this.images});

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    elapsedTimeInHour = json['elapsedTimeInHour'];
    bookmarked = json['bookmarked'];
    userImage = json['userImage'];
    title = json['title'];
    description = json['description'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['elapsedTimeInHour'] = this.elapsedTimeInHour;
    data['bookmarked'] = this.bookmarked;
    data['userImage'] = this.userImage;
    data['title'] = this.title;
    data['description'] = this.description;
    data['images'] = this.images;
    return data;
  }
}
