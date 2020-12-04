import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DismissWidget extends StatelessWidget {

  void Function() dismissCallBack;

  DismissWidget({this.dismissCallBack});

  void onTapedAction() {
    dismissCallBack;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkResponse(
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: onTapedAction,
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.transparent,
        ),
    );
  }
}