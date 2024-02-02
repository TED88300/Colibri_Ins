import 'package:colibri/Tools/API_Data.dart';
import 'package:colibri/Tools/DbOdoo.dart';
import 'package:colibri/Tools/DbTools.dart';
import 'package:colibri/Tools/gColors.dart';
import 'package:colibri/Widget/3_bottom_navigation_list.dart';
import 'package:colibri/widgetTools/PushPop.dart';
import 'package:colibri/widgetTools/toolbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Tools/Tools.dart';

class I_KYB_InsFIN extends StatefulWidget {
  @override
  I_KYB_InsFINState createState() => I_KYB_InsFINState();
}

class I_KYB_InsFINState extends State<I_KYB_InsFIN> {
//  Item QI_R1 = Item();Screen Screen_QI_R1 = Screen();
  Item QI_R3 = Item();
  Screen Screen_QI_R3 = Screen();
  Item QI_R4 = Item();
  Screen Screen_QI_R4 = Screen();
  Item QI_R5 = Item();
  Screen Screen_QI_R5 = Screen();
  bool circularProgressIndicator = false;

  int pageEntr = 0;

  DateTime dateFinEntretien = DateTime.now();

  void initState() {
    pageEntr = DbTools.pageEntr;
//    QI_R1 = Tools.Get_FORMEL("QI_R1");
    QI_R3 = Tools.Get_FORMEL("QI_R3");
    QI_R4 = Tools.Get_FORMEL("QI_R4");
    QI_R5 = Tools.Get_FORMEL("QI_R5");
    super.initState();

    setState(() {});
  }

  Future<bool> _onWillPop() async {
    print("_onWillPop");
    DbTools.pageEntr--;
    PushPop.PushPop_PopBack(context);
    return false;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(context: context, initialDate: dateFinEntretien, firstDate: DateTime(1900), lastDate: new DateTime.now());
    if (picked != null && picked != dateFinEntretien) {
      setState(() {
        dateFinEntretien = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
//    Screen_QI_R1 = Tools.Get_Screen(QI_R1, context, DbTools.gActivite_ins.dateFinEntretien!, 0, false);
    Screen_QI_R3 = Tools.Get_Screen(QI_R3, context, DbTools.gActivite_ins.resultatEntretien!, 0, false);
    Screen_QI_R4 = Tools.Get_Screen(QI_R4, context, DbTools.gActivite_ins.nombreVisite!, 0, false);
    Screen_QI_R5 = Tools.Get_Screen(QI_R5, context, DbTools.gActivite_ins.observationEnquete!, 0, false);

    print(">>>>>>>>>>>>>>>>>>>   Build   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< DbTools.gActivite_ins.state ${DbTools.gActivite_ins.state}");
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Container(
          color: Colors.white,
          child: Scaffold(
            appBar: AppBar(
              title: CommonAppBar.TitleEcr("KYB${DbTools.isFORMEL ? 'F' : 'I'}", "FIN ENTRETIEN", pageEntr, DbTools.pagesEntr, "BF"),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  print("leading");
                  DbTools.pageEntr--;
                  PushPop.PushPop_PopBack(context);
                },
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: IconButton(
                    icon: const Icon(Icons.cancel),
                    onPressed: () {
                      Navigator.popUntil(context, ModalRoute.withName("I_Liste_ActivitesIns"));
                    },
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                  TextButton(
                      onPressed: () async {
                        await _selectDate(context);
                      },
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Date de fin Entretien : ${DateFormat('dd-MM-yyyy').format(dateFinEntretien!)}',
                            style: const TextStyle(fontSize: 16),
                            textAlign: TextAlign.left,
                          ))),
                  Screen_QI_R3.Screen_Row,
                  Screen_QI_R4.Screen_Row,
                  Screen_QI_R5.Screen_Row,
                ]),
              ),
            ),
            bottomNavigationBar: (DbTools.gActivite_ins.state != "draft" && DbTools.gActivite_ins.state != "cancel" && DbTools.gActivite_ins.state != "")
                ? null
                : BottomAppBar(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                      child: ElevatedButton(
                        onPressed: () async {
                          print("Brouillon OK");
                          DbTools.gActivite_ins.state = "draft";
                          await Validation();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                          ),
                          backgroundColor: gColors.primary,
                          elevation: 4,
                        ),
                        child: Text(
                          "Brouillon",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                      child: ElevatedButton(
                        onPressed: () async {
                          print("Validation OK");
                          DbTools.gActivite_ins.state = "confirm";
                          await Validation();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                          ),
                          backgroundColor: gColors.primary,
                          elevation: 4,
                        ),
                        child: Text(
                          "Confirmer",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ));
  }

  Future Validation() async {
    DbTools.gActivite_ins.dateFinEntretien = dateFinEntretien.toString();
    DbTools.gActivite_ins.resultatEntretien = Screen_QI_R3.Screen_Rep_Str;
    DbTools.gActivite_ins.nombreVisite = Screen_QI_R4.Screen_Rep_Str;
    DbTools.gActivite_ins.observationEnquete = Screen_QI_R5.Screen_Rep_Str;
    circularProgressIndicator = true;
    DbTools.gActivite_ins.dateFinEntretien = "2022-01-01";
    DbTools.gActivite_ins.ImageBase64_PHOTO_ACT = DbTools.gImageBase64_PHOTO_ACT!;
    if (DbTools.isFORMEL)
      DbTools.gActivite_ins.type_activite_formel_informel = "Formel";
    else
      DbTools.gActivite_ins.type_activite_formel_informel = "Informel";

    print("♦♦♦♦ SAVE ACTIVITE ${DbTools.gActivite_ins.state}");
    await DbOdoo.Activite_insAddUpd();

    await DbTools.getActivitesInsAllTest();
    await gColors.PopupPRINT(context);

    setState(() {
      circularProgressIndicator = false;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => BottomNavigationList(), settings: RouteSettings(name: 'BottomNavigationList')));
    });
  }
}
