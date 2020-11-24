import 'package:flutter/material.dart';

class BottomLineWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 3,
        child: DecoratedBox(
          decoration: const BoxDecoration(color: Colors.black45),
        ),
      ),
    );
  }
}
