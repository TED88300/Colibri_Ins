import 'package:auto_size_text/auto_size_text.dart';
import 'package:Colibri_Collecte/Tools/DbTools.dart';
import 'package:Colibri_Collecte/Tools/gColors.dart';
import 'package:Colibri_Collecte/Widget/Identification/I_KYB_Ins4_Carte.dart';
import 'package:Colibri_Collecte/Widget/Identification/I_KYB_Ins5_Name.dart';
import 'package:Colibri_Collecte/widgetTools/PushPop.dart';
import 'package:Colibri_Collecte/widgetTools/toolbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';

class I_KYB_Ins4_ODP extends StatefulWidget {
  @override
  I_KYB_Ins4_ODPState createState() => I_KYB_Ins4_ODPState();
}

class Mt {
  final String? Mtcfa;
  final String? Lib;
  Mt({this.Mtcfa, this.Lib});
}

class I_KYB_Ins4_ODPState extends State<I_KYB_Ins4_ODP> {
  TextEditingController Edt_Long = new TextEditingController();
  TextEditingController Edt_Larg = new TextEditingController();

  TextEditingController Edt_LongP = new TextEditingController();
  TextEditingController Edt_LargP = new TextEditingController();
  TextEditingController Edt_LongE = new TextEditingController();
  TextEditingController Edt_LargE = new TextEditingController();

  TextEditingController Edt_Bal = new TextEditingController();
  TextEditingController Edt_SurfLoc = new TextEditingController();
  String Edt_SurfLoc_Error = "";

  
  List<Mt> mts = [
    Mt(Mtcfa: "0", Lib: "0 CFA"),
    Mt(Mtcfa: "4000", Lib: "4 000 CFA"),
    Mt(Mtcfa: "7000", Lib: "7 000 CFA"),
    Mt(Mtcfa: "8400", Lib: "8 400 CFA"),
    Mt(Mtcfa: "10000", Lib: "10 000 CFA"),
    Mt(Mtcfa: "11200", Lib: "11 200 CFA"),
    Mt(Mtcfa: "14000", Lib: "14 000 CFA"),
    Mt(Mtcfa: "15000", Lib: "15 000 CFA"),
    Mt(Mtcfa: "16000", Lib: "16 000 CFA"),
    Mt(Mtcfa: "17000", Lib: "17 000 CFA"),
    Mt(Mtcfa: "17500", Lib: "17 500 CFA"),
    Mt(Mtcfa: "20000", Lib: "20 000 CFA"),
    Mt(Mtcfa: "25000", Lib: "25 000 CFA"),
    Mt(Mtcfa: "56000", Lib: "56 000 CFA"),
    Mt(Mtcfa: "70000", Lib: "70 000 CFA"),
  ];

  late FocusNode EmptyFocusNode1;
  late FocusNode EmptyFocusNode2;
  late FocusNode EmptyFocusNode3;
  late FocusNode EmptyFocusNode4;
  late FocusNode EmptyFocusNode5;
  late FocusNode EmptyFocusNode6;
  late FocusNode EmptyFocusNode7;
  late FocusNode EmptyFocusNode8;

  void Reload() async {}
  int pageEntr = 0;

  void initLib() async {
    Reload();
  }

  void initState() {
    pageEntr = DbTools.pageEntr;

    super.initState();
    EmptyFocusNode1 = FocusNode();
    EmptyFocusNode2 = FocusNode();
    EmptyFocusNode3 = FocusNode();
    EmptyFocusNode4 = FocusNode();
    EmptyFocusNode5 = FocusNode();
    EmptyFocusNode6 = FocusNode();
    EmptyFocusNode7 = FocusNode();
    EmptyFocusNode8 = FocusNode();

    initLib();

    print("initState A ${DbTools.gActivite_ins.longueur}");

    if (DbTools.gActivite_ins.longueur == null) DbTools.gActivite_ins.longueur = 0;
    if (DbTools.gActivite_ins.largeur == null) DbTools.gActivite_ins.largeur = 0;
    if (DbTools.gActivite_ins.pubLongueur == null) DbTools.gActivite_ins.pubLongueur = 0;
    if (DbTools.gActivite_ins.pubLargeur == null) DbTools.gActivite_ins.pubLargeur = 0;
    if (DbTools.gActivite_ins.pubLongueur2 == null) DbTools.gActivite_ins.pubLongueur2 = 0;
    if (DbTools.gActivite_ins.pubLargeur2 == null) DbTools.gActivite_ins.pubLargeur2 = 0;
    if (DbTools.gActivite_ins.bauxLoyer == null) DbTools.gActivite_ins.bauxLoyer = "0";
    if (DbTools.gActivite_ins.surface_local_en_mettre_carre == null) DbTools.gActivite_ins.surface_local_en_mettre_carre = 0.0;

    Edt_Long.text =   "${DbTools.gActivite_ins.longueur!}";
    Edt_Larg.text =   "${DbTools.gActivite_ins.largeur!}";
    Edt_LongP.text =  "${DbTools.gActivite_ins.pubLongueur!}";
    Edt_LargP.text =  "${DbTools.gActivite_ins.pubLargeur!}";
    Edt_LongE.text =  "${DbTools.gActivite_ins.pubLongueur2!}";
    Edt_LargE.text =  "${DbTools.gActivite_ins.pubLargeur2!}";
    Edt_Bal.text =    "${DbTools.gActivite_ins.bauxLoyer!}";
    Edt_SurfLoc.text = "${DbTools.gActivite_ins.surface_local_en_mettre_carre!}";
  }






  Future<bool> _onWillPop() async{
    print("_onWillPop");
    DbTools.pageEntr--;
    PushPop.PushPop_PopBack(context);
    return false;
  }


  @override
  Widget build(BuildContext context) {
    double Surf = double.parse(Edt_Long.text) * double.parse(Edt_Larg.text);
    double SurfP = double.parse(Edt_LongP.text) * double.parse(Edt_LargP.text);
    double SurfE = double.parse(Edt_LongE.text) * double.parse(Edt_LargE.text);
    double larg = 80;


    Edt_SurfLoc_Error = "";
    double SurfLoc = 0;
    try{
      SurfLoc = double.parse(Edt_SurfLoc.text);
    }catch(e)
    {
      Edt_SurfLoc.text = "0";
    }
    if (SurfLoc == 0) Edt_SurfLoc_Error = "Surface invalide";




    int wFlex = 6;

    return WillPopScope(
        onWillPop: _onWillPop,
        child:Container(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          title: CommonAppBar.TitleEcr("KYB${DbTools.isFORMEL?'F' : 'I'}", "ODP PUB", pageEntr, DbTools.pagesEntr, "B4"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              print("leading");
              DbTools.pageEntr--;
              PushPop.PushPop_Pop(context);
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
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
          child:  Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                ContribuableWidget(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 15, 10),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Container(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Flexible(
                            flex: wFlex + 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 2,
                                ),
                                Text(
                                  "SURF. ODP",
                                  style: gColors.bodyTextFieldBold,
                                ),
                                Container(
                                  height: 10,
                                ),
                                Text(
                                  "${Surf.toStringAsFixed(2)} m2",
                                  style: gColors.bodyTextFieldBold,
                                ),
                              ],
                            )),
                        Container(
                          width: 10,
                        ),
                        Flexible(
                          flex: wFlex,
                          child: gColors.colTextFieldNum(Edt_Long, 'LONGUEUR', EmptyFocusNode1, ""),
                        ),
                        Container(
                          width: 10,
                        ),
                        Flexible(
                          flex: wFlex,
                          child: gColors.colTextFieldNum(Edt_Larg, 'LARGEUR', EmptyFocusNode2, ""),
                        ),
                      ],
                    ),


                    Row(
                      children: [
                        Expanded(
                          child: gColors.colTextFieldNumSep(Edt_Bal, 'BAUX A LOYER', EmptyFocusNode3, ""),
                        ),
                      ],
                    ),



                    Row(
                      children: [
                        Flexible(
                            flex: wFlex + 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "SURF. PEINTE",
                                  style: gColors.bodyTextFieldBold,
                                ),
                                Container(
                                  height: 10,
                                ),
                                Text(
                                  "${SurfP.toStringAsFixed(2)} m2",
                                  style: gColors.bodyTextFieldBold,
                                ),
                              ],
                            )),
                        Container(
                          width: 10,
                        ),
                        Flexible(
                          flex: wFlex,
                          child: gColors.colTextFieldNum(Edt_LongP, 'LONGUEUR', EmptyFocusNode4, ""),
                        ),
                        Container(
                          width: 10,
                        ),
                        Flexible(
                          flex: wFlex,
                          child: gColors.colTextFieldNum(Edt_LargP, 'LARGEUR', EmptyFocusNode5, ""),
                        ),
                      ],
                    ),
                    Container(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Flexible(
                            flex: wFlex + 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 3,
                                ),
                                Text(
                                  "SURF. ENSEIG.",
                                  style: gColors.bodyTextFieldBold,
                                ),
                                Container(
                                  height: 10,
                                ),
                                Text(
                                  "${SurfE.toStringAsFixed(2)} m2",
                                  style: gColors.bodyTextFieldBold,
                                ),
                              ],
                            )),
                        Container(
                          width: 10,
                        ),
                        Flexible(
                          flex: wFlex,
                          child: gColors.colTextFieldNum(Edt_LongE, 'LONGUEUR', EmptyFocusNode6, ""),
                        ),
                        Container(
                          width: 10,
                        ),
                        Flexible(
                          flex: wFlex,
                          child: gColors.colTextFieldNum(Edt_LargE, 'LARGEUR', EmptyFocusNode7, ""),
                        ),
                      ],
                    ),
                    Container(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: gColors.colTextFieldNum(Edt_SurfLoc, 'SURF. DU LOCAL (m2)', EmptyFocusNode8, Edt_SurfLoc_Error),
                        ),
                      ],
                    ),





                  ]),
                ),
              ]),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(85, 15, 85, 15),
            child: ElevatedButton(
              onPressed: () async {

                bool isctrlSaisie = await ctrlSaisie();
                if (!isctrlSaisie) {
                  return;
                }

                double SurfLoc = 0;
                try{
                  SurfLoc = double.parse(Edt_SurfLoc.text);
                }catch(e)
                {
                  Edt_SurfLoc.text = "0";
                }




                DbTools.gActivite_ins.odp = Surf.toInt();
                DbTools.gActivite_ins.longueur = double.parse(Edt_Long.text);
                DbTools.gActivite_ins.largeur = double.parse(Edt_Larg.text);
                DbTools.gActivite_ins.pubEnMettreCarre = SurfP;
                DbTools.gActivite_ins.pubLongueur = double.parse(Edt_LongP.text);
                DbTools.gActivite_ins.pubLargeur = double.parse(Edt_LargP.text);
                DbTools.gActivite_ins.pubEnMettreCarre2 = SurfE.toInt();
                DbTools.gActivite_ins.pubLongueur2 = double.parse(Edt_LongE.text);
                DbTools.gActivite_ins.pubLargeur2 = double.parse(Edt_LargE.text);
                DbTools.gActivite_ins.bauxLoyer = Edt_Bal.text;
                DbTools.gActivite_ins.surface_local_en_mettre_carre = SurfLoc;

                setState(() {
                  DbTools.pageEntr++;

                  PushPop.PushPop_Push(false);


                  if (DbTools.isFORMEL)
                    Navigator.push(context, MaterialPageRoute(builder: (context) => I_KYB_Ins5_Name()));
                    else
                    Navigator.push(context, MaterialPageRoute(builder: (context) => I_KYB_Ins4_Carte()));


                  //Navigator.push(context, MaterialPageRoute(builder: (context) => I_KYB_Ins5_Name()));


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

  Widget ContribuableWidget() {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        AutoSizeText(
          "Entreprenant : ${DbTools.gEntreprenant.nomPrenomDirigeant!.toUpperCase()}",
          maxLines: 1,
          style: TextStyle(color: gColors.primary, fontWeight: FontWeight.bold, fontSize: 16),
        ),


        Container(height: 10),
        Container(height: 1, color: Colors.black)
      ]),
    );
  }



  @override
  Widget DD_Bal_Act() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "BAUX A LOYER :",
          style: gColors.bodyTextFieldBold,
        ),
        Container(
          width: 15,
        ),
        DropDown<Mt>(
          items: mts,
          initialValue: mts.first,
          icon: Icon(
            Icons.expand_more,
            color: gColors.secondary,
          ),
          customWidgets: mts.map((m) => buildDropDownRow(m)).toList(),
          onChanged: (Mt? mt) {
            setState(() {
              DbTools.gActivite_ins.bauxLoyer = mt!.Mtcfa;
            });
          },
        ),
      ],
    );
  }

  Widget buildDropDownRow(Mt mt) {
    return Text(mt.Lib ?? "Select");
  }

  
  Future<bool> ctrlSaisie() async {
    bool isOK = true;

    Edt_SurfLoc_Error = "";
    double SurfLoc = 0;
    try{
      SurfLoc = double.parse(Edt_SurfLoc.text);
    }catch(e)
    {
      Edt_SurfLoc.text = "0";
    }

    print(' SurfLoc $SurfLoc');

    if (SurfLoc == 0) {
      isOK = false;
      await gColors.PopupError(context, "Erreur de saisie", "Surface invalide");
      Edt_SurfLoc_Error = "Surface invalide";
      setState(() {});
      return isOK;
    }

    
    return isOK;
  }




}
