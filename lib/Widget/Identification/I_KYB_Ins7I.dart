import 'package:colibri/Tools/DbTools.dart';
import 'package:colibri/Tools/gColors.dart';
import 'package:colibri/Widget/Identification/I_KYB_Ins10I.dart';
import 'package:colibri/widgetTools/PushPop.dart';
import 'package:colibri/widgetTools/toolbar.dart';
import 'package:flutter/material.dart';

import '../../Tools/Tools.dart';

class I_KYB_Ins7I extends StatefulWidget {
  @override
  I_KYB_Ins7IState createState() => I_KYB_Ins7IState();
}

class I_KYB_Ins7IState extends State<I_KYB_Ins7I> {
  Item QI_C15 = Item();
  Screen Screen_QI_C15 = Screen();

  Item QI_C15A = Item();
  Screen Screen_QI_C15A = Screen();

  Item QI_C20A = Item();
  Screen Screen_QI_C20A = Screen();
  Item QI_C20B = Item();
  Screen Screen_QI_C20B = Screen();
  Item QF_C20C1 = Item();
  Screen Screen_QF_C20C1 = Screen();
  Item QF_C20C2 = Item();
  Screen Screen_QF_C20C2 = Screen();
  Item QI_C30 = Item();
  Screen Screen_QI_C30 = Screen();

  int pageEntr = 0;

  void screenVoidCallback() {
    setState(() {});
  }

  void initState() {
    print("I_KYB_Ins7I initState DbTools.gActivite_ins.autreActivte ${DbTools.gActivite_ins.autreActivte}");

    pageEntr = DbTools.pageEntr;

    QI_C15 =    Tools.Get_UNIQUE("Q_C19");
    QI_C15A =   Tools.Get_UNIQUE("Q_C19A");
    QI_C20A =   Tools.Get_UNIQUE("Q_C24");
    QI_C20B =   Tools.Get_UNIQUE("Q_C24A");
    QF_C20C1 =  Tools.Get_UNIQUE("Q_C24B1");
    QF_C20C2 =  Tools.Get_UNIQUE("Q_C24B2");
    QI_C30 =    Tools.Get_UNIQUE("Q_C30");

    Screen_QI_C15 = Tools.Get_ScreenCallBack(QI_C15, context, DbTools.gActivite_ins.declarationCnps!, 0, false, screenVoidCallback);
    Screen_QI_C20B = Tools.Get_ScreenCallBack(QI_C20B, context, DbTools.gActivite_ins.nombreEtablissement!, 0, false, screenVoidCallback);

    super.initState();

    setState(() {});
  }

  Future<bool> _onWillPop() async {
    print("_onWillPop");
    DbTools.pageEntr--;
    PushPop.PushPop_PopBack(context);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    Screen_QI_C15A = Tools.Get_Screen(QI_C15A, context, DbTools.gActivite_ins.numeroCnps.toString()!, 0, false);
    Screen_QI_C20A = Tools.Get_Screen(QI_C20A, context, DbTools.gActivite_ins.statutEntreprise!, 0, false);
    Screen_QF_C20C1 = Tools.Get_Screen(QF_C20C1, context, DbTools.gActivite_ins.raisonSocial!, 0, false);
    Screen_QF_C20C2 = Tools.Get_Screen(QF_C20C2, context, DbTools.gActivite_ins.adresseGeographiqueEntreprise!, 0, false);
    Screen_QI_C30 = Tools.Get_Screen(QI_C30, context, DbTools.gActivite_ins.effectifTotal.toString()!, 0, false);

    return WillPopScope(
        onWillPop: _onWillPop,
        child: Container(
          color: Colors.white,
          child: Scaffold(
            appBar: AppBar(
              title: CommonAppBar.TitleEcr("KYB${DbTools.isFORMEL ? 'F' : 'I'}", "INFOS COMPL", pageEntr, DbTools.pagesEntr, "B7I"),
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
                      Screen_QI_C15.Screen_Row,
                      Screen_QI_C15.Screen_Rep_Int != 1 ? Container() : Screen_QI_C15A.Screen_Row,
                      Screen_QI_C20A.Screen_Row,
                      Screen_QI_C20A.Screen_Rep_Int == 1 ? Container() : Screen_QF_C20C1.Screen_Row,
                      Screen_QI_C20A.Screen_Rep_Int == 1 ? Container() : Screen_QF_C20C2.Screen_Row,
                      Screen_QI_C20B.Screen_Row,

                      Screen_QI_C30.Screen_Row,


                    ]),
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(85, 15, 85, 15),
                child: ElevatedButton(
                  onPressed: () async {
                    print("Validation OK");
                    setState(() {
                      DbTools.gActivite_ins.declarationCnps = Screen_QI_C15.Screen_Rep_Str;
                      DbTools.gActivite_ins.numeroCnps = Screen_QI_C15A.Screen_Rep_Int;
                      DbTools.gActivite_ins.statutEntreprise = Screen_QI_C20A.Screen_Rep_Str;
                      DbTools.gActivite_ins.nombreEtablissement = Screen_QI_C20B.Screen_Rep_Str;
                      DbTools.gActivite_ins.raisonSocial = Screen_QF_C20C1.Screen_Rep_Str;
                      DbTools.gActivite_ins.adresseGeographiqueEntreprise = Screen_QF_C20C2.Screen_Rep_Str;
                      DbTools.gActivite_ins.effectifTotal = Screen_QI_C30.Screen_Rep_Int;

                      DbTools.pageEntr++;
                      PushPop.PushPop_Push(false);

                      DateTime dateDebutExploitation = DateTime.parse("2009-01-01");
                      try {
                        dateDebutExploitation = DateTime.parse(DbTools.gActivite_ins.dateDebutExploitation!);
                      } catch (_) {
                        dateDebutExploitation = DateTime.now();
                      }

                      Navigator.push(context, MaterialPageRoute(builder: (context) => I_KYB_Ins10I()));
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
            ),
          ),
        ));
  }
}
