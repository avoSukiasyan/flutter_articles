import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:manufacturer/Screens/mapScreen.dart';
import 'package:manufacturer/model/Location.dart';
import 'package:manufacturer/model/article.dart';

typedef CreateArticleOutput = void Function(Article art);

class CreateArticle extends StatefulWidget {
  CreateArticleOutput out;

  CreateArticle({this.out});

  @override
  _CreateArticle createState() => _CreateArticle();
}

class _CreateArticle extends State<CreateArticle> {
  Article newArticle = Article();
  AppBar appBar;
  final imagePicker = ImagePicker();

  void _addAppBar() {
    final description = newArticle.description ?? "";
    final title = newArticle.title ?? "";
    final name = newArticle.userName ?? "";

    if (name.isNotEmpty && title.isNotEmpty && description.isNotEmpty) {
      appBar = AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Create Article",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          FlatButton(
            onPressed: () {
              widget.out(newArticle);
              Navigator.pop(context);
            },
            child: Icon(
              Icons.save,
              color: Colors.black,
            ),
          )
        ],
      );
    } else {
      appBar = AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Create Article",
            style: TextStyle(color: Colors.black),
          ));
    }
  }

  @override
  void initState() {
    super.initState();
    _addAppBar();
  }

  void uploadImage(bool forAvatar) async {
    final pickerfile = await imagePicker.getImage(source: ImageSource.gallery);
    if (pickerfile != null) {
      if (forAvatar) {
        setState(() {
          newArticle.userImage = pickerfile.path;
        });
      } else {
        setState(() {
          if (newArticle.images == null) {
            newArticle.images = [pickerfile.path];
          } else {
            newArticle.images.add(pickerfile.path);
          }
        });
      }
    }
  }

  Widget setAvatar() {
    return newArticle.userImage == null
        ? Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
            child: MaterialButton(
              onPressed: () => {uploadImage(true)},
              child: Center(
                  child: Icon(
                Icons.add_a_photo,
                color: Colors.white,
              )),
            ),
          )
        : Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.transparent),
            child: MaterialButton(
              onPressed: () => {uploadImage(true)},
              child: Center(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.file(
                  File(newArticle.userImage),
                  fit: BoxFit.cover,
                  height: 55.0,
                  width: 55.0,
                ),
              )),
            ),
          );
  }

  List<Widget> getImages() {
    List<Widget> items = [];
    if (newArticle.images == null) {
      items.add(MaterialButton(
        onPressed: () {
          uploadImage(false);
        },
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: Colors.grey, width: 2, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(15.0)),
        child: Center(
          child: Icon(
            Icons.add_a_photo_outlined,
            color: Colors.black,
          ),
        ),
      ));
      return items;
    }

    if (newArticle.images.length < 5) {
      for (var i = 0; i <= newArticle.images.length; i++) {
        if (newArticle.images.length == i) {
          items.add(MaterialButton(
            onPressed: () {
              uploadImage(false);
            },
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: Colors.grey, width: 2, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(15.0)),
            child: Center(
              child: Icon(
                Icons.add_a_photo_outlined,
                color: Colors.black,
              ),
            ),
          ));
        } else {
          items.add(Padding(
            padding: EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.file(
                File(newArticle.images[i]),
                fit: BoxFit.cover,
              ),
            ),
          ));
        }
      }
    } else {
      for (var i = 0; i < newArticle.images.length; i++) {
        items.add(Padding(
          padding: EdgeInsets.all(5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.file(
              File(newArticle.images[i]),
              fit: BoxFit.cover,
            ),
          ),
        ));
      }
    }
    return items;
  }

  void addLocation(Location loc) {
    setState(() {
      newArticle.location = loc;
    });
  }

  Widget showLocationLatLong() {
    if (newArticle.location != null) {
      return Row(
        children: [
          Image.asset(
            'assets/images/location.jpg',
            width: 15,
            height: 15,
          ),
          Expanded(
            child: Text(
              'PickerLocation: ${newArticle.location.latitude} , ${newArticle.location.longitude}',
              maxLines: 2,
              style: TextStyle(fontSize: 15, fontFamily: 'NotoSansJP'),
            ),
          ),
          FlatButton(
            onPressed: () {
              setState(() {
                newArticle.location = null;
              });
            },
            child: Icon(Icons.close),
          )
        ],
      );
    } else {
      return SizedBox();
    }
  }

  double imagesHeight() {
    if (newArticle.images != null) {
      return (newArticle.images.length * 200).roundToDouble();
    } else {
      return 230.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      resizeToAvoidBottomPadding: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
                pageBuilder: (context, Animation<double> animation,
                    Animation<double> secondaryAnimation) {
                  return MapScreen(out: addLocation);
                },
                opaque: false),
          );
        },
        backgroundColor: Colors.white,
        child: Tab(
            icon: Image.asset(
          'assets/images/location.jpg',
          width: 20,
          height: 20,
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:16.0,top:16.0,right:16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
                child: TextField(
                  maxLines: null,
              onEditingComplete: _addAppBar,
              onChanged: (value) {
                newArticle.title = value;
                _addAppBar();
                setState(() {});
              },
              style: TextStyle(fontSize: 28,
                  fontWeight: FontWeight.bold),
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: "Subject"),
            )),
            Row(children: [
              Flexible(
                  child: TextField(
                    maxLines: null,
                onChanged: (value) {
                  newArticle.userName = value;
                  _addAppBar();
                  setState(() {});
                },
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "Author Name"),
              )),
              setAvatar(),
            ]),
            Flexible(
                child: TextField(
                  maxLines: null,
              maxLengthEnforced: true,
              onChanged: (value) {
                newArticle.description = value;
                _addAppBar();
                setState(() {});
              },
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: "Article Text"),
            )),
            Container(
              height: imagesHeight(),
              child: GridView(
                padding: EdgeInsets.only(right: 30, top: 30),
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                physics: BouncingScrollPhysics(),
                children: getImages(),
              ),
            ),
            showLocationLatLong(),
          ],
        ),
      ),
    );
  }
}
