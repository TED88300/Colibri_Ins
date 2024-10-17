
import 'package:flutter/material.dart';
import 'package:Colibri_Collecte/Tools/gColors.dart';

InputDecoration inputStyle(hint) {
  return (
      new InputDecoration(
          hintText: hint,
          hintStyle: new TextStyle(color: gColors.primary),

          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),

          filled: true,
          fillColor: gColors.TextColor2,


          errorStyle: TextStyle(color: Colors.redAccent)
      )
  );
}

InputDecoration inputStylenotext() {
  return (
      new InputDecoration(
        border: myinputborder(), //normal border
        enabledBorder: myinputborder(), //enabled border
        focusedBorder: myfocusborder(), //focused border
      )
  );
}

OutlineInputBorder myinputborder(){ //return type is OutlineInputBorder
  return OutlineInputBorder( //Outline border type for TextFeild
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color: gColors.primary,
        width: 3,
      )
  );
}

OutlineInputBorder myfocusborder(){
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color:gColors.primary,
        width: 3,
      )
  );
}