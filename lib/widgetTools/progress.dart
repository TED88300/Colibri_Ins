import 'package:Colibri_Collecte/Tools/gColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Progress {

  static Widget getFlatProgressAccent(int value, double height){
    int rest = 100 - value;
    return Stack(
      children: <Widget>[
        Text("Sadsd"),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(height: height, color: gColors.primary,),
              flex: 100,
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(width: 200, height: 20, color: gColors.secondary,),
              flex: value,
            ),
            Expanded(
              child: Container(),
              flex: rest,
            ),
          ],
        )
      ],
    );
  }
}