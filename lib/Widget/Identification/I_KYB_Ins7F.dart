import 'package:colibri/Tools/DbTools.dart';
import 'package:colibri/Tools/gColors.dart';
import 'package:colibri/Widget/Identification/I_KYB_Ins10F.dart';
import 'package:colibri/widgetTools/PushPop.dart';
import 'package:colibri/widgetTools/toolbar.dart';
import 'package:flutter/material.dart';

import '../../Tools/Tools.dart';

class I_KYB_Ins7F extends StatefulWidget {
  @override
  I_KYB_Ins7FState createState() => I_KYB_Ins7FState();
}

class I_KYB_Ins7FState extends State<I_KYB_Ins7F> {

  Item QF_C14BAUTRE = Item();
  Screen Screen_QF_C14BAUTRE = Screen();



  Item QF_C19 = Item();
  Screen Screen_QF_C19 = Screen();
  Item QF_C19A0 = Item();
  Screen Screen_QF_C19A0 = Screen();
  Item QF_C19A = Item();
  Screen Screen_QF_C19A = Screen();

  Item QF_C21 = Item();
  Screen Screen_QF_C21 = Screen();
  Item QF_C22 = Item();
  Screen Screen_QF_C22 = Screen();
  Item QF_C22A = Item();
  Screen Screen_QF_C22A = Screen();
  Item QF_C23 = Item();
  Screen Screen_QF_C23 = Screen();
  Item QF_C24 = Item();
  Screen Screen_QF_C24 = Screen();
  Item QF_C24A = Item();
  Screen Screen_QF_C24A = Screen();
  Item QF_C24B1 = Item();
  Screen Screen_QF_C24B1 = Screen();
  Item QF_C24B2 = Item();
  Screen Screen_QF_C24B2 = Screen();


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
    pageEntr = DbTools.pageEntr;

    QF_C14BAUTRE = Tools.Get_UNIQUE("Q_C14BAUTRE");

    QF_C19 = Tools.Get_UNIQUE("Q_C19");
    QF_C19A = Tools.Get_UNIQUE("Q_C19A");

    QF_C21 = Tools.Get_UNIQUE   ("Q_C21");
    QF_C22 = Tools.Get_UNIQUE   ("Q_C22");
    QF_C22A = Tools.Get_UNIQUE  ("Q_C22A");
    QF_C23 = Tools.Get_UNIQUE   ("Q_C23");
    QF_C24 = Tools.Get_UNIQUE   ("Q_C24");
    QF_C24A = Tools.Get_UNIQUE  ("Q_C24A");
    QF_C24B1 = Tools.Get_UNIQUE ("Q_C24B1");
    QF_C24B2 = Tools.Get_UNIQUE ("Q_C24B2");
    QI_C20B = Tools.Get_UNIQUE  ("Q_C24A");
    QF_C20C1 = Tools.Get_UNIQUE ("Q_C24B1");
    QF_C20C2 = Tools.Get_UNIQUE ("Q_C24B2");
    QI_C30 = Tools.Get_UNIQUE   ("Q_C30");


    Screen_QF_C19 = Tools.Get_ScreenCallBack(QF_C19, context, DbTools.gActivite_ins.declarationCnps!, 0, false, screenVoidCallback);
    Screen_QF_C22 = Tools.Get_ScreenCallBack(QF_C22, context, DbTools.gActivite_ins.formeJuridique!, 0, false, screenVoidCallback);
    Screen_QF_C24A = Tools.Get_ScreenCallBack(QF_C24A, context, DbTools.gActivite_ins.nombreEtablissement!, 0, false, screenVoidCallback);

    print(" DbTools.gActivite_ins.autreTypeActivite!");
    print(" DbTools.gActivite_ins.autreTypeActivite! ${DbTools.gActivite_ins.autreTypeActivite!}");


    super.initState();

    setState(() {});
  }
  Future<bool> _onWillPop() async{
    print("_onWillPop");
    DbTools.pageEntr--;
    PushPop.PushPop_PopBack(context);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    if (DbTools.gActivite_ins.autreTypeActivite == "null") DbTools.gActivite_ins.autreTypeActivite = "";

    print(" DbTools.gActivite_ins.autreTypeActivite!");
    print(" DbTools.gActivite_ins.autreTypeActivite! ${DbTools.gActivite_ins.autreTypeActivite!}");


    Screen_QF_C14BAUTRE = Tools.Get_Screen(QF_C14BAUTRE, context, DbTools.gActivite_ins.autreTypeActivite!, 0, false);

   Screen_QF_C19A0 = Tools.Get_Screen(QF_C19A0, context, DbTools.gActivite_ins.numeroCnpsCommunicable!, 0, false);
    Screen_QF_C19A = Tools.Get_Screen(QF_C19A, context, DbTools.gActivite_ins.numeroCnps.toString()!, 0, false);
    Screen_QF_C21 = Tools.Get_Screen(QF_C21, context, DbTools.gActivite_ins.etatFonctionnementEntreprise!, 0, false);
    Screen_QF_C22A = Tools.Get_Screen(QF_C22A, context, DbTools.gActivite_ins.autreFormeJuridique!, 0, false);
    Screen_QF_C23 = Tools.Get_Screen(QF_C23, context, DbTools.gActivite_ins.capitalEnAction!, 0, false);
    Screen_QF_C24 = Tools.Get_Screen(QF_C24, context, DbTools.gActivite_ins.statutEntreprise!, 0, false);

    Screen_QF_C24B1 = Tools.Get_Screen(QF_C24B1, context, DbTools.gActivite_ins.raisonSocial!, 0, false);
    Screen_QF_C24B2 = Tools.Get_Screen(QF_C24B2, context, DbTools.gActivite_ins.adresseGeographiqueEntreprise!, 0, false);

    Screen_QF_C20C1 = Tools.Get_Screen(QF_C20C1, context, DbTools.gActivite_ins.raisonSocial!, 0, false);
    Screen_QF_C20C2 = Tools.Get_Screen(QF_C20C2, context, DbTools.gActivite_ins.adresseGeographiqueEntreprise!, 0, false);
    Screen_QI_C30 = Tools.Get_Screen(QI_C30, context, DbTools.gActivite_ins.effectifTotal.toString()!, 0, false);





    print("Screen_QF_C24A.Screen_Rep_Int ${Screen_QF_C24A.Screen_Rep_Int}");

    print(">>>>>>>>>>>>>>>>>>>   Build   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
    return WillPopScope(
        onWillPop: _onWillPop,
        child:Container(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          title: CommonAppBar.TitleEcr("KYB${DbTools.isFORMEL?'F' : 'I'}", "INFOS COMPL", pageEntr, DbTools.pagesEntr, "B7F"),
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
            child:
            Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [

                  Screen_QF_C14BAUTRE.Screen_Row,


                  Screen_QF_C19.Screen_Row,
                  Screen_QF_C19.Screen_Rep_Int == 2 ? Container() : Screen_QF_C19A.Screen_Row,
                  Screen_QF_C21.Screen_Row,
                  Screen_QF_C22.Screen_Row,
                  Screen_QF_C22.Screen_Rep_Int < 11 ? Container() : Screen_QF_C22A.Screen_Row,
                  Screen_QF_C23.Screen_Row,
                  Screen_QF_C24.Screen_Row,
                  Screen_QF_C24A.Screen_Row,
                  Screen_QF_C24A.Screen_Rep_Int == 0 || Screen_QF_C24A.Screen_Rep_Int == 998 ? Container() : Screen_QF_C24B1.Screen_Row,
                  Screen_QF_C24A.Screen_Rep_Int == 0 || Screen_QF_C24A.Screen_Rep_Int == 998 ? Container() : Screen_QF_C24B2.Screen_Row,

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
                  DbTools.gActivite_ins.autreTypeActivite = Screen_QF_C14BAUTRE.Screen_Rep_Str;
                  DbTools.gActivite_ins.declarationCnps = Screen_QF_C19.Screen_Rep_Str;
                  DbTools.gActivite_ins.numeroCnpsCommunicable = Screen_QF_C19A0.Screen_Rep_Str;
                  DbTools.gActivite_ins.numeroCnps = Screen_QF_C19A.Screen_Rep_Int;
                  DbTools.gActivite_ins.etatFonctionnementEntreprise = Screen_QF_C21.Screen_Rep_Str;
                  DbTools.gActivite_ins.formeJuridique = Screen_QF_C22.Screen_Rep_Str;
                  DbTools.gActivite_ins.autreFormeJuridique = Screen_QF_C22A.Screen_Rep_Str;
                  DbTools.gActivite_ins.capitalEnAction = Screen_QF_C23.Screen_Rep_Str;
                  DbTools.gActivite_ins.statutEntreprise = Screen_QF_C24.Screen_Rep_Str;
                  DbTools.gActivite_ins.nombreEtablissement = Screen_QF_C24A.Screen_Rep_Str;
                  DbTools.gActivite_ins.raisonSocial = Screen_QF_C24B1.Screen_Rep_Str;
                  DbTools.gActivite_ins.adresseGeographiqueEntreprise = Screen_QF_C24B2.Screen_Rep_Str;
                  DbTools.gActivite_ins.nombreEtablissement = Screen_QI_C20B.Screen_Rep_Str;
                  DbTools.gActivite_ins.raisonSocial = Screen_QF_C20C1.Screen_Rep_Str;
                  DbTools.gActivite_ins.adresseGeographiqueEntreprise = Screen_QF_C20C2.Screen_Rep_Str;
                  DbTools.gActivite_ins.effectifTotal = Screen_QI_C30.Screen_Rep_Int;

print(" statutEntreprise ${DbTools.gActivite_ins.statutEntreprise}");


                  DbTools.pageEntr++;
                  PushPop.PushPop_Push(false);

                  Navigator.push(context, MaterialPageRoute(builder: (context) => I_KYB_Ins10F()));
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
