import 'package:flutter/material.dart';

class ImageItemWidget extends StatelessWidget {
  var imageUrl;

  ImageItemWidget({this.imageUrl});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
          Image.network(this.imageUrl, height: 130, width: 140, fit: BoxFit.fill,
            errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
              return Text('Your error widget...');
            },
          ),
        // Fixme use Container only
        SizedBox(
          child: Container(
            color: Colors.white,
          ),
          height: 50,
          width: 3,
        )
      ],
    );
  }
}
