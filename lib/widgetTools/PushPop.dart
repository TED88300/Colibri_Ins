import 'package:colibri/Tools/DbTools.dart';
import 'package:colibri/Tools/gColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PushPop {

  static int nbPush = 0;



  static void PushPop_Push(bool aheader)
  {
    if (aheader) nbPush = 0;
    nbPush++;
    print("≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈> nbPush ADD $nbPush");
  }

  static void PushPop_PopBack(BuildContext context)
  {
    nbPush--;
    print("≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈> nbPush SUPPR $nbPush");
    Navigator.pop(context);
  }

  static void PushPop_Pop(BuildContext context)
  {
    for (int i = 0; i < nbPush; i++) {
      print("PushPop_Pop $nbPush $i");
      Navigator.pop(context);
    }
    nbPush = 0;
  }

}