import 'package:colibri/Tools/DbOdoo.dart';
import 'package:colibri/Tools/DbTools.dart';
import 'package:colibri/Tools/gColors.dart';
import 'package:colibri/Widget/Identification/I_KYB_Ins2_photo.dart';
import 'package:colibri/Widget/Identification/I_KYB_Ins3_Gps.dart';
import 'package:colibri/widgetTools/PushPop.dart';
import 'package:colibri/widgetTools/toolbar.dart';
import 'package:flutter/material.dart';

import '../../Tools/Tools.dart';

class I_KYB_Ins1 extends StatefulWidget {
  @override
  I_KYB_Ins1State createState() => I_KYB_Ins1State();
}

class I_KYB_Ins1State extends State<I_KYB_Ins1> {
  Item QF_F01 = Item();
  Screen Screen_QF_F01 = Screen();
  Item QF_F01A = Item();
  Screen Screen_QF_F01A = Screen();

  Item QF_F02 = Item();
  Screen Screen_QF_F02 = Screen();
  Item QF_F02A = Item();
  Screen Screen_QF_F02A = Screen();
  Item QF_F03 = Item();
  Screen Screen_QF_F03 = Screen();
  Item QF_F04 = Item();
  Screen Screen_QF_F04 = Screen();
  Item QF_F05 = Item();
  Screen Screen_QF_F05 = Screen();
  int pageEntr = 0;

  void initState() {
    pageEntr = DbTools.pageEntr;

    print("initState");

    QF_F01 = Tools.Get_UNIQUE("Q_F01");
    QF_F01A = Tools.Get_UNIQUE("Q_F01A");
    QF_F02 = Tools.Get_UNIQUE("Q_F02");
    QF_F02A = Tools.Get_UNIQUE("Q_F02A");
    QF_F03 = Tools.Get_UNIQUE("Q_F03");
    QF_F04 = Tools.Get_UNIQUE("Q_F04");
    QF_F05 = Tools.Get_UNIQUE("Q_F05");

    if (DbTools.gActivite_ins.statutRegistreCommerce == null) DbTools.gActivite_ins.statutRegistreCommerce = "0";
    if (DbTools.gActivite_ins.statutCompteContribuable == null) DbTools.gActivite_ins.statutCompteContribuable = "0";
    if (DbTools.gActivite_ins.statutComptabiliteFormel == null) DbTools.gActivite_ins.statutComptabiliteFormel = "0";
    if (DbTools.gActivite_ins.docFinExercice == null) DbTools.gActivite_ins.docFinExercice = "0";
    if (DbTools.gActivite_ins.typeEntreprise == null) DbTools.gActivite_ins.typeEntreprise = "0";

    if (DbTools.gActivite_ins.statutRegistreCommerce!.isEmpty) DbTools.gActivite_ins.statutRegistreCommerce = "0";
    if (DbTools.gActivite_ins.statutCompteContribuable!.isEmpty) DbTools.gActivite_ins.statutCompteContribuable = "0";
    if (DbTools.gActivite_ins.statutComptabiliteFormel!.isEmpty) DbTools.gActivite_ins.statutComptabiliteFormel = "0";
    if (DbTools.gActivite_ins.docFinExercice!.isEmpty) DbTools.gActivite_ins.docFinExercice = "0";
    if (DbTools.gActivite_ins.typeEntreprise!.isEmpty) DbTools.gActivite_ins.typeEntreprise = "0";

    QF_F01.Screen_Rep_Mand = true;
    QF_F01A.Screen_Rep_Mand = true;

    QF_F02.Screen_Rep_Mand = true;
    QF_F02A.Screen_Rep_Mand = true;
    QF_F03.Screen_Rep_Mand = true;
    QF_F04.Screen_Rep_Mand = true;
    QF_F05.Screen_Rep_Mand = true;

    QF_F01.Screen_Rep_Error = true;
    QF_F01A.Screen_Rep_Error = true;
    QF_F02.Screen_Rep_Error = true;
    QF_F02A.Screen_Rep_Error = true;
    QF_F03.Screen_Rep_Error = true;
    QF_F04.Screen_Rep_Error = true;
    QF_F05.Screen_Rep_Error = true;

    Screen_QF_F01 = Tools.Get_ScreenCallBack(QF_F01, context, DbTools.gActivite_ins.statutRegistreCommerce!, -1, false, screenVoidCallback);

    Screen_QF_F01A = Tools.Get_ScreenCallBack(QF_F01A, context, DbTools.gActivite_ins.numRegistreCommerce!, -1, false, screenVoidCallback);

    Screen_QF_F02 = Tools.Get_ScreenCallBack(QF_F02, context, DbTools.gActivite_ins.statutCompteContribuable!, -1, false, screenVoidCallback);
    Screen_QF_F02A = Tools.Get_ScreenCallBack(QF_F02A, context, DbTools.gActivite_ins.numCompteContribuable!, 0, false, screenVoidCallback);

    Screen_QF_F03 = Tools.Get_ScreenCallBack(QF_F03, context, DbTools.gActivite_ins.statutComptabiliteFormel!, -1, false, screenVoidCallback);
    Screen_QF_F04 = Tools.Get_ScreenCallBack(QF_F04, context, DbTools.gActivite_ins.docFinExercice!, -1, false, screenVoidCallback);
    Screen_QF_F05 = Tools.Get_ScreenCallBack(QF_F05, context, DbTools.gActivite_ins.typeEntreprise!, -1, false, screenVoidCallback);

    super.initState();

    setState(() {});
  }

  Future<bool> _onWillPop() async {
    print("_onWillPop");
    DbTools.pageEntr--;
    PushPop.PushPop_PopBack(context);
    return false;
  }

  void screenVoidCallback() {
    print("screenVoidCallback ");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    QF_F01.Screen_Rep_Error = false;
    if (Screen_QF_F01.Screen_Rep_Int == 0) {
      QF_F01.Screen_Rep_Error = true;
    }


    print("BUILD  DbTools.gActivite_ins.state ${DbTools.gActivite_ins.state}");

    QF_F01A.Screen_Rep_Error = false;
    if (Screen_QF_F01.Screen_Rep_Int == 1) {
      if (Screen_QF_F01A.Screen_Rep_Str.isEmpty) {
        QF_F01A.Screen_Rep_Error = true;
      }
    }

    QF_F02.Screen_Rep_Error = false;
    if (Screen_QF_F02.Screen_Rep_Int == 0) {
      QF_F02.Screen_Rep_Error = true;
    }

   QF_F02A.Screen_Rep_Error = false;
    if (Screen_QF_F02.Screen_Rep_Int == 1) {
      if (Screen_QF_F02A.Screen_Rep_Str.isEmpty) {
        QF_F02A.Screen_Rep_Error = true;
      }
    }



    QF_F03.Screen_Rep_Error = false;
    if (Screen_QF_F03.Screen_Rep_Int == 0) {
      QF_F03.Screen_Rep_Error = true;
    }
    QF_F04.Screen_Rep_Error = false;
    if (Screen_QF_F04.Screen_Rep_Int == 0) {
      QF_F04.Screen_Rep_Error = true;
    }
    QF_F05.Screen_Rep_Error = false;
    if (Screen_QF_F05.Screen_Rep_Int == 0) {
      QF_F05.Screen_Rep_Error = true;
    }

    Screen_QF_F01 = Tools.Get_ScreenCallBack(QF_F01, context, Screen_QF_F01.Screen_Rep_Str!, Screen_QF_F01.Screen_Rep_Int, false, screenVoidCallback);
    Screen_QF_F01A = Tools.Get_ScreenCallBack(QF_F01A, context, Screen_QF_F01A.Screen_Rep_Str!, Screen_QF_F01A.Screen_Rep_Int, false, screenVoidCallback);
    Screen_QF_F02 = Tools.Get_ScreenCallBack(QF_F02, context, Screen_QF_F02.Screen_Rep_Str!, Screen_QF_F02.Screen_Rep_Int, false, screenVoidCallback);
    Screen_QF_F02A = Tools.Get_ScreenCallBack(QF_F02A, context, Screen_QF_F02A.Screen_Rep_Str!, Screen_QF_F02A.Screen_Rep_Int, false, screenVoidCallback);
    Screen_QF_F03 = Tools.Get_ScreenCallBack(QF_F03, context, Screen_QF_F03.Screen_Rep_Str!, Screen_QF_F03.Screen_Rep_Int, false, screenVoidCallback);
    Screen_QF_F04 = Tools.Get_ScreenCallBack(QF_F04, context, Screen_QF_F04.Screen_Rep_Str!, Screen_QF_F04.Screen_Rep_Int, false, screenVoidCallback);
    Screen_QF_F05 = Tools.Get_ScreenCallBack(QF_F05, context, Screen_QF_F05.Screen_Rep_Str!, Screen_QF_F05.Screen_Rep_Int, false, screenVoidCallback);

    print("Build KYB   ${DbTools.pageEntr}");
    print(">>>>>>>>>>>>>>>>>>>  Screen_QF_F01A.Screen_Rep_Str  ${Screen_QF_F01A.Screen_Rep_Str}");

    return WillPopScope(
        onWillPop: _onWillPop,
        child: Container(
          color: Colors.white,
          child: Scaffold(
            appBar: AppBar(
              title: CommonAppBar.TitleEcr("KYB${DbTools.isFORMEL ? 'F' : 'I'}", "Form. Inform.", pageEntr, DbTools.pagesEntr, "B1"),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
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
                child:  Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                      Screen_QF_F01.Screen_Row,
                      if (Screen_QF_F01.Screen_Rep_Int == 1) Screen_QF_F01A.Screen_Row,
                      Screen_QF_F02.Screen_Row,
                      if (Screen_QF_F02.Screen_Rep_Int == 1) Screen_QF_F02A.Screen_Row,
                      Screen_QF_F03.Screen_Row,
                      Screen_QF_F04.Screen_Row,
                      Screen_QF_F05.Screen_Row,
                    ]),
              ),
            ),
            bottomNavigationBar: BottomAppBar(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 15, 25, 15),
                      child: ElevatedButton(
                        onPressed: () async {
                          DbTools.gActivite_ins.statutRegistreCommerce = "2";
                          DbTools.gActivite_ins.statutCompteContribuable = "2";
                          DbTools.gActivite_ins.statutComptabiliteFormel = "2";
                          DbTools.gActivite_ins.docFinExercice = "2";
                          DbTools.gActivite_ins.typeEntreprise = "2";

                          Screen_QF_F01.Screen_Rep_Int = 2;
                          Screen_QF_F02.Screen_Rep_Int = 2;
                          Screen_QF_F02A.Screen_Rep_Int = 2;
                          Screen_QF_F03.Screen_Rep_Int = 2;
                          Screen_QF_F04.Screen_Rep_Int = 2;
                          Screen_QF_F05.Screen_Rep_Int = 2;

                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                          ),
                          backgroundColor: gColors.primary,
                          elevation: 4,
                        ),
                        child: Text(
                          "INFORMEL",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 15, 25, 15),
                      child: ElevatedButton(
                        onPressed: () async {
                          print("Validation ${Screen_QF_F01.Screen_Rep_Int}");

                          DbTools.gActivite_ins.statutRegistreCommerce = "${Screen_QF_F01.Screen_Rep_Int}";
                          DbTools.gActivite_ins.numRegistreCommerce = "${Screen_QF_F01A.Screen_Rep_Str}";
                          DbTools.gActivite_ins.statutCompteContribuable = "${Screen_QF_F02.Screen_Rep_Int}";
                          DbTools.gActivite_ins.numCompteContribuable = "${Screen_QF_F02A.Screen_Rep_Str}";
                          DbTools.gActivite_ins.statutComptabiliteFormel = "${Screen_QF_F03.Screen_Rep_Int}";
                          DbTools.gActivite_ins.docFinExercice = "${Screen_QF_F04.Screen_Rep_Int}";
                          DbTools.gActivite_ins.typeEntreprise = "${Screen_QF_F05.Screen_Rep_Int}";

                          bool wError = false;
                          QF_F01.Screen_Rep_Error = false;
                          if (Screen_QF_F01.Screen_Rep_Int == 0) {
                            QF_F01.Screen_Rep_Error = true;
                            wError = true;
                          }
                          if (Screen_QF_F01.Screen_Rep_Int == 1) {
                            if (Screen_QF_F01A.Screen_Rep_Str.isEmpty) {
                              QF_F01A.Screen_Rep_Error = true;
                              wError = true;
                            }
                          }

                          QF_F02.Screen_Rep_Error = false;
                          if (Screen_QF_F02.Screen_Rep_Int == 0) {
                            QF_F02.Screen_Rep_Error = true;
                            wError = true;
                          }

                          if (Screen_QF_F02.Screen_Rep_Int == 1) {
                            if (Screen_QF_F02A.Screen_Rep_Str.isEmpty) {
                              QF_F02A.Screen_Rep_Error = true;
                              wError = true;
                            }
                          }


                          QF_F03.Screen_Rep_Error = false;
                          if (Screen_QF_F03.Screen_Rep_Int == 0) {
                            QF_F03.Screen_Rep_Error = true;
                            wError = true;
                          }
                          QF_F04.Screen_Rep_Error = false;
                          if (Screen_QF_F04.Screen_Rep_Int == 0) {
                            QF_F04.Screen_Rep_Error = true;
                            wError = true;
                          }
                          QF_F05.Screen_Rep_Error = false;
                          if (Screen_QF_F05.Screen_Rep_Int == 0) {
                            QF_F05.Screen_Rep_Error = true;
                            wError = true;
                          }

                          if (wError) {
                            setState(() {});
                            return;
                          }

                          DbTools.isFORMEL = true;
                          if (Screen_QF_F01.Screen_Rep_Int == 2 && Screen_QF_F02.Screen_Rep_Int == 2) DbTools.isFORMEL = false;
                          if (Screen_QF_F01.Screen_Rep_Int == 1 && Screen_QF_F04.Screen_Rep_Int == 2) DbTools.isFORMEL = false;
                          if (Screen_QF_F02.Screen_Rep_Int == 1 && Screen_QF_F04.Screen_Rep_Int == 2) DbTools.isFORMEL = false;
                          DbOdoo.printWrapped("KYC I≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈ create ${DbTools.gActivite_ins.toArr()} ");

//                      await gColors.PopupPRINT(context);

                          setState(() {
                            if (!DbTools.isFORMEL) DbTools.strEntr = "KYC.";
                            DbTools.pageEntr++;
                            PushPop.PushPop_Push(false);

                            if(DbTools.gEMULATEUR)
                              Navigator.push(context, MaterialPageRoute(builder: (context) => I_KYB_Ins3_Gps()));
                            else
                              Navigator.push(context, MaterialPageRoute(builder: (context) => I_KYB_Ins2_photo()));




                          });
                        },
                        style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                          ),
                          backgroundColor: gColors.primary,
                          elevation: 4,
                        ),
                        child: Text(
                          "Suivant",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ));
  }
}
