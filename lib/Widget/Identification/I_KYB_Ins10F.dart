import 'package:colibri/Tools/DbTools.dart';
import 'package:colibri/Tools/gColors.dart';
import 'package:colibri/Widget/Identification/I_KYB_InsFIN.dart';
import 'package:colibri/widgetTools/PushPop.dart';
import 'package:colibri/widgetTools/toolbar.dart';
import 'package:flutter/material.dart';

import '../../Tools/Tools.dart';

class I_KYB_Ins10F extends StatefulWidget {
  @override
  I_KYB_Ins10FState createState() => I_KYB_Ins10FState();
}

class I_KYB_Ins10FState extends State<I_KYB_Ins10F> {
  Item QF_E1 = Item();
  Screen Screen_QF_E1 = Screen();
  Item QF_E1AUTRE = Item();
  Screen Screen_QF_E1AUTRE = Screen();

  Item QF_E1A = Item();
  Screen Screen_QF_E1A = Screen();
  Item QF_E1B = Item();
  Screen Screen_QF_E1B = Screen();
  Item QF_E1C = Item();
  Screen Screen_QF_E1C = Screen();
  Item QF_E1D = Item();
  Screen Screen_QF_E1D = Screen();
  Item QF_E1E = Item();
  Screen Screen_QF_E1E = Screen();
  Item QF_E1F = Item();
  Screen Screen_QF_E1F = Screen();
  Item QF_E1G = Item();
  Screen Screen_QF_E1G = Screen();
  Item QF_E1H = Item();
  Screen Screen_QF_E1H = Screen();
  Item QF_E1I = Item();
  Screen Screen_QF_E1I = Screen();
  Item QF_E1J = Item();
  Screen Screen_QF_E1J = Screen();
  Item QF_E1K = Item();
  Screen Screen_QF_E1K = Screen();
  Item QF_E1L = Item();
  Screen Screen_QF_E1L = Screen();
  Item QF_E1M = Item();
  Screen Screen_QF_E1M = Screen();
  Item QF_E1N = Item();
  Screen Screen_QF_E1N = Screen();
  Item QF_E1O = Item();
  Screen Screen_QF_E1O = Screen();
  Item QF_E1P = Item();
  Screen Screen_QF_E1P = Screen();
  Item QF_E1Q = Item();
  Screen Screen_QF_E1Q = Screen();
  Item QF_E1R = Item();
  Screen Screen_QF_E1R = Screen();
  Item QF_E1S = Item();
  Screen Screen_QF_E1S = Screen();
  Item QF_E1T = Item();
  Screen Screen_QF_E1T = Screen();
  Item QF_E1U = Item();
  Screen Screen_QF_E1U = Screen();
  int pageEntr = 0;

  void screenVoidCallback() {
    print("screenVoidCallback");
    setState(() {});
  }

  void initState() {
    pageEntr = DbTools.pageEntr;
    QF_E1 = Tools.Get_UNIQUE("Q_E1");
    QF_E1AUTRE = Tools.Get_UNIQUE("Q_E1AUTRE");
    QF_E1A = Tools.Get_UNIQUE("Q_E1A");
    QF_E1B = Tools.Get_UNIQUE("Q_E1B");
    QF_E1C = Tools.Get_UNIQUE("Q_E1C");
    QF_E1D = Tools.Get_UNIQUE("Q_E1D");
    QF_E1E = Tools.Get_UNIQUE("Q_E1E");
    QF_E1F = Tools.Get_UNIQUE("Q_E1F");
    QF_E1G = Tools.Get_UNIQUE("Q_E1G");
    QF_E1H = Tools.Get_UNIQUE("Q_E1H");
    QF_E1I = Tools.Get_UNIQUE("Q_E1I");
    QF_E1J = Tools.Get_UNIQUE("Q_E1J");
    QF_E1K = Tools.Get_UNIQUE("Q_E1K");
    QF_E1L = Tools.Get_UNIQUE("Q_E1L");
    QF_E1M = Tools.Get_UNIQUE("Q_E1M");
    QF_E1N = Tools.Get_UNIQUE("Q_E1N");
    QF_E1O = Tools.Get_UNIQUE("Q_E1O");
    QF_E1P = Tools.Get_UNIQUE("Q_E1P");
    QF_E1Q = Tools.Get_UNIQUE("Q_E1Q");
    QF_E1R = Tools.Get_UNIQUE("Q_E1R");
    QF_E1S = Tools.Get_UNIQUE("Q_E1S");
    QF_E1T = Tools.Get_UNIQUE("Q_E1T");
    QF_E1U = Tools.Get_UNIQUE("Q_E1U");


    Screen_QF_E1 = Tools.Get_ScreenCallBack(QF_E1, context, DbTools.gActivite_ins.contrainteRencontre!, 0, false, screenVoidCallback);

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
    Screen_QF_E1AUTRE = Tools.Get_Screen(QF_E1AUTRE, context, DbTools.gActivite_ins.autreContrainte!, 0, false);
    Screen_QF_E1A = Tools.Get_Screen(QF_E1A, context, DbTools.gActivite_ins.manquePersonnelQualifie!, 0, false);
    Screen_QF_E1B = Tools.Get_Screen(QF_E1B, context, DbTools.gActivite_ins.coutEleveMainOeuvre!, 0, false);
    Screen_QF_E1C = Tools.Get_Screen(QF_E1C, context, DbTools.gActivite_ins.formaliteAdministrativeContraignante!, 0, false);
    Screen_QF_E1D = Tools.Get_Screen(QF_E1D, context, DbTools.gActivite_ins.taxeImpotEleve!, 0, false);
    Screen_QF_E1E = Tools.Get_Screen(QF_E1E, context, DbTools.gActivite_ins.coutTranportEleve!, 0, false);
    Screen_QF_E1F = Tools.Get_Screen(QF_E1F, context, DbTools.gActivite_ins.mauvaisEtatInfrastructure!, 0, false);
    Screen_QF_E1G = Tools.Get_Screen(QF_E1G, context, DbTools.gActivite_ins.difficulteApprovisionnementMatierePremiere!, 0, false);
    Screen_QF_E1H = Tools.Get_Screen(QF_E1H, context, DbTools.gActivite_ins.procedureContentieux!, 0, false);
    Screen_QF_E1I = Tools.Get_Screen(QF_E1I, context, DbTools.gActivite_ins.ecoulementProduction!, 0, false);
    Screen_QF_E1J = Tools.Get_Screen(QF_E1J, context, DbTools.gActivite_ins.accesAuTechnologie!, 0, false);
    Screen_QF_E1K = Tools.Get_Screen(QF_E1K, context, DbTools.gActivite_ins.manqueMachine!, 0, false);
    Screen_QF_E1L = Tools.Get_Screen(QF_E1L, context, DbTools.gActivite_ins.manqueExpertiseTechnique!, 0, false);
    Screen_QF_E1M = Tools.Get_Screen(QF_E1M, context, DbTools.gActivite_ins.manqueLocalAdapte!, 0, false);
    Screen_QF_E1N = Tools.Get_Screen(QF_E1N, context, DbTools.gActivite_ins.accesCommandePublic!, 0, false);
    Screen_QF_E1O = Tools.Get_Screen(QF_E1O, context, DbTools.gActivite_ins.accesStructureAppui!, 0, false);
    Screen_QF_E1P = Tools.Get_Screen(QF_E1P, context, DbTools.gActivite_ins.accesCreditBancaire!, 0, false);
    Screen_QF_E1Q = Tools.Get_Screen(QF_E1Q, context, DbTools.gActivite_ins.approvisionnementEnergie!, 0, false);
    Screen_QF_E1R = Tools.Get_Screen(QF_E1R, context, DbTools.gActivite_ins.concurrenceDeloyale!, 0, false);
    Screen_QF_E1S = Tools.Get_Screen(QF_E1S, context, DbTools.gActivite_ins.corruption!, 0, false);
    Screen_QF_E1T = Tools.Get_Screen(QF_E1T, context, DbTools.gActivite_ins.autreContrainte!, 0, false);
    Screen_QF_E1U = Tools.Get_Screen(QF_E1U, context, DbTools.gActivite_ins.aucuneContrainte!, 0, false);

    print(">>>>>>>>>>>>>>>>>>>   Build  ${Screen_QF_E1.Screen_Rep_Int}  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
    return WillPopScope(
        onWillPop: _onWillPop,
        child:Container(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          title: CommonAppBar.TitleEcr("KYB${DbTools.isFORMEL?'F' : 'I'}", "INFOS CONTR", pageEntr, DbTools.pagesEntr, "B10F"),
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
                  Screen_QF_E1.Screen_Row,
                  Screen_QF_E1.Screen_Rep_Int != 21 ? Container() : Screen_QF_E1AUTRE.Screen_Row,
                  Screen_QF_E1A.Screen_Row,
                  Screen_QF_E1B.Screen_Row,
                  Screen_QF_E1C.Screen_Row,
                  Screen_QF_E1D.Screen_Row,
                  Screen_QF_E1E.Screen_Row,
                  Screen_QF_E1F.Screen_Row,
                  Screen_QF_E1G.Screen_Row,
                  Screen_QF_E1H.Screen_Row,
                  Screen_QF_E1I.Screen_Row,
                  Screen_QF_E1J.Screen_Row,
                  Screen_QF_E1K.Screen_Row,
                  Screen_QF_E1L.Screen_Row,
                  Screen_QF_E1M.Screen_Row,
                  Screen_QF_E1N.Screen_Row,
                  Screen_QF_E1O.Screen_Row,
                  Screen_QF_E1P.Screen_Row,
                  Screen_QF_E1Q.Screen_Row,
                  Screen_QF_E1R.Screen_Row,
                  Screen_QF_E1S.Screen_Row,
                  Screen_QF_E1T.Screen_Row,
                  Screen_QF_E1U.Screen_Row,
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
                  DbTools.gActivite_ins.contrainteRencontre = Screen_QF_E1.Screen_Rep_Str;
                  DbTools.gActivite_ins.autreContrainte = Screen_QF_E1AUTRE.Screen_Rep_Str;
                  DbTools.gActivite_ins.manquePersonnelQualifie = Screen_QF_E1A.Screen_Rep_Str;
                  DbTools.gActivite_ins.coutEleveMainOeuvre = Screen_QF_E1B.Screen_Rep_Str;
                  DbTools.gActivite_ins.formaliteAdministrativeContraignante = Screen_QF_E1C.Screen_Rep_Str;
                  DbTools.gActivite_ins.taxeImpotEleve = Screen_QF_E1D.Screen_Rep_Str;
                  DbTools.gActivite_ins.coutTranportEleve = Screen_QF_E1E.Screen_Rep_Str;
                  DbTools.gActivite_ins.mauvaisEtatInfrastructure = Screen_QF_E1F.Screen_Rep_Str;
                  DbTools.gActivite_ins.difficulteApprovisionnementMatierePremiere = Screen_QF_E1G.Screen_Rep_Str;
                  DbTools.gActivite_ins.procedureContentieux = Screen_QF_E1H.Screen_Rep_Str;
                  DbTools.gActivite_ins.ecoulementProduction = Screen_QF_E1I.Screen_Rep_Str;
                  DbTools.gActivite_ins.accesAuTechnologie = Screen_QF_E1J.Screen_Rep_Str;
                  DbTools.gActivite_ins.manqueMachine = Screen_QF_E1K.Screen_Rep_Str;
                  DbTools.gActivite_ins.manqueExpertiseTechnique = Screen_QF_E1L.Screen_Rep_Str;
                  DbTools.gActivite_ins.manqueLocalAdapte = Screen_QF_E1M.Screen_Rep_Str;
                  DbTools.gActivite_ins.accesCommandePublic = Screen_QF_E1N.Screen_Rep_Str;
                  DbTools.gActivite_ins.accesStructureAppui = Screen_QF_E1O.Screen_Rep_Str;
                  DbTools.gActivite_ins.accesCreditBancaire = Screen_QF_E1P.Screen_Rep_Str;
                  DbTools.gActivite_ins.approvisionnementEnergie = Screen_QF_E1Q.Screen_Rep_Str;
                  DbTools.gActivite_ins.concurrenceDeloyale = Screen_QF_E1R.Screen_Rep_Str;
                  DbTools.gActivite_ins.corruption = Screen_QF_E1S.Screen_Rep_Str;
                  DbTools.gActivite_ins.autreContrainte = Screen_QF_E1T.Screen_Rep_Str;
                  DbTools.gActivite_ins.aucuneContrainte = Screen_QF_E1U.Screen_Rep_Str;
                  DbTools.pageEntr++;
                  PushPop.PushPop_Push(false);

                  Navigator.push(context, MaterialPageRoute(builder: (context) => I_KYB_InsFIN()));
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
