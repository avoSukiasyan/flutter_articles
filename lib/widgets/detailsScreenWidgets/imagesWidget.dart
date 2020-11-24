import 'package:flutter/cupertino.dart';
import 'package:manufacturer/model/article.dart';

class ImagesWidget extends StatelessWidget {
  Article article;

  ImagesWidget({@required this.article});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        width: MediaQuery.of(context).size.width,
        height: (this.article.images.length * 150).toDouble(),
        child: GridView(
          padding: EdgeInsets.only(top: 10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 2, mainAxisSpacing: 2),
          physics: BouncingScrollPhysics(),
          children: this.article.images.map((String item) {
            return Container(
                padding: EdgeInsets.all(2),
                child: Image.network(
                  item,
                  fit: BoxFit.fill,
                  errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
                    return Text('Your error widget...');
                  },
                ));
          }).toList(),
        ));
  }
}

//this.photos.map((String item) => ImageItemWidget(imageUrl: item)).toList(),
