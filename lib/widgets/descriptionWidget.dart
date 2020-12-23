import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  var description;

  DescriptionWidget({this.description});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      // Fixme use Expanded to fill all space
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(top: 5, right: 75, left: 10),
      child: Text(
        '${this.description}',
        style: TextStyle(fontSize: 16),
        maxLines: 1,
      ),
    );
  }
}
