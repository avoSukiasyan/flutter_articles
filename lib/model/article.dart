import 'package:manufacturer/model/Location.dart';

class Article {
  int id;
  String userName;
  int elapsedTimeInHour;
  bool bookmarked;
  String userImage;
  String title;
  String description;
  List<String> images;
  Location location;

  Article(
      {this.id,
      this.userName,
      this.elapsedTimeInHour,
      this.bookmarked,
      this.userImage,
      this.location,
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
    if (json['location'] != null) {
      location = Location.fromJson(json['location']) ?? Location();
    }
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
    data['location'] = this.location;
    return data;
  }
}
