import 'dart:async';
import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:xml/xml.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:colibri/Tools/gColors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_search/dropdown_search.dart';

class Item {
  String Item_name = "";
  String Item_label = "";
  int Item_len = 0;
  String Item_DataType = "";
  String Item_Values = "";
  String Item_Values_Label = "";

  bool Item_IsUSed = false;

  bool Screen_Rep_Error = false;
  bool Screen_Rep_Mand = false;

  Item({
    this.Item_name = "",
    this.Item_label = "",
    this.Item_len = 0,
    this.Item_DataType = "",
    this.Item_Values = "",
    this.Item_IsUSed = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'Item_name': Item_name,
      'Item_label': Item_label,
      'Item_len': Item_len,
      'Item_DataType': Item_DataType,
      'Item_Values': Item_Values,
      'Item_IsUSed': Item_IsUSed,
    };
  }

  String toString() {
    return 'Item_name $Item_name ' + 'Item_label $Item_label ' + 'Item_len $Item_len ' + 'Item_DataType $Item_DataType ' + 'Item_Values  $Item_Values ' + 'Item_IsUSed $Item_IsUSed';
  }
}

class Screen {
  String Screen_Nom = "";
  String Screen_Groupe = "";
  String Screen_Question = "";
  String Screen_Question2 = "";

  String Screen_Rep_Str = "";
  int Screen_Rep_Int = 0;
  bool Screen_Rep_Bool = false;
  int Screen_Rep_Type = 0;
  int Screen_Rep_Len = 0;

  String Screen_Rep_List_Val = "";
  String Screen_Rep_List_Label = "";

  Widget Screen_Ctrl = Container();
  Widget Screen_Row = Container();
  VoidCallback screenVoidCallback = (){};



  Screen({
    this.Screen_Nom = "",
    this.Screen_Groupe = "",
    this.Screen_Question = "",
    this.Screen_Question2 = "",
    this.Screen_Rep_Str = "",
    this.Screen_Rep_Int = 0,
    this.Screen_Rep_Bool = false,
    this.Screen_Rep_Type = 0,
    this.Screen_Rep_Len = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'Screen_Nom': Screen_Nom,
      'Screen_Groupe': Screen_Groupe,
      'Screen_Question': Screen_Question,
    };
  }

  String toString() {
    return 'Screen_Nom $Screen_Nom ' + 'Screen_Question $Screen_Question ' + 'Screen_Question2 $Screen_Question2 ' + 'Screen_Rep_Str $Screen_Rep_Str ' + 'Screen_Rep_Int  $Screen_Rep_Int ' + 'Screen_Rep_Bool  $Screen_Rep_Bool ' + 'Screen_Rep_Type  $Screen_Rep_Type ' + 'Screen_Rep_Len  $Screen_Rep_Len ' + 'Screen_Ctrl ${Screen_Ctrl.toString()} ' + 'Screen_Row ${Screen_Row.toString()}';
  }
}

class KYC {
  String KYC_Nom = "";
  String KYC_Field = "";
  String KYC_Lib = "";
  String KYC_Groupe = "";

  KYC({
    this.KYC_Nom = "",
    this.KYC_Field = "",
    this.KYC_Lib = "",
    this.KYC_Groupe = "",
  });

  Map<String, dynamic> toMap() {
    return {
      'KYC_Nom': KYC_Nom,
      'KYC_Field': KYC_Field,
      'KYC_Lib': KYC_Lib,
      'KYC_Groupe': KYC_Groupe,
    };
  }
}

class Tools {
  static String Groupe = "";

  static String ScreenText = "";

  static List<Screen> Screens = [];
  static Screen wScreen = Screen();

  static List<KYC> KYCs = [];
  static KYC wKYC = KYC();

  static List<Item> QF_Items = [];
  static Item wQF_Item = Item();

  static List<Item> QI_Items = [];
  static Item wQI_Item = Item();

  static List<Item> Q_Items = [];
  static Item wQ_Item = Item();



  static Future Compute_ECR() async {
    ScreenText = "";

    String Rupt = "";
    Screens.forEach((element) {
      if (Rupt.compareTo(element.Screen_Groupe) != 0) {
        ScreenText += "${element.Screen_Groupe}\n";
        Rupt = element.Screen_Groupe;
      }
      ScreenText += "                         ${element.Screen_Nom}\n";
    });
  }

  static Future Load_ILOT() async {
    final wIlotFile = await rootBundle.loadString('assets/Ilot.kml');

//    print("Load_ILOT ${wIlotFile.split(",")}");

    final document = XmlDocument.parse(wIlotFile);

/*
    final textual = document.descendants
        .where((node) => node is XmlText && node.text.trim().isNotEmpty)
        .join('\n');
    print(textual);
*/

    print("Load_ILOT coordinates");

    final titles = document.findAllElements('coordinates');

    int i = 0;
    titles.map((node) => node.text).forEach((element) {
//      print("elt$i ${element}");

      var wArray = element.split("\n");
      wArray.forEach((elementArray) {
//        print("${elementArray.trim()}");

        var SplArr = elementArray.trim().split(",");

        if (SplArr.length >= 2) print("${SplArr[0]} ${SplArr[1]}");
      });

      i++;
    });
  }

  static Future Load_KYC() async {
    Screens.clear();
    final myData = await rootBundle.loadString('assets/KYC.txt');

    List<List<dynamic>> rowsAsListOfValues = const CsvToListConverter(eol: "\r\n", fieldDelimiter: ";", shouldParseNumbers: false).convert(myData);

    print("Load_KYC ${rowsAsListOfValues.length}");

    for (var i = 1; i < rowsAsListOfValues.length; i++) {
      wKYC = new KYC(KYC_Nom: "${rowsAsListOfValues[i][0]}", KYC_Field: "${rowsAsListOfValues[i][1]}", KYC_Lib: "${rowsAsListOfValues[i][2]}", KYC_Groupe: "${rowsAsListOfValues[i][2]}");
      KYCs.add(wKYC);
    }

    KYCs.forEach((element) {
      print("> ${element.KYC_Nom} | ${element.KYC_Field} | ${element.KYC_Lib} | ${element.KYC_Groupe}");
    });
  }

  static Item Get_UNIQUE(String wName) {
    bool Trv = false;
    Item wItem = Item();
    Q_Items.forEach((element) {

      if (element.Item_name.compareTo(wName) == 0) {
        print("  element.Item_name ${element.toMap()}");
        wItem = element;
        Trv = true;
        return;
      }
    });


    return wItem;
  }

  static Item Get_FORMEL(String wName) {
    bool Trv = false;
    Item wItem = Item();
    QF_Items.forEach((element) {
      if (element.Item_name.compareTo(wName) == 0) {
        wItem = element;
        Trv = true;
        return;
      }
    });
    if (!Trv) {
      QI_Items.forEach((element) {
        if (element.Item_name.compareTo(wName) == 0) {
          wItem = element;
          return;
        }
      });
    }

    return wItem;
  }

  static Item Get_INFORMEL(String wName) {
    Item wItem = Item();
    bool Trv = false;

    QI_Items.forEach((element) {
      if (element.Item_name.compareTo(wName) == 0) {
        wItem = element;
        Trv = true;
        return;
      }
    });

    if (!Trv) {
      QF_Items.forEach((element) {
        if (element.Item_name.compareTo(wName) == 0) {
          wItem = element;
          return;
        }
      });
    }

    return wItem;
  }


  static Future Load_UNIQUE() async {
    String v1 = "";
    String v2 = "";
    String v3 = "";

    Q_Items.clear();

    final myData = await rootBundle.loadString('assets/DIC_RGEECI_UNIQUE.TXT');
    List<List<dynamic>> rowsAsListOfValues = const CsvToListConverter(eol: "\r", fieldDelimiter: "|", shouldParseNumbers: false).convert(myData);


    bool isInItem = false;
    bool isInValueSet = false;

    for (var i = 0; i < rowsAsListOfValues.length; i++) {
      if (rowsAsListOfValues[i].length == 0) continue;

      if (rowsAsListOfValues[i][0].trim().length == 0) {
        if (isInItem) {
          Q_Items.add(wQ_Item);
          isInItem = false;
          isInValueSet = false;
        }
      }

      if (rowsAsListOfValues[i].length == 1) {
        v1 = rowsAsListOfValues[i][0];
      } else if (rowsAsListOfValues[i].length == 2) {
        v1 = rowsAsListOfValues[i][0];
        v2 = rowsAsListOfValues[i][1];
      } else if (rowsAsListOfValues[i].length == 3) {
        v1 = rowsAsListOfValues[i][0];
        v2 = rowsAsListOfValues[i][1];
        v3 = rowsAsListOfValues[i][2];
      }

      if (v1.contains("[Item]")) {
        isInItem = true;
        wQ_Item = new Item(Item_name: "", Item_label: "", Item_len: 0, Item_DataType: "");
      } else if (v1.contains("[ValueSet]")) {
        isInValueSet = true;
      } else if (isInItem) {
        if (v1.contains("Name")) {
          final splittedv1 = v1.split('=');
          wQ_Item.Item_name = "${splittedv1[1]}";
        } else if (v1.contains("Label")) {
          final splittedv1 = v1.split('=');
          wQ_Item.Item_label = "${splittedv1[1]}";
        } else if (v1.contains("Len")) {
          final splittedv1 = v1.split('=');
          if (splittedv1.length >= 2) wQ_Item.Item_len = int.tryParse(splittedv1[1])!;
        } else if (v1.contains("DataType")) {
          final splittedv1 = v1.split('=');
          if (splittedv1.length >= 2) wQ_Item.Item_DataType = "${splittedv1[1]}";
        }
      } else if (isInValueSet) {
        if (v1.contains("Value")) {
          final splittedv1 = v1.split('=');
          wQ_Item.Item_Values = wQ_Item.Item_Values + "${splittedv1[1]}|";
        }
      }
    }
  }


  static Future Load_FORMEL() async {
    String v1 = "";
    String v2 = "";
    String v3 = "";

    QF_Items.clear();

    final myData = await rootBundle.loadString('assets/DICTIONNAIRE_RGEECI_FORMEL.txt');
    List<List<dynamic>> rowsAsListOfValues = const CsvToListConverter(eol: "\r", fieldDelimiter: "|", shouldParseNumbers: false).convert(myData);

    print("Load_FORMEL ${rowsAsListOfValues.length}");

    bool isInItem = false;
    bool isInValueSet = false;

    for (var i = 0; i < rowsAsListOfValues.length; i++) {
      if (rowsAsListOfValues[i].length == 0) continue;

      if (rowsAsListOfValues[i][0].trim().length == 0) {
        if (isInItem) {
          QF_Items.add(wQF_Item);
          isInItem = false;
          isInValueSet = false;
        }
      }

      if (rowsAsListOfValues[i].length == 1) {
        v1 = rowsAsListOfValues[i][0];
      } else if (rowsAsListOfValues[i].length == 2) {
        v1 = rowsAsListOfValues[i][0];
        v2 = rowsAsListOfValues[i][1];
      } else if (rowsAsListOfValues[i].length == 3) {
        v1 = rowsAsListOfValues[i][0];
        v2 = rowsAsListOfValues[i][1];
        v3 = rowsAsListOfValues[i][2];
      }

      if (v1.contains("[Item]")) {
        isInItem = true;
        wQF_Item = new Item(Item_name: "", Item_label: "", Item_len: 0, Item_DataType: "");
        String vItem = v1.replaceAll("[", "").replaceAll("]", "");
      } else if (v1.contains("[ValueSet]")) {
        isInValueSet = true;
      } else if (isInItem) {
        if (v1.contains("Name")) {
          final splittedv1 = v1.split('=');
          wQF_Item.Item_name = "${splittedv1[1]}";
        } else if (v1.contains("Label")) {
          final splittedv1 = v1.split('=');
          wQF_Item.Item_label = "${splittedv1[1]}";
        } else if (v1.contains("Len")) {
          final splittedv1 = v1.split('=');
          if (splittedv1.length >= 2) wQF_Item.Item_len = int.tryParse(splittedv1[1])!;
        } else if (v1.contains("DataType")) {
          final splittedv1 = v1.split('=');
          if (splittedv1.length >= 2) wQF_Item.Item_DataType = "${splittedv1[1]}";
        }
      } else if (isInValueSet) {
        if (v1.contains("Value")) {
          final splittedv1 = v1.split('=');
          wQF_Item.Item_Values = wQF_Item.Item_Values + "${splittedv1[1]}|";
        }
      }
    }
  }

  static Future Load_INFORMEL() async {
    String v1 = "";
    String v2 = "";
    String v3 = "";

    QI_Items.clear();

    final myData = await rootBundle.loadString('assets/DICTIONNAIRE_RGEECI_INFORMEL.txt');
    List<List<dynamic>> rowsAsListOfValues = const CsvToListConverter(eol: "\r", fieldDelimiter: "|", shouldParseNumbers: false).convert(myData);

    print("Load_FORMEL ${rowsAsListOfValues.length}");

    bool isInItem = false;
    bool isInValueSet = false;

    for (var i = 0; i < rowsAsListOfValues.length; i++) {
      if (rowsAsListOfValues[i].length == 0) continue;

      if (rowsAsListOfValues[i][0].trim().length == 0) {
        if (isInItem) {
          QI_Items.add(wQI_Item);
          isInItem = false;
          isInValueSet = false;
        }
      }

      if (rowsAsListOfValues[i].length == 1) {
        v1 = rowsAsListOfValues[i][0];
      } else if (rowsAsListOfValues[i].length == 2) {
        v1 = rowsAsListOfValues[i][0];
        v2 = rowsAsListOfValues[i][1];
      } else if (rowsAsListOfValues[i].length == 3) {
        v1 = rowsAsListOfValues[i][0];
        v2 = rowsAsListOfValues[i][1];
        v3 = rowsAsListOfValues[i][2];
      }

      if (v1.contains("[Item]")) {
        isInItem = true;
        wQI_Item = new Item(Item_name: "", Item_label: "", Item_len: 0, Item_DataType: "");
        String vItem = v1.replaceAll("[", "").replaceAll("]", "");
      } else if (v1.contains("[ValueSet]")) {
        isInValueSet = true;
      } else if (isInItem) {
        if (v1.contains("Name")) {
          final splittedv1 = v1.split('=');
          wQI_Item.Item_name = "${splittedv1[1]}";
        } else if (v1.contains("Label")) {
          final splittedv1 = v1.split('=');
          wQI_Item.Item_label = "${splittedv1[1]}";
        } else if (v1.contains("Len")) {
          final splittedv1 = v1.split('=');
          if (splittedv1.length >= 2) wQI_Item.Item_len = int.tryParse(splittedv1[1])!;
        } else if (v1.contains("DataType")) {
          final splittedv1 = v1.split('=');
          if (splittedv1.length >= 2) wQI_Item.Item_DataType = "${splittedv1[1]}";
        }
      } else if (isInValueSet) {
        if (v1.contains("Value")) {
          final splittedv1 = v1.split('=');
          wQI_Item.Item_Values = wQI_Item.Item_Values + "${splittedv1[1]}|";
        }
      }
    }


  }

  //*******************************************
  //*******************************************
  //*******************************************
  static Screen Get_ScreenCallBack(Item wItem, BuildContext context, String wString, int wInt, bool wbool, VoidCallback screenVoidCallback) {


    Screen element = Screen();
    element.Screen_Rep_Str = wString;
    element.Screen_Rep_Int = wInt;
    element.Screen_Rep_Bool = wbool;
    element.screenVoidCallback = screenVoidCallback;

    element.Screen_Rep_Type = 0;

    element.Screen_Question2 = wItem.Item_label;
    if (wItem.Item_Values.contains("1;Oui|2;Non")) {
      element.Screen_Rep_Type = 1;
    } else if (wItem.Item_DataType.contains("Tel")) {
      element.Screen_Rep_Type = 7;
      element.Screen_Rep_Len = wItem.Item_len;
    } else if (wItem.Item_label.contains("Mois")) {
      element.Screen_Rep_Type = 2;
    } else if (wItem.Item_DataType.contains("Numeric")) {
      if (wItem.Item_Values.isEmpty) {
        element.Screen_Rep_Type = 3;
        element.Screen_Rep_Len = wItem.Item_len;
      } else {
        bool isNumNeSaitPas = false;
        final splittedv1 = wItem.Item_Values.split('|');
        splittedv1.forEach((element2) {
          final splittedv2 = element2.split(';');

          if (splittedv2.length == 1) {
//            print("splittedv2 ${splittedv2} ${splittedv2.length}");
            //          print("splittedv2[0] ${splittedv2[0].isNotEmpty} ");

            if (splittedv2[0].isNotEmpty) isNumNeSaitPas = true;
          }
        });

        if (isNumNeSaitPas) {
          element.Screen_Rep_Type = 6;
          element.Screen_Rep_Len = wItem.Item_len;
          element.Screen_Rep_List_Val = wItem.Item_Values;
        } else {
          element.Screen_Rep_Type = 5;
          element.Screen_Rep_Len = wItem.Item_len;
          element.Screen_Rep_List_Val = wItem.Item_Values;
        }
      }
    } else if (wItem.Item_DataType.contains("Alpha")) {
      if (wItem.Item_Values.isEmpty) {
        element.Screen_Rep_Type = 4;
        element.Screen_Rep_Len = wItem.Item_len;
      } else {
        element.Screen_Rep_Type = 5;
        element.Screen_Rep_Len = wItem.Item_len;
        element.Screen_Rep_List_Val = wItem.Item_Values;
      }
    } else {
      print("Get_ScreenCallBack wItem.Item_label ${wItem.Item_label} ${wItem.Item_DataType} ");
    }



    Widget Ctrl = Container();
    switch (element.Screen_Rep_Type) {
      case 1:
        {
          if (element.Screen_Rep_Str.compareTo("") == 0) element.Screen_Rep_Str = "0";
          if (element.Screen_Rep_Int == -1) element.Screen_Rep_Int = int.parse(element.Screen_Rep_Str);


          Ctrl = Container(
            padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 10.0),
            child: ToggleSwitch(
              activeBgColor: [gColors.primary],
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.grey,
              inactiveFgColor: Colors.grey[900],
              minHeight: 32.0,
              initialLabelIndex: element.Screen_Rep_Int,
              totalSwitches: 3,
              labels: ['???','Oui', 'Non'],
              onToggle: (index) {
                element.Screen_Rep_Int = index!;
                print('switched1 A to : $index');
                element.screenVoidCallback();
                print('switched1 B to: $index');
              },
            ),
          );
        }
        break;

      case 2:
        {
          DateTime wDateTime = DateTime.now();
          String activity_birthday = element.Screen_Rep_Str;

          if (!activity_birthday.isEmpty) {
            try {
              print("init A $activity_birthday");
              wDateTime = DateTime.parse(element.Screen_Rep_Str);
              element.screenVoidCallback();
            } catch (_) {
              print("init B");
              wDateTime = DateTime.now();
              element.screenVoidCallback();
            }
          }



//          print("init ${DateFormat('dd-MM-yyyy').format(wDateTime)}");

          Ctrl = TextButton(
              onPressed: () async {
                final selected = await showMonthYearPicker(
                  context: context,
                  initialDate: wDateTime,
                  firstDate: DateTime(190),
                  lastDate: DateTime.now(),
                  locale: Locale('fr'),
                );
                element.Screen_Rep_Str = selected.toString();
                wDateTime =  selected!;
                print("selected  screenVoidCallback ${selected.toString()} ${element.Screen_Rep_Str}");
                element.screenVoidCallback();
              },
              child:
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${DateFormat('MMM yyyy').format(wDateTime)}',
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.left,
                  ))

          /*  TextField(
              readOnly: true,
            controller: txtController,

            )*/
          );
        }
        break;

      case 3:
        {
          final txtController = TextEditingController();
          txtController.text = element.Screen_Rep_Int.toString();
          Ctrl = Container(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            width: 330,
            child: TextField(
              maxLength: element.Screen_Rep_Len,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              controller: txtController,
              autofocus: false,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
              ),
              onChanged: (value) async {
                element.Screen_Rep_Int = int.parse(txtController.text);
                element.screenVoidCallback();
              },
            ),
          );
        }
        break;

      case 4:
        {
          final txtController = TextEditingController();
          txtController.text = element.Screen_Rep_Str.toString();
          txtController.selection = TextSelection.fromPosition(TextPosition(offset: txtController.text.length));
          Ctrl = Container(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            width: 330,
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              maxLength: element.Screen_Rep_Len,
              keyboardType: TextInputType.name,
//              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'[1-9a-zA-Z]')),],
              controller: txtController,
              autofocus: false,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 10.0),
              ),
              onChanged: (value) async {
                element.Screen_Rep_Str = txtController.text;
                element.screenVoidCallback();
              },
            ),
          );
        }
        break;

      case 5:
        {
          List<String> wValList = [];
          List<String> wLibList = [];

//          print(">>>>> Screen_Rep_List_Val ${element.Screen_Rep_List_Val}");
          final splittedv1 = element.Screen_Rep_List_Val.split('|');

          //        print(">>>>> splittedv1 ${splittedv1}");
          splittedv1.forEach((element2) {
            final splittedv2 = element2.split(';');

            if (splittedv2.length == 2) {
              wValList.add(splittedv2[0].replaceAll("'", ""));
              wLibList.add(splittedv2[1]);
            }
          });

          String selectedValue = "";
          String selectedValueID = "";

          print("DropdownButton2 Screen_Rep_Str ${element.Screen_Rep_Str}");

          if (element.Screen_Rep_Str.isEmpty)   element.Screen_Rep_Str = wValList[0];
          int ind = wValList.indexOf(element.Screen_Rep_Str);
          if (ind == -1) ind = 0;
            print("DropdownButton2 ind ${element.Screen_Rep_Str}");
          selectedValue = wLibList[ind];
          final TextEditingController searchController = TextEditingController();


          Ctrl = Container(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
              width: 330,
              child: DropdownSearch<String>(
                popupProps: PopupProps.menu(
                  showSelectedItems: true,
                  isFilterOnline: true,
                  showSearchBox: true,
                  searchFieldProps: TextFieldProps(
                    controller: searchController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          searchController.clear();
                        },
                      ),
                    ),
                  ),
                ),
                items: wLibList,
                selectedItem: selectedValue,
                onChanged: (value) async {
                  print("selectedValue ${value} ${wLibList.indexOf(value!)+1}");
                  element.Screen_Rep_Int=  wLibList.indexOf(value!)+1;
                  element.Screen_Rep_Str= "${element.Screen_Rep_Int}";
                  print("◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊ Tools CRT 5 A ${element.Screen_Rep_Int} ${element.Screen_Rep_Str}");
                  element.screenVoidCallback();
                },
              )




          );

          print("Fin CTRL");
        }
        break;

      case 6:
        {
          int NSP = 0;
          final splittedv1 = wItem.Item_Values.split('|');

          print("splittedv1 ${splittedv1}");

          splittedv1.forEach((element2) {
            final splittedv2 = element2.split(';');

            if (splittedv2.length == 2) {
              NSP = int.parse(splittedv2[0]);
            }
          });

          final txtController = TextEditingController();
          txtController.text = element.Screen_Rep_Int.toString();
          if (element.Screen_Rep_Int == NSP) txtController.text = "NE SAIT PAS $NSP";
          Ctrl = Container(
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
              width: 340,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    maxLength: element.Screen_Rep_Len,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    controller: txtController,
                    autofocus: false,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                    ),
                    onChanged: (value) async {
                      element.Screen_Rep_Int = int.parse(txtController.text);
                      element.screenVoidCallback();

                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: ElevatedButton(
                      onPressed: () async {
                        element.Screen_Rep_Int = NSP;
                        element.screenVoidCallback();
//                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                        ),
                        backgroundColor: gColors.white,
                        elevation: 4,
                      ),
                      child: Text(
                        "NE SAIT PAS",
                        style: gColors.bodyText1,
                      ),
                    ),
                  ),
                ],
              ));
        }
        break;
      case 7:
        {
          final txtController = TextEditingController();
          txtController.text = element.Screen_Rep_Str.toString();
          txtController.selection = TextSelection.fromPosition(TextPosition(offset: txtController.text.length));
          Ctrl = Container(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            width: 330,
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              maxLength: element.Screen_Rep_Len,
              keyboardType: TextInputType.phone,
//              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'[1-9a-zA-Z]')),],
              controller: txtController,
              autofocus: false,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 10.0),
              ),
              onChanged: (value) async {
                element.Screen_Rep_Str = txtController.text;
                element.screenVoidCallback();
              },
            ),
          );
        }
        break;

      case 99:
        {
          Ctrl = Text(
            "*** M A F A ***",
            style: gColors.bodyTextB,
          );
        }
        break;

      default:
        {
          Ctrl = Text(
            "*** ? ? ? ***",
            style: gColors.bodyTextB,
          );
        }
    }

    element.Screen_Ctrl = Ctrl;
    Color wColor = Colors.black;


    if (wItem.Screen_Rep_Mand && wItem.Screen_Rep_Error)
    {
      wColor = Colors.red;
    }
    if (wItem.Screen_Rep_Mand && !wItem.Screen_Rep_Error)
    {
      wColor = Colors.green;
    }


    element.Screen_Row = Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            width: 330,
            child: AutoSizeText(
              "${element.Screen_Question2}",
              style: gColors.bodyText1B.copyWith(color: wItem.Screen_Rep_Error ? Colors.red : !wItem.Screen_Rep_Mand ? Colors.black : Colors.green),
              maxLines: 4,
            ),
          )
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Ctrl,
        ])
      ],
    );

    return element;
  }



  static Screen Get_Screen(Item wItem, BuildContext context, String wString, int wInt, bool wbool) {
    Screen element = Screen();

    element.Screen_Rep_Str = wString;
    element.Screen_Rep_Int = wInt;
    element.Screen_Rep_Bool = wbool;
    element.Screen_Rep_Type = 0;

    bool isMt = false;
    if (wItem.Item_label.toUpperCase().contains("Montant".toUpperCase())) {
      isMt = true;
    }


    element.Screen_Question2 = wItem.Item_label;
//    print("Get_Screen wItem.Item_label ${wItem.Item_name}  ${wItem.Item_label} ${wItem.Item_Values} ");
    if (wItem.Item_Values.contains("1;Oui|2;Non")) {
      element.Screen_Rep_Type = 1;
    } else if (wItem.Item_DataType.contains("Tel")) {
      element.Screen_Rep_Type = 7;
      element.Screen_Rep_Len = wItem.Item_len;
    } else if (wItem.Item_label.contains("Mois")) {
      element.Screen_Rep_Type = 2;
    } else if (wItem.Item_DataType.contains("Numeric")) {
      if (wItem.Item_Values.isEmpty) {
        element.Screen_Rep_Type = 3;
        element.Screen_Rep_Len = wItem.Item_len;
      } else {
        bool isNumNeSaitPas = false;
        final splittedv1 = wItem.Item_Values.split('|');

        splittedv1.forEach((element2) {
          final splittedv2 = element2.split(';');

          if (splittedv2.length == 1) {
            print("splittedv2 ${splittedv2} ${splittedv2.length}");
            print("splittedv2[0] ${splittedv2[0].isNotEmpty} ");

            if (splittedv2[0].isNotEmpty) isNumNeSaitPas = true;
          }
        });

        if (isNumNeSaitPas) {
          element.Screen_Rep_Type = 6;
          element.Screen_Rep_Len = wItem.Item_len;
          element.Screen_Rep_List_Val = wItem.Item_Values;
        } else {
          element.Screen_Rep_Type = 5;
          element.Screen_Rep_Len = wItem.Item_len;
          element.Screen_Rep_List_Val = wItem.Item_Values;
        }
      }
    } else if (wItem.Item_DataType.contains("Alpha")) {
      if (wItem.Item_Values.isEmpty) {
        element.Screen_Rep_Type = 4;
        element.Screen_Rep_Len = wItem.Item_len;
      } else {
        element.Screen_Rep_Type = 5;
        element.Screen_Rep_Len = wItem.Item_len;
        element.Screen_Rep_List_Val = wItem.Item_Values;
      }
    } else {
//      print("wItem.Item_label ${wItem.Item_label} ${wItem.Item_DataType} ");
    }

//    print("Get_Screen >>>>>>>>>>> Crt ${element.Screen_Question} ${element.Screen_Question2} ${element.Screen_Rep_Type}");

    Widget Ctrl = Container();
    switch (element.Screen_Rep_Type) {
      case 1:
        {
          if (element.Screen_Rep_Str.compareTo("") == 0) element.Screen_Rep_Str = "0";
          if (element.Screen_Rep_Int == -1) element.Screen_Rep_Int = int.parse(element.Screen_Rep_Str);
          Ctrl = Container(
            padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 10.0),
            child: ToggleSwitch(
              activeBgColor: [gColors.primary],
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.grey,
              inactiveFgColor: Colors.grey[900],
              minHeight: 32.0,
              initialLabelIndex: element.Screen_Rep_Int,
              totalSwitches: 3,
              labels: ['???','Oui', 'Non'],
              onToggle: (index) {
                element.Screen_Rep_Int = index!;
                print('switched2 A to : $index ${element.Screen_Nom}');
                element.screenVoidCallback();
                print('switched2 B to: $index');
              },
            ),
          );
        }
        break;

      case 2:
        {
          DateTime wDateTime = DateTime.now();
          String activity_birthday = element.Screen_Rep_Str;
          if (!activity_birthday.isEmpty) {
            try {
//              print("init A $activity_birthday");
              wDateTime = DateTime.parse(activity_birthday);
            } catch (_) {
  //            print("init B");
              wDateTime = DateTime(2009);
            }
          }

          if (wDateTime.year == 1900)
              wDateTime = DateTime(2009);

          element.Screen_Rep_Str = wDateTime.toString();

          Ctrl = TextButton(
              onPressed: () async {
                final selected = await showMonthYearPicker(
                  context: context,
                  initialDate: wDateTime,
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                  locale: Locale('fr'),

                );
                element.Screen_Rep_Str = selected.toString();
                wDateTime =  selected!;
                print("selected ${selected.toString()}");
                wScreen.screenVoidCallback();

              },
              child: Align(
                  alignment: Alignment.centerLeft,
                  child:
                  wDateTime.year != 1900
                      ?
                  Text(
                    '${DateFormat('MMM yyyy').format(wDateTime)}',
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.left,
                  )
                  :
                  Text(
                    '???',
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.left,
                  )

              ));
        }
        break;

      case 3:
        {
          //          inputFormatters: [CustomTextInputFormatter()],
          final txtController = TextEditingController();
          txtController.text = element.Screen_Rep_Int.toString();
          Ctrl = Container(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            width: 330,
            child: TextField(
              maxLength: element.Screen_Rep_Len,
              keyboardType: TextInputType.number,
              inputFormatters: isMt ?  [CustomTextInputFormatter()] : <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),],
              controller: txtController,
              autofocus: false,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
              ),
              onChanged: (value) async {
                element.Screen_Rep_Int = int.parse(txtController.text);
              },
            ),
          );
        }
        break;

      case 4:
        {
          final txtController = TextEditingController();
          txtController.text = element.Screen_Rep_Str.toString();

          Ctrl = Container(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            width: 330,
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              maxLength: element.Screen_Rep_Len,
              keyboardType: TextInputType.text,
//              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'[1-9a-zA-Z]')),],
              controller: txtController,
              autofocus: false,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 10.0),
              ),
              onChanged: (value) async {
                element.Screen_Rep_Str = txtController.text;
              },
            ),
          );
        }
        break;

      case 5:
        {
          List<String> wValList = [];
          List<String> wLibList = [];

          print(">>>>> Screen_Rep_List_Val ${element.Screen_Rep_List_Val}");
          final splittedv1 = element.Screen_Rep_List_Val.split('|');

          print(">>>>> splittedv1 ${splittedv1}");
          splittedv1.forEach((element2) {
            final splittedv2 = element2.split(';');

            if (splittedv2.length == 2) {
              wValList.add(splittedv2[0].replaceAll("'", ""));
              wLibList.add(splittedv2[1]);
            }
          });

          String selectedValue = "";
          String selectedValueID = "";

          if (element.Screen_Rep_Str.isEmpty) element.Screen_Rep_Str = wValList[0];

          print("DropdownButton2 element.Screen_Rep_Str ${element.Screen_Rep_Str}");
          print("DropdownButton2 wValList ${wValList}");



          selectedValue = wLibList[wValList.indexOf(element.Screen_Rep_Str)];

          final TextEditingController searchController = TextEditingController();

          print("DropdownButton2 CTRL 5");

          Ctrl = Container(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
              width: 330,
              child: DropdownSearch<String>(
                popupProps: PopupProps.menu(
                  showSelectedItems: true,
                  isFilterOnline: true,
                  showSearchBox: true,
                  searchFieldProps: TextFieldProps(
                    controller: searchController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          searchController.clear();
                        },
                      ),
                    ),
                  ),
                ),
                items: wLibList,
                selectedItem: selectedValue,
                onChanged: (value) async {
                  print("selectedValue ${value} ${wLibList.indexOf(value!)}");

                  element.Screen_Rep_Int=  wLibList.indexOf(value!)+1;
                  element.Screen_Rep_Str= "${element.Screen_Rep_Int}";

                  print("◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊◊ Tools CRT 5 B ${element.Screen_Rep_Int} ${element.Screen_Rep_Str}");



                },
              )
              );

          print("Fin CTRL");
        }
        break;

      case 6:
        {
          int NSP = 0;
          final splittedv1 = wItem.Item_Values.split('|');

          print("splittedv1 ${splittedv1}");

          splittedv1.forEach((element2) {
            final splittedv2 = element2.split(';');

            if (splittedv2.length == 2) {
              NSP = int.parse(splittedv2[0]);
            }
          });

          final txtController = TextEditingController();
          txtController.text = element.Screen_Rep_Int.toString();
          if (element.Screen_Rep_Int == NSP) txtController.text = "NE SAIT PAS $NSP";
          Ctrl = Container(
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
              width: 340,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    maxLength: element.Screen_Rep_Len,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    controller: txtController,
                    autofocus: false,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                    ),
                    onChanged: (value) async {
                      element.Screen_Rep_Int = int.parse(txtController.text);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: ElevatedButton(
                      onPressed: () async {
                        element.Screen_Rep_Int = NSP;
//                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                        ),
                        backgroundColor: gColors.white,
                        elevation: 4,
                      ),
                      child: Text(
                        "NE SAIT PAS",
                        style: gColors.bodyText1,
                      ),
                    ),
                  ),
                ],
              ));
        }
        break;
      case 7:
        {
          final txtController = TextEditingController();
          txtController.text = element.Screen_Rep_Str.toString();
          txtController.selection = TextSelection.fromPosition(TextPosition(offset: txtController.text.length));
          Ctrl = Container(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            width: 330,
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              maxLength: element.Screen_Rep_Len,
              keyboardType: TextInputType.phone,
//              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'[1-9a-zA-Z]')),],
              controller: txtController,
              autofocus: false,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 10.0),
              ),
              onChanged: (value) async {
                element.Screen_Rep_Str = txtController.text;
                element.screenVoidCallback();
              },
            ),
          );
        }
        break;
      case 99:
        {
          Ctrl = Text(
            "*** M A F A ***",
            style: gColors.bodyTextB,
          );
        }
        break;

      default:
        {
          Ctrl = Text(
            "*** ? ? ? ***",
            style: gColors.bodyTextB,
          );
        }
    }

    element.Screen_Ctrl = Ctrl;
    Color wColor = Colors.black;
    print(">>>>>>>>>>>>>>>>>>>  wItem.Screen_Rep_Error ${wItem.Screen_Rep_Error}");
    if (wItem.Screen_Rep_Mand && wItem.Screen_Rep_Error)
      {
        wColor = Colors.red;
      }
    if (wItem.Screen_Rep_Mand && !wItem.Screen_Rep_Error)
    {
      wColor = Colors.green;
    }

    element.Screen_Row = Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            width: 330,
            child: AutoSizeText(
              "${element.Screen_Question2}",
              style: gColors.bodyText1B.copyWith(color: wItem.Screen_Rep_Error ? Colors.red : !wItem.Screen_Rep_Mand ? Colors.black : Colors.green),
//              style: gColors.bodyText1B.copyWith(color: wColor),
              maxLines: 4,
            ),
          )
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Ctrl,
        ])
      ],
    );

    return element;
  }




}
