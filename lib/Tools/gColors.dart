import 'package:Colibri_Collecte/Tools/Tools_Print.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class gColors {

  static const Color secondaryVP = Color(0xFFc1af01);
/*
  static const Color primary = Color(0xFF036500);
  static const Color secondary = Color(0xFFf39200);
*/

  static const Color secondary = Color(0xFF036500);
  static const Color  primary = Color(0xFFf39200);


  static const Color red = Color(0xFFEE4567);

  static const Color primaryST = Color(0x30036500);
  static const Color secondaryST = Color(0x30c1af01);

  static const Color LinearGradient1 = Color(0xFFF1F1F1);
  static const Color LinearGradient2 = Color(0xFFCCCCCC);
  static const Color TextColor1 = Color(0xFFffffff);
  static const Color TextColor2 = Color(0xFF777777);
  static const Color white = Colors.white;

  static Map<int, Color> getSwatch(Color color) {
    final hslColor = HSLColor.fromColor(color);
    final lightness = hslColor.lightness;

    final lowDivisor = 6;

    final highDivisor = 5;

    final lowStep = (1.0 - lightness) / lowDivisor;
    final highStep = lightness / highDivisor;

    return {
      50: (hslColor.withLightness(lightness + (lowStep * 5))).toColor(),
      100: (hslColor.withLightness(lightness + (lowStep * 4))).toColor(),
      200: (hslColor.withLightness(lightness + (lowStep * 3))).toColor(),
      300: (hslColor.withLightness(lightness + (lowStep * 2))).toColor(),
      400: (hslColor.withLightness(lightness + lowStep)).toColor(),
      500: (hslColor.withLightness(lightness)).toColor(),
      600: (hslColor.withLightness(lightness - highStep)).toColor(),
      700: (hslColor.withLightness(lightness - (highStep * 2))).toColor(),
      800: (hslColor.withLightness(lightness - (highStep * 3))).toColor(),
      900: (hslColor.withLightness(lightness - (highStep * 4))).toColor(),
    };
  }

  static TextStyle bodyTextFieldBold = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  static TextStyle bodyTextField = TextStyle(
    fontSize: 16,
  );

  static InputDecoration inputDecorationError(String wLabel, FocusNode focusNode, String wError) {
    return InputDecoration(
        labelText: wLabel,
        labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: focusNode.hasFocus ? Colors.red : Colors.black),
        errorText: wError.isEmpty ? null : wError,
        errorStyle: TextStyle(
          color: focusNode.hasFocus ? Colors.red : Colors.black,
        ));
  }

  static InputDecoration inputDecorationError2(String wLabel, FocusNode focusNode, String wError) {
    return InputDecoration(
/*
        labelText: "",
        labelStyle: TextStyle( fontSize: 0,),
*/
      errorText: wError.isEmpty ? null : wError,
      errorStyle: TextStyle(
        color: focusNode.hasFocus ? Colors.red : Colors.black,
      ),
      isDense: true,
      contentPadding: EdgeInsets.all(8),
    );
  }

  static InputDecoration inputDecoration(String wLabel) {
    return InputDecoration(
        labelText: wLabel,
        labelStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ));
  }

  static Widget colTextField(TextEditingController Edt, String wLabel, FocusNode focusNode, String wError, {bool Mand = false}) {
    Color wColor = Colors.black;
    if (Mand && wError.isNotEmpty) {
      wColor = Colors.red;
    }
    if (Mand && wError.isEmpty) {
      Color wColor = Colors.black;
//      wColor = Colors.green;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 10,
        ),
        Text(
          "$wLabel",
          style: gColors.bodyTextFieldBold.copyWith(color: wColor),
        ),
        TextField(
          maxLines: 1,
          controller: Edt,
          style: gColors.bodyTextField,
          keyboardType: TextInputType.name,
          textCapitalization: TextCapitalization.words,

          decoration: gColors.inputDecorationError2(wLabel, focusNode, wError),

//          focusNode: focusNode,
        ),
      ],
    );
  }

  static Widget colTextFieldTel(TextEditingController Edt, String wLabel, FocusNode focusNode, String wError, {bool Mand = false}) {
    Color wColor = Colors.black;
    if (Mand && wError.isNotEmpty) {
//      wColor = Colors.red;
      wColor = Colors.black;
    }
    if (Mand && wError.isEmpty) {
//      wColor = Colors.green;
      wColor = Colors.black;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 10,
        ),
        Text(
          "$wLabel",
          style: gColors.bodyTextFieldBold.copyWith(color: wColor),
        ),
        TextField(
          maxLines: 1,
          controller: Edt,
          style: gColors.bodyTextField,
          keyboardType: TextInputType.phone,
          decoration: gColors.inputDecorationError2(wLabel, focusNode, wError),

//          focusNode: focusNode,
        ),
      ],
    );
  }

  static Widget colTextFieldNum(TextEditingController Edt, String wLabel, FocusNode focusNode, String wError) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 10,
        ),
        Text(
          wLabel,
          style: gColors.bodyTextFieldBold,
        ),
        TextField(
          maxLines: 1,
          controller: Edt,
          style: gColors.bodyTextField,
          keyboardType: TextInputType.number,
          decoration: gColors.inputDecorationError2(wLabel, focusNode, wError),
          focusNode: focusNode,
        ),
      ],
    );
  }

  static Widget colTextFieldNumSep(TextEditingController Edt, String wLabel, FocusNode focusNode, String wError, {bool Mand = false}) {
    Color wColor = Colors.black;
    if (Mand && wError.isNotEmpty) {
      wColor = Colors.black;
    }
    if (Mand && wError.isEmpty) {
      wColor = Colors.black;
    }


    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 10,
        ),
        Text(
          wLabel,
          style: gColors.bodyTextFieldBold.copyWith(color: wColor),
        ),
        TextField(
          maxLines: 1,
          controller: Edt,
          style: gColors.bodyTextField,
          keyboardType: TextInputType.number,
          decoration: gColors.inputDecorationError2(wLabel, focusNode, wError),
          focusNode: focusNode,
          inputFormatters: [CustomTextInputFormatter()],
        ),
      ],
    );
  }

  static TextStyle get TitreText => TextStyle(fontSize: 17, color: Colors.white);
  static TextStyle get TitreText2 => TextStyle(fontSize: 14, color: Colors.white);
  static TextStyle get bodyText1 => TextStyle(fontSize: 17, color: Colors.black);
  static TextStyle get bodyText1B => TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold);
  static TextStyle get bodyTextB => TextStyle(fontSize: 12, color: Colors.black);

  static void printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  //************************************************************************************************
  //************************************************************************************************
  //************************************************************************************************
  //******************************            P R I N T           **********************************
  //************************************************************************************************
  //************************************************************************************************
  //************************************************************************************************

  static PopupPRINT(context) async {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              contentPadding: EdgeInsets.all(8),
              titlePadding: EdgeInsets.zero,
              title: AppBar(
                titleSpacing: 8,
                automaticallyImplyLeading: false,
                title: Text(
                  "IMPRESSION TICKET",
                  style: TextStyle(color: gColors.white),
                ),
              ),
              content: Form(
                  key: _formKey,
                  child: Container(
                      width: 600,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Voulez-vous imprimer un ticket ?"),
                        ],
                      ))),
              actions: <Widget>[
                Row(mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                  Spacer(),
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'NON',
                        style: TextStyle(color: gColors.secondary),
                      ),
                    ),
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                  Spacer(),
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'OUI',
                        style: TextStyle(color: gColors.primary),
                      ),
                    ),
                    onTap: () async {
                      await Tools_Print.Print_Identif_Real();
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pop();
                      }
                    },
                  )
                ]),
              ],
            );
          });
        });
  }

  //************************************************************************************************
  //************************************************************************************************
  //************************************************************************************************
  //******************************        C O N T R O L E S       **********************************
  //************************************************************************************************
  //************************************************************************************************
  //************************************************************************************************

  //                  await gColors.PopupError(context, "Errue de saisie", "ks,qdlbnsdlkqnmskln nlalzfklkefhlkhj kzelaklkhlkhjfa lnsalfknl\nks,qdlbnsdlkqnmskln nlalzfklkefhlkhj kzelaklkhlkhjfa lnsalfknl\nks,qdlbnsdlkqnmskln nlalzfklkefhlkhj kzelaklkhlkhjfa lnsalfknl");
  static PopupError(context, String wTitre, String wErrMsg) async {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              contentPadding: EdgeInsets.all(8),
              titlePadding: EdgeInsets.zero,
              title: AppBar(
                titleSpacing: 8,
                automaticallyImplyLeading: false,
                title: Text(
                  wTitre,
                  style: TextStyle(color: gColors.white),
                ),
              ),
              content: Form(
                  key: _formKey,
                  child: Container(
                      width: 600,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("${wErrMsg}"),
                        ],
                      ))),
              actions: <Widget>[
                Row(mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                  Spacer(),
                  InkWell(
                    child: Text(
                      'OK',
                      style: TextStyle(color: gColors.secondary),
                    ),
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ]),
              ],
            );
          });
        });
  }

  static bool ctrlTelFIXEPORT(String Tel, {bool VideOK = false}) {
    bool isOk = true;

    if (Tel.isEmpty && VideOK) return isOk;
    if (Tel.isEmpty && !VideOK) return false;

    if (Tel.length != 10) {
      isOk = false;
      return isOk;
    }
    String pref = Tel.substring(0, 2);
    String prefListe = "07,01,05,27,25,21";
    if (!prefListe.contains(pref)) {
      isOk = false;
    }
    return isOk;
  }

  static bool ctrlTelFIXE(String Tel, {bool VideOK = false}) {
    bool isOk = true;

    if (Tel.isEmpty && VideOK) return isOk;
    if (Tel.isEmpty && !VideOK) return false;

    if (Tel.length != 10) {
      isOk = false;
      return isOk;
    }
    String pref = Tel.substring(0, 2);
    String prefListe = "27,25,21";
    if (!prefListe.contains(pref)) {
      isOk = false;
    }
    return isOk;
  }

  static bool ctrlTelPORT(String Tel, {bool VideOK = false}) {
    bool isOk = true;

    if (Tel.isEmpty && VideOK) return isOk;
    if (Tel.isEmpty && !VideOK) return false;

    if (Tel.length != 10) {
      isOk = false;
      return isOk;
    }
    String pref = Tel.substring(0, 2);
    String prefListe = "07,01,05";
    if (!prefListe.contains(pref)) {
      isOk = false;
    }
    return isOk;
  }


  static bool ctrlMail(String email, {bool VideOK = false}) {
    bool isOk = true;
    if (email.isEmpty && VideOK) return isOk;

    isOk = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    return isOk;
  }
}

class CustomTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length == 0) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      int selectionIndexFromTheRight = newValue.text.length - newValue.selection.extentOffset;

      String input = newValue.text;
      String fnewValue = input.split('').reversed.join();
      List<String> chars = fnewValue.replaceAll(' ', '').split('');
      String newString = '';
      for (int i = chars.length - 1; i >= 0; i--) {
        if (i % 3 == 2 && i != chars.length - 1) newString += ' ';
        newString += chars[i];
      }

/*
      List<String> chars = newValue.text.replaceAll(' ', '').split('');
      String newString = '';
      for (int i = chars.length; i > 0 ; i--) {
//        for (int i = 0; i < chars.length; i++) {
        if (i % 3 == 0 && i != 0) newString += ' ';
        newString += chars[i];
      }
*/

      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndexFromTheRight,
        ),
      );
    } else {
      return newValue;
    }
  }
}
