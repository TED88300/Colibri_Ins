import 'package:auto_size_text/auto_size_text.dart';
import 'package:colibri/Tools/DbData.dart';
import 'package:colibri/Tools/DbTools.dart';
import 'package:colibri/Tools/Tools.dart';
import 'package:colibri/Tools/gColors.dart';
import 'package:colibri/Widget/Identification/I_KYB_Ins6F.dart';
import 'package:colibri/Widget/Identification/I_KYB_Ins6I.dart';
import 'package:colibri/widgetTools/PushPop.dart';
import 'package:colibri/widgetTools/toolbar.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../Tools/DbOdoo.dart';

class I_KYB_Ins5_Name extends StatefulWidget {
  @override
  I_KYB_Ins5_NameState createState() => I_KYB_Ins5_NameState();
}

class I_KYB_Ins5_NameState extends State<I_KYB_Ins5_Name> {
  String? Type_Act = '';
  String Secteur_Act = "";
  int Secteur_ActID = 0;
  String? Forme_Act = 'SERVICE';

  String Periode = 'Permanent';


  TextEditingController Edt_Nom = new TextEditingController();
  String Edt_Nom_Error = "";
  String Edt_Adresse_Error = "";

  late FocusNode EmptyFocusNode;
  late FocusNode EmptyFocusNodeD;
  late FocusNode EmptyFocusNodeM;
  late FocusNode EmptyFocusNodem;

  bool? isCga = false;
  DateTime DateTime_activity_birthday = DateTime.parse("1900-01-01");
  DateTime DateTime_activity_date_adhesion = DateTime.parse("1900-01-01");
  DateTime DateTime_activity_periode_imposition = DateTime.parse("1900-01-01");

  TextEditingController Edt_ref_cga = new TextEditingController();

  //**************************************
  //**************************************
  //**************************************

  TextEditingController Edt_CA_Taxable = new TextEditingController();
  String Edt_CA_Taxable_Error = "";

  TextEditingController Edt_CA_Min = new TextEditingController();
  TextEditingController Edt_CA_Max = new TextEditingController();
  TextEditingController Edt_tauxImposition = new TextEditingController();

  TextEditingController Edt_paiement_prec = new TextEditingController();

  String? Taille_Act = 'Petite';
  String? Type_Taxe_Dgi = '???';
  String? Type_Taxe_All = '???';
  String? Regime = 'TCE';

  List<String> lType_Taxe_ALL = ['FORFAITAIRE (PCA)', 'ETABLISSEMENT DE NUIT (ETN)', 'ODP', 'GROS ODP', 'TICKET MARCHE', 'PUB'];

  List<String> lType_Taxe_DGI = ['ETABLISSEMENT DE NUIT (ETN)', 'ODP', 'GROS ODP', 'PUB'];

  final _items = DbTools.lfSva.map((sva) => MultiSelectItem<Sva>(sva, sva.sva_name!)).toList();

  List<Sva> selectedSvas = [];

  List<String> lType_Act = ['???','Ordinaire', 'Taxi', 'Taxi brousse', 'Stationnement', 'Transport'];

  //**************************************
  //**************************************
  //**************************************

  TextEditingController Edt_Adresse = new TextEditingController();
  TextEditingController Edt_Adresse2 = new TextEditingController();
  TextEditingController Edt_City = new TextEditingController();

  TextEditingController Edt_Tel = new TextEditingController();
  TextEditingController Edt_Mobile = new TextEditingController();
  String Edt_Tel_Error = "";
  String Edt_Mobile_Error = "";


  //**************************************
  //**************************************
  //**************************************

  Item QF_C13 = Item();
  Screen Screen_QF_C13 = Screen();
  Item QF_C14 = Item();
  Screen Screen_QF_C14 = Screen();

  Item QF_B18 = Item();
  Screen Screen_QF_B18 = Screen();
  Item QF_B19B = Item();
  Screen Screen_QF_B19B = Screen();
  Item QF_B19AB = Item();
  Screen Screen_QF_B19AB = Screen();

  Item QF_B20 = Item();
  Screen Screen_QF_B20 = Screen();
  Item QF_C11 = Item();
  Screen Screen_QF_C11 = Screen();

  Item Q_B8 = Item();Screen Screen_Q_B8 = Screen();
  Item Q_B8A = Item();Screen Screen_Q_B8A = Screen();
  Item Q_B8C1 = Item();Screen Screen_Q_B8C1 = Screen();
  Item BC2 = Item();Screen Screen_BC2 = Screen();



  int pageEntr = 0;

  void initLib() async {
    print("initLib() A");
    //    await DbTools.initFournisseurDownMennu(DbTools.gActivite_ins.activiteId!);
  }

  void initState() {
    pageEntr = DbTools.pageEntr;

    super.initState();
    EmptyFocusNode = FocusNode();
    EmptyFocusNodeD = FocusNode();
    EmptyFocusNodeM = FocusNode();
    EmptyFocusNodem = FocusNode();

    QF_C13 = Tools.Get_UNIQUE("Q_C13");
    QF_C14 = Tools.Get_UNIQUE("Q_C14");

    QF_B18 = Tools.Get_UNIQUE("Q_C5");
    QF_B19B = Tools.Get_UNIQUE("Q_C6B");
    QF_B19AB = Tools.Get_UNIQUE("Q_C7B");
    QF_B20 = Tools.Get_UNIQUE("Q_C10");
    QF_C11 = Tools.Get_UNIQUE("Q_C11");

    Q_B8 = Tools.Get_UNIQUE("Q_B8");
    Q_B8A = Tools.Get_UNIQUE("Q_B8A");
    Q_B8C1 = Tools.Get_UNIQUE("Q_B8C1");
    BC2 = Tools.Get_UNIQUE("BC2");

    initLib();

    Edt_Nom.text = DbTools.gActivite_ins.name!;

    if (DbTools.gActivite_ins.activiteTypeId! < 0) DbTools.gActivite_ins.activiteTypeId = 0;
    Type_Act = lType_Act[DbTools.gActivite_ins.activiteTypeId!];

    if (DbTools.gActivite_ins.secteurId! < 0) DbTools.gActivite_ins.secteurId = 0;

    DbTools.selectedSecteur = DbTools.lfSecteur[0];
    for (int i = 0; i < DbTools.lfSecteur.length; ++i) {
      Secteur wSecteur = DbTools.lfSecteur[i];
      if (wSecteur.secteurid == DbTools.gActivite_ins.secteurId!)
        {
          DbTools.selectedSecteur = wSecteur;
        }
     }

    Forme_Act = DbTools.selectedSecteur!.secteur_forme;
    print(">Forme_Act  ${DbTools.selectedSecteur}");

    String? activity_birthday = DbTools.gActivite_ins.activityBirthday;

    if (activity_birthday == null) activity_birthday = "";
    if (!activity_birthday.isEmpty) {
      try {
        DateTime_activity_birthday = DateTime.parse(activity_birthday);
      } catch (_) {
        DateTime_activity_birthday = DateTime.parse("1900-01-01");
      }
    }

    //****************************************
    //****************************************
    //****************************************

    isCga = (DbTools.gActivite_ins.cga == "Oui");

    String? date_adhesion = DbTools.gActivite_ins.dateAdhesion;
    if (date_adhesion == null) date_adhesion = "";
    if (!date_adhesion.isEmpty) {
      try {
        DateTime_activity_date_adhesion = DateTime.parse(date_adhesion);
      } catch (_) {
        DateTime_activity_date_adhesion = DateTime.parse("1900-01-01");
      }
    }
    Edt_ref_cga.text = DbTools.gActivite_ins.refCga!;

    String? periodeImposition = DbTools.gActivite_ins.periodeImposition;
    if (periodeImposition == null) periodeImposition = "";
    if (!periodeImposition.isEmpty) {
      try {
        DateTime_activity_periode_imposition = DateTime.parse(date_adhesion);
      } catch (_) {
        DateTime_activity_periode_imposition = DateTime.parse("1900-01-01");
      }
    }
    int i = 0;

    Edt_CA_Min.text = "${DbTools.gActivite_ins.minCa!}";
    Edt_CA_Max.text = "${DbTools.gActivite_ins.minCa!}";

    Edt_tauxImposition.text = "${DbTools.gActivite_ins.tauxImposition!}";

    Taille_Act = DbTools.gActivite_ins.tailleActivite;
    if (Taille_Act!.length == 0) Taille_Act = "???";

    Edt_CA_Taxable.text = "${DbTools.gActivite_ins.chiffreAffaireTaxable!}";

    if (Edt_CA_Taxable.text.isEmpty) {
      Edt_CA_Taxable_Error = "Erreur de saisie : CA DECLARE vide";
    }

    Regime = DbTools.gActivite_ins.regimeFiscale;

    if (Regime != 'TCE' && Regime != 'DGI') {
      Regime = 'TCE';
    }
    if (Regime == 'DGI') Taille_Act = 'DGI';

    Type_Taxe_All = DbTools.gActivite_ins.typeTaxe.toString();
    Type_Taxe_Dgi = DbTools.gActivite_ins.typeTaxe.toString();

    if (!lType_Taxe_ALL.contains(Type_Taxe_All)) Type_Taxe_All = "ODP";

    if (!lType_Taxe_DGI.contains(Type_Taxe_Dgi)) Type_Taxe_Dgi = "ODP";

//    Edt_paiement_prec.text =     "${DbTools.gActivite_ins.activite_paiement_prec!.toInt()}";

    //*********************************************
    //*********************************************
    //*********************************************

    Edt_Adresse.text = DbTools.gActivite_ins.street!;
    Edt_Adresse2.text = DbTools.gActivite_ins.street2!;
    Edt_City.text = DbTools.gActivite_ins.city!;

    Edt_Tel.text = DbTools.gActivite_ins.telephoneFixe1Entreprise!;
    Edt_Mobile.text = DbTools.gActivite_ins.mobile!;


    print("init  phone  ${DbTools.gActivite_ins.telephoneFixe1Entreprise}");
    print("init  telephoneFixe2Entreprise ${DbTools.gActivite_ins.telephoneFixe2Entreprise}");



    //*********************************************
    //*********************************************
    //*********************************************
    if (DbTools.gActivite_ins.dateDebutExploitation!.isEmpty) {
      DbTools.gActivite_ins.dateDebutExploitation = DateTime.now().toString();
    }

    print("init  dateDebutExploitation ok ${DbTools.gActivite_ins.dateDebutExploitation}");

    Screen_QF_C13 = Tools.Get_ScreenCallBack(QF_C13, context, DbTools.gActivite_ins.dateDebutExploitation!, 0, false, screenVoidCallback);
    Screen_QF_C14 = Tools.Get_ScreenCallBack(QF_C14, context, DbTools.gActivite_ins.activictePrincipal!, 0, false, screenVoidCallback);
  }

  void screenVoidCallback() {
    print("screenVoidCallback Screen_QF_C13 ${Screen_QF_C13.Screen_Rep_Str}");
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
    Edt_Nom_Error = "";
    Edt_Adresse_Error = "";
    Edt_Tel_Error = "";
    Edt_Mobile_Error = "";
    Edt_CA_Taxable_Error = "";

    if (Edt_Nom.text.isEmpty) Edt_Nom_Error = "Nom vide";
    if (Edt_Adresse.text.isEmpty) Edt_Adresse_Error = "Lieu d’habitation vide";

    if (!gColors.ctrlTelFIXE(Edt_Tel.text, VideOK: false)) Edt_Tel_Error = "Téléphone Invalide";
    if (!gColors.ctrlTelPORT(Edt_Mobile.text, VideOK: false))  Edt_Mobile_Error = "Mobile Invalide";


    if (!gColors.ctrlTelFIXE(Edt_Tel.text, VideOK: false)) Edt_Tel_Error = "Téléphone Invalide";
    if (!gColors.ctrlTelPORT(Edt_Mobile.text, VideOK: false))  Edt_Mobile_Error = "Mobile Invalide";


    if (Edt_CA_Taxable.text.isEmpty) Edt_CA_Taxable_Error = "CA DECLARE vide";

    DbTools.gActivite_ins.dateDebutExploitation = Screen_QF_C13.Screen_Rep_Str;

    DbTools.gActivite_ins.activictePrincipal = Screen_QF_C14.Screen_Rep_Str;

    Screen_QF_C13 = Tools.Get_ScreenCallBack(QF_C13, context, DbTools.gActivite_ins.dateDebutExploitation!, 0, false, screenVoidCallback);
    Screen_QF_C14 = Tools.Get_ScreenCallBack(QF_C14, context, DbTools.gActivite_ins.activictePrincipal!, 0, false, screenVoidCallback);
    Screen_QF_B18 = Tools.Get_Screen(QF_B18, context, DbTools.gActivite_ins.sigleEntreprise!, 0, false);
    Screen_QF_B19B = Tools.Get_Screen(QF_B19B, context, DbTools.gActivite_ins.telephoneFixe2Entreprise!, 0, false);
    Screen_QF_B19AB = Tools.Get_Screen(QF_B19AB, context, DbTools.gActivite_ins.telephonePortable2Entreprise!, 0, false);

    Screen_QF_B20 = Tools.Get_Screen(QF_B20, context, DbTools.gActivite_ins.emailEntreprise!, 0, false);
    Screen_QF_C11 = Tools.Get_Screen(QF_C11, context, DbTools.gActivite_ins.siteWebEntreprise!, 0, false);


    print("build  Screen_Q_B8 ok ${DbTools.gActivite_ins.zone_implantation_entreprise!}");

    Screen_Q_B8 = Tools.Get_Screen(Q_B8, context,     DbTools.gActivite_ins.zone_implantation_entreprise!, 0, false);
    print("build  Screen_© ok ${DbTools.gActivite_ins.libelle_zone_implantation_entreprise!}");
    Screen_Q_B8A = Tools.Get_Screen(Q_B8A, context,   DbTools.gActivite_ins.libelle_zone_implantation_entreprise!, 0, false);
    Screen_Q_B8C1 = Tools.Get_Screen(Q_B8C1, context, DbTools.gActivite_ins.numero_batiment!, 0, false);
    Screen_BC2 = Tools.Get_Screen(BC2, context,       DbTools.gActivite_ins.numero_sequence_batiment_entreprise!, 0, false);

    print("init  Screen_QF_B19B  ${Screen_QF_B19B.Screen_Rep_Str}");
    print("init  telephoneFixe2Entreprise ${DbTools.gActivite_ins.telephoneFixe2Entreprise}");
    print("init  Edt_Tel  ${Edt_Tel.text}");


    return WillPopScope(
        onWillPop: _onWillPop,
        child: Container(
          color: Colors.white,
          child: Scaffold(
            appBar: AppBar(
              title: CommonAppBar.TitleEcr("KYB${DbTools.isFORMEL ? 'F' : 'I'}", "QUAL ACT", pageEntr, DbTools.pagesEntr, "B5"),
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
              child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                  ContribuableWidget(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                    child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                      gColors.colTextField(Edt_Nom, 'NOM :', EmptyFocusNode, Edt_Nom_Error, Mand: true),
                      TextButton(
                          onPressed: () async {
                            await _selectDate(context);
                          },
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: DateTime_activity_birthday.year != 1900
                              ? Text(
                                  'DATE DE CREATION : ${DateFormat('dd-MM-yyyy').format(DateTime_activity_birthday)}',
                                  style: gColors.bodyTextFieldBold.copyWith(color: Colors.green),
                                  textAlign: TextAlign.left,
                                )
                              : Text(
                                  'DATE DE CREATION : ???',
                                  style: gColors.bodyTextFieldBold.copyWith(color: Colors.red),
                                  textAlign: TextAlign.left,
                                )),

                      gColors.colTextField(Edt_Adresse, 'Adresse :', EmptyFocusNode, Edt_Adresse_Error, Mand: true),
                      gColors.colTextField(Edt_Adresse2, '', EmptyFocusNode, ""),
                      gColors.colTextField(Edt_City, 'VILLE :', EmptyFocusNode, ""),
                      Container(
                        height: 20,
                      ),
                      Screen_Q_B8.Screen_Row,
                      Screen_Q_B8A.Screen_Row,
                      Screen_Q_B8C1.Screen_Row,
                      Screen_BC2.Screen_Row,

                      gColors.colTextFieldTel(Edt_Tel, 'TELEPHONE :', EmptyFocusNode, Edt_Tel_Error, Mand: true),
                      gColors.colTextFieldTel(Edt_Mobile, 'MOBILE :', EmptyFocusNode, Edt_Mobile_Error, Mand: true),

                      Screen_QF_B19B.Screen_Row, // Tel
                      Screen_QF_B19AB.Screen_Row, // Tel

                      DbTools.isFORMEL ? Container() :
                      DD_Type_Act(),
                      Row(
                        children: [
                          Expanded(
                            child: DD_Regime(), //
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: gColors.colTextFieldNumSep(Edt_CA_Taxable, 'CA DECLARE :', EmptyFocusNodeD, Edt_CA_Taxable_Error, Mand: true),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: gColors.colTextFieldNumSep(Edt_CA_Min, 'CA MIN :', EmptyFocusNodem, ""),
                          ),
                          Container(
                            width: 15,
                          ),
                          Expanded(
                            child: gColors.colTextFieldNumSep(Edt_CA_Max, 'CA MAX :', EmptyFocusNodeM, ""),
                          ),
                        ],
                      ),

                      DD_Secteur_Act(),

                      DD_Forme_Act(),

                      DbTools.isFORMEL ? Container() : (Regime == "TCE") ? DD_Type_Taxe_Act_ALL() : Container(),
                      DbTools.isFORMEL ? Container() : (Regime == "TCE") ? Container() : DD_Type_Taxe_Act_DGI(),

                      Row(
                        children: [
                          Checkbox(
                            value: isCga,
                            onChanged: (value) {
                              setState(() {
                                isCga = value;
                              });
                            },
                          ),
                          Text(
                            "CGA",
                          ),
                          Container(
                            width: 20,
                          ),
                          !isCga!
                              ? Container()
                              : TextButton(
                                  onPressed: () async {
                                    await _select_date_adhesion();
                                  },
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: DateTime_activity_date_adhesion.year != 1900
                                          ? Text(
                                        'Date Crt : ${DateFormat('dd-MM-yyyy').format(DateTime_activity_date_adhesion)}',
                                        style: const TextStyle(fontSize: 16),
                                        textAlign: TextAlign.left,
                                      ) :
                                      Text(
                                        'Date Crt : ???',
                                        style: const TextStyle(fontSize: 16),
                                        textAlign: TextAlign.left,
                                      )

                                  ))
                        ],
                      ),
                      !isCga!
                          ? Container()
                          : Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    onChanged: (text) {
//                                        getrfDGI();
                                    },
                                    controller: Edt_ref_cga,
                                    style: const TextStyle(fontSize: 16),
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      labelText: "N° Adhésion CGA",
                                    ),
                                  ),
                                ),
                              ],
                            ),

                      TextButton(
                          onPressed: () async {
                            await _select_date_periode_imposition();
                          },
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child:  DateTime_activity_periode_imposition.year != 1900
                                  ? Text(
                                'Période Imposition : ${DateFormat('dd-MM-yyyy').format(DateTime_activity_periode_imposition)}',
                                style: const TextStyle(fontSize: 16),
                                textAlign: TextAlign.left,
                              ):
                              Text(
                                'Période Imposition :???',
                                style: const TextStyle(fontSize: 16),
                                textAlign: TextAlign.left,
                              )


                          )),

                      DD_Taux_Imp(),
                      DbTools.isFORMEL ? Container() : Regime == "TCE" ? DD_Taille_Act() : Container(),

                      Screen_QF_C13.Screen_Row,
                      Screen_QF_C14.Screen_Row,


                      Screen_QF_B18.Screen_Row,
                      Screen_QF_B20.Screen_Row,
                      Screen_QF_C11.Screen_Row,

//*********************************
//*********************************
//*********************************
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

                    DbTools.gActivite_ins.name = Edt_Nom.text;
                    DbTools.gActivite_ins.activiteTypeId = lType_Act.indexWhere((element) => element.compareTo(Type_Act!) == 0);

                    print("Secteur_Act $Secteur_Act");
                    print("Forme_Act $Forme_Act");
//                DbTools.selectedSecteur.secteur_name = Secteur_Act;
                    //              DbTools.selectedSecteur!.secteur_forme = Forme_Act;

                    DbTools.gActivite_ins.activityBirthday = DateFormat('yyyy-MM-dd').format(DateTime_activity_birthday);

                    DbTools.gActivite_ins.minCa = double.parse(Edt_CA_Min.text);
                    DbTools.gActivite_ins.maxCa = double.parse(Edt_CA_Max.text);
                    DbTools.gActivite_ins.tailleActivite = Taille_Act;
//                DbTools.gActivite_ins.activite_SVA = selectedSvas.toString();

                    if (Regime == "TCE") {
                      DbTools.gActivite_ins.typeTaxe = Type_Taxe_All;
                    } else {
                      DbTools.gActivite_ins.typeTaxe = Type_Taxe_Dgi;
                    }

                    DbTools.gActivite_ins.refCga = Edt_ref_cga.text;
                    DbTools.gActivite_ins.dateAdhesion = DateFormat('yyyy-MM-dd').format(DateTime_activity_date_adhesion);
                    DbTools.gActivite_ins.periodeImposition = DateFormat('yyyy-MM-dd').format(DateTime_activity_periode_imposition);

                    print("Edt_tauxImposition.text ${Edt_tauxImposition.text}");
                    DbTools.gActivite_ins.tauxImposition = double.parse(Edt_tauxImposition.text);

                    DbTools.gActivite_ins.cga = isCga! ? "Oui" : "Non";

                    DbTools.gActivite_ins.chiffreAffaireTaxable = Edt_CA_Taxable.text;
//                DbTools.gActivite_ins.activite_paiement_prec = double.parse(Edt_paiement_prec.text);
                    DbTools.gActivite_ins.regimeFiscale = Regime;

                    DbTools.gActivite_ins.street = Edt_Adresse.text;
                    DbTools.gActivite_ins.street2 = Edt_Adresse2.text;
                    DbTools.gActivite_ins.city = Edt_City.text;


                    DbTools.gActivite_ins.zone_implantation_entreprise          = Screen_Q_B8.Screen_Rep_Str;
                    DbTools.gActivite_ins.libelle_zone_implantation_entreprise  = Screen_Q_B8A.Screen_Rep_Str;
                    DbTools.gActivite_ins.numero_batiment                       = Screen_Q_B8C1.Screen_Rep_Str;
                    DbTools.gActivite_ins.numero_sequence_batiment_entreprise   = Screen_BC2.Screen_Rep_Str;




                    DbTools.gActivite_ins.telephoneFixe1Entreprise = Edt_Tel.text;
                    DbTools.gActivite_ins.telephonePortable1Entreprise = Edt_Mobile.text;

                    DbTools.gActivite_ins.telephoneFixe2Entreprise = Screen_QF_B19B.Screen_Rep_Str;
                    DbTools.gActivite_ins.telephonePortable2Entreprise = Screen_QF_B19AB.Screen_Rep_Str;


                    DbTools.gActivite_ins.dateDebutExploitation = Screen_QF_C13.Screen_Rep_Str;
                    DbTools.gActivite_ins.activictePrincipal = Screen_QF_C14.Screen_Rep_Str;

                    DbTools.gActivite_ins.sigleEntreprise = Screen_QF_B18.Screen_Rep_Str;
                    DbTools.gActivite_ins.emailEntreprise = Screen_QF_B20.Screen_Rep_Str;
                    DbTools.gActivite_ins.siteWebEntreprise = Screen_QF_C11.Screen_Rep_Str;



                    var wArgs = DbTools.gActivite_ins.toArrUpd();
                    gColors.printWrapped("≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈ Activite_insUpd update ${wArgs} ");


                    print("nA Save≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈ GOTO ${DbTools.isFORMEL}");

                    DbTools.pageEntr++;
//                Navigator.push(context, MaterialPageRoute(builder: (context) => I_KYB_InsFIN()));
                    PushPop.PushPop_Push(false);

                    if (DbTools.isFORMEL) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => I_KYB_Ins6F()));
                    } else {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => I_KYB_Ins6I()));
                    }
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

  Future<bool> ctrlSaisie() async {
    bool isOK = true;




    if (Edt_Nom.text.isEmpty) {
      isOK = false;
      await gColors.PopupError(context, "Erreur de saisie", "Nom vide");
      Edt_Nom_Error = "Erreur de saisie : Nom vide";
      setState(() {});
      return isOK;
    }

    if (Edt_Adresse.text.isEmpty) {
      isOK = false;
      await gColors.PopupError(context, "Erreur de saisie", "Lieu d’habitation vide");
      Edt_Nom_Error = "Erreur de saisie : Lieu d’habitation vide";
      setState(() {});
      return isOK;
    }

// 21, 25, 27
//  01 05 07
    if (!gColors.ctrlTelFIXEPORT(Edt_Tel.text, VideOK: false)) {
      isOK = false;
      await gColors.PopupError(context, "Erreur de saisie", "Téléphone Invalide");
      Edt_Tel_Error = "Erreur de saisie : Téléphone Invalide";
      setState(() {});
      return isOK;
    }

    if (!gColors.ctrlTelPORT(Edt_Mobile.text, VideOK: false)) {
      isOK = false;
      await gColors.PopupError(context, "Erreur de saisie", "Mobile Invalide");
      Edt_Mobile_Error = "Erreur de saisie : Mobile Invalide";
      setState(() {});
      return isOK;
    }

    if (!gColors.ctrlTelFIXEPORT(Screen_QF_B19B.Screen_Rep_Str, VideOK: true)) {
      isOK = false;
      await gColors.PopupError(context, "Erreur de saisie", "Téléphone2 Invalide");
      Edt_Tel_Error = "Erreur de saisie : Téléphone Invalide";
      setState(() {});
      return isOK;
    }

    if (!gColors.ctrlTelPORT(Screen_QF_B19AB.Screen_Rep_Str, VideOK: true)) {
      isOK = false;
      await gColors.PopupError(context, "Erreur de saisie", "Mobile Invalide");
      Edt_Mobile_Error = "Erreur de saisie : Mobile Invalide";
      setState(() {});
      return isOK;
    }


    if (Edt_CA_Taxable.text.isEmpty) {
      isOK = false;
      await gColors.PopupError(context, "Erreur de saisie", "CA DECLARE vide");
      Edt_CA_Taxable_Error = "Erreur de saisie : CA DECLARE vide";
      setState(() {});
      return isOK;
    }
    if (DbTools.selectedSecteur!.secteur_name! == "???") {
      isOK = false;
      await gColors.PopupError(context, "Erreur de saisie", "Secteur d'activité invalide");
      setState(() {});
      return isOK;
    }

    if (Taille_Act == "???") {
      isOK = false;
      await gColors.PopupError(context, "Erreur de saisie", "Taille d'activité TCE invalide");
      setState(() {});
      return isOK;
    }

    if (DbTools.gActivite_ins.activictePrincipal!.isEmpty) {
      isOK = false;
      await gColors.PopupError(context, "Erreur de saisie", "Activité principale invalide");
      setState(() {});
      return isOK;
    }


    return isOK;
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
/*
        AutoSizeText(
          "Carte : ${DbTools.gContribuable.contribuable_MafaCard}",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 16),
        ),
        AutoSizeText(
          "${DbTools.gContribuable.contribuable_phone}",
          style: TextStyle(color: gColors.secondary, fontWeight: FontWeight.normal, fontSize: 16),
        ),
*/
        Container(height: 10),
        Container(height: 1, color: Colors.black)
      ]),
    );
  }

  @override
  Widget DD_Type_Act() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "TYPE D'ACTIVITE :",
          style: gColors.bodyTextFieldBold,
        ),
        Container(
          width: 15,
        ),
        DropDown(
          items: ['???','Ordinaire', 'Taxi', 'Taxi brousse', 'Stationnement', 'Transport'],
          initialValue: Type_Act,
          icon: Icon(
            Icons.expand_more,
            color: gColors.secondary,
          ),
          onChanged: (String? newValue) {
            setState(() {
              if (Type_Act != newValue) {
                Secteur s = DbTools.lfSecteurOrd[0];

                if (newValue == 'Ordinaire')
                  s = DbTools.lfSecteurOrd[0];
                else if (newValue == 'Stationnement')
                  s = DbTools.lfSecteurStatio[0];
                else if (newValue!.contains('Taxi'))
                  s = DbTools.lfSecteurTaxi[0];
                else if (newValue.contains('Transport')) s = DbTools.lfSecteurTransp[0];

                DbTools.selectedSecteur = s;
                DbTools.gActivite_ins.secteurId = s.secteurid;

                Forme_Act = s.secteur_forme;
              }
              Type_Act = newValue;
            });
          },
        ),
      ],
    );
  }

  Widget buildDropDownRowSecteur(Secteur secteur) {
    return Text(secteur.secteur_name ?? "Select");

    /*  return
      Row(
      children: <Widget>[
        Expanded(child: Text(secteur.secteur_name ?? "Select")),
      ],
    );*/
  }

  @override
  Widget DD_Secteur_Act() {
    print("Secteur_Act ${DbTools.lfSecteur.length}");
    final TextEditingController searchController = TextEditingController();

    List<String> lsecteur_name = [];

    for (int i = 0; i < DbTools.lfSecteur.length; ++i) {
      var element = DbTools.lfSecteur[i];
      lsecteur_name.add(element.secteur_name!);
    }


    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 15,
        ),
        Text(
          "SECTEUR D'ACTIVITE",
          style: gColors.bodyTextFieldBold.copyWith(color: DbTools.selectedSecteur!.secteur_name! == "???" ? Colors.red : Colors.green),
        ),

        Container(
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
              items: lsecteur_name,
              selectedItem: DbTools.selectedSecteur!.secteur_name!,
              onChanged: (String? s) {
                print(s);
                setState(() {
                  for (int i = 0; i < DbTools.lfSecteur.length; ++i) {
                    var element = DbTools.lfSecteur[i];
                    if (s!.compareTo(element.secteur_name!) == 0 )
                      {
                      DbTools.selectedSecteur = element;
                      DbTools.gActivite_ins.secteurId = element!.secteurid;
                      Forme_Act = element.secteur_forme;
                      }
                  }
                });
              },

            )
        ),


      ],
    );
  }

  @override
  Widget DD_Secteur_ActOrd() {
//    print("Secteur_Act $Secteur_Act");
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 15,
        ),
        Text(
          "SECTEUR D'ACTIVITE : ${DbTools.lfSecteurOrd.length} ${DbTools.selectedSecteur!.secteurid}",
          style: gColors.bodyTextFieldBold,
        ),
        DropDown<Secteur>(
          items: DbTools.lfSecteurOrd,
          initialValue: DbTools.selectedSecteur,
          icon: Icon(
            Icons.expand_more,
            color: gColors.secondary,
          ),

          onChanged: (Secteur? s) {
            print(s?.secteur_name);
            setState(() {
              DbTools.selectedSecteur = s;
              DbTools.gActivite_ins.secteurId = s!.secteurid;

              Forme_Act = s.secteur_forme;
            });
          },
//          isCleared: selectedSecteur == null,
          customWidgets: DbTools.lfSecteurOrd.map((s) => buildDropDownRowSecteur(s)).toList(),
          isExpanded: true,
        ),
      ],
    );
  }

  @override
  Widget DD_Secteur_ActTaxi() {
//    print("Secteur_Act $Secteur_Act");
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 15,
        ),
        Text(
          "SECTEUR D'ACTIVITE C:",
          style: gColors.bodyTextFieldBold,
        ),
        DropDown<Secteur>(
          items: DbTools.lfSecteurTaxi,
          initialValue: DbTools.selectedSecteur,
          icon: Icon(
            Icons.expand_more,
            color: gColors.secondary,
          ),

          onChanged: (Secteur? s) {
            print(s?.secteur_name);
            setState(() {
              DbTools.selectedSecteur = s;
              DbTools.gActivite_ins.secteurId = s!.secteurid;
              Forme_Act = s.secteur_forme;
            });
          },
//          isCleared: selectedSecteur == null,
          customWidgets: DbTools.lfSecteurTaxi.map((s) => buildDropDownRowSecteur(s)).toList(),
          isExpanded: true,
        ),
      ],
    );
  }

  @override
  Widget DD_Secteur_ActStatio() {
//    print("Secteur_Act $Secteur_Act");
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 15,
        ),
        Text(
          "SECTEUR D'ACTIVITE D:",
          style: gColors.bodyTextFieldBold,
        ),
        DropDown<Secteur>(
          items: DbTools.lfSecteurStatio,
          initialValue: DbTools.selectedSecteur,
          icon: Icon(
            Icons.expand_more,
            color: gColors.secondary,
          ),

          onChanged: (Secteur? s) {
            print(s?.secteur_name);
            setState(() {
              DbTools.selectedSecteur = s;
              DbTools.gActivite_ins.secteurId = s!.secteurid;
              Forme_Act = s.secteur_forme;
            });
          },
//          isCleared: selectedSecteur == null,
          customWidgets: DbTools.lfSecteurStatio.map((s) => buildDropDownRowSecteur(s)).toList(),
          isExpanded: true,
        ),
      ],
    );
  }

  @override
  Widget DD_Secteur_ActTransp() {
//    print("Secteur_Act $Secteur_Act");
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 15,
        ),
        Text(
          "SECTEUR D'ACTIVITE E:",
          style: gColors.bodyTextFieldBold,
        ),
        DropDown<Secteur>(
          items: DbTools.lfSecteurTransp,
          initialValue: DbTools.selectedSecteur,
          icon: Icon(
            Icons.expand_more,
            color: gColors.secondary,
          ),

          onChanged: (Secteur? s) {
            print(s?.secteur_name);
            setState(() {
              DbTools.selectedSecteur = s;
              DbTools.gActivite_ins.secteurId = s!.secteurid;
              Forme_Act = s.secteur_forme;
            });
          },
//          isCleared: selectedSecteur == null,
          customWidgets: DbTools.lfSecteurTransp.map((s) => buildDropDownRowSecteur(s)).toList(),
          isExpanded: true,
        ),
      ],
    );
  }

  @override
  Widget DD_Forme_Act() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 15,
        ),
        Row(
          children: [
            Text(
              "FORME D'ACTIVITE :",
              style: gColors.bodyTextFieldBold,
            ),
            Container(
              width: 15,
            ),
            Text(
              "${Forme_Act}",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        Container(
          height: 15,
        ),
      ],
    );
  }

  Widget buildDropDownRowZone(Zone zone) {
    // print("buildDropDownRowZone ${zone.zone_name}");
    return Text(zone.zone_name ?? "Select");
  }

  @override
  Widget DD_Zone() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 15,
        ),
        Text(
          "ZONE :",
          style: gColors.bodyTextFieldBold,
        ),
        DropDown<Zone>(
          items: DbTools.lfZone,
          initialValue: DbTools.selectedZone,
          icon: Icon(
            Icons.expand_more,
            color: gColors.secondary,
          ),
          onChanged: (Zone? z) {
            print(z?.zone_name);
            setState(() {
              DbTools.selectedZone = z;
              DbTools.gActivite_ins.zoneId = z!.zoneid;
            });
          },
          isCleared: DbTools.selectedZone == null,
          customWidgets: DbTools.lfZone.map((z) => buildDropDownRowZone(z)).toList(),
          isExpanded: true,
        ),
      ],
    );
  }

  @override
  Widget DD_Periode() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "PERIODE D'ACTIVITE :",
          style: gColors.bodyTextFieldBold,
        ),
        Container(
          width: 15,
        ),
        DropDown(
          items: ['Permanent', 'Temporaire'],
          initialValue: DbTools.gActivite_ins.periodeImposition,
          icon: Icon(
            Icons.expand_more,
            color: gColors.secondary,
          ),
          onChanged: (String? newValue) {
            setState(() {
              DbTools.gActivite_ins.periodeImposition = newValue;
            });
          },
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    if (DateTime_activity_birthday.year == 1900)
      DateTime_activity_birthday = DateTime(2009);

    print("DATE > ${DateTime_activity_birthday}");



    final DateTime? picked = await showDatePicker(context: context, locale: const Locale("fr", "FR"), initialDate: DateTime_activity_birthday, firstDate: DateTime(1900), lastDate: new DateTime.now());
    if (picked != null && picked != DateTime_activity_birthday) {
      setState(() {
        DateTime_activity_birthday = picked;
        print("DATE > ${DateTime_activity_birthday}");
      });
    }
  }

  //************************************************************
  //************************************************************
  //************************************************************

  @override
  Widget DD_Regime() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Régime fisc.",
          style: gColors.bodyTextFieldBold,
        ),
        Container(
          width: 15,
        ),
        DropDown(
          items: ['TCE', 'DGI'],
          initialValue: Regime,
          icon: Icon(
            Icons.expand_more,
            color: gColors.secondary,
          ),
          onChanged: (String? newValue) {
            Regime = newValue;
            if (Regime == 'DGI') Taille_Act = 'DGI';
            setState(() {});
          },
        ),
      ],
    );
  }

  @override
  Widget DD_Type_Taxe_Act_ALL() {
    print("Regime $Regime - Type_Taxe_All $Type_Taxe_All - Type_Taxe_Dgi $Type_Taxe_Dgi");

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Type taxe :",
          style: gColors.bodyTextFieldBold,
        ),
        Container(
          width: 5,
        ),
        new DropDown<String>(
          items: ['???','FORFAITAIRE (PCA)', 'ETABL. DE NUIT (ETN)', 'ODP', 'GROS ODP', 'TICKET MARCHE', 'PUB'],
          initialValue: Type_Taxe_All,
          icon: Icon(
            Icons.expand_more,
            color: gColors.secondary,
          ),
          onChanged: (String? newValueall) {
            print("newValueall $newValueall");
            Type_Taxe_All = newValueall;
            setState(() {});
          },
        ),
      ],
    );
  }

  @override
  Widget DD_Type_Taxe_Act_DGI() {
    print("Regime $Regime - Type_Taxe_All $Type_Taxe_All - Type_Taxe_Dgi $Type_Taxe_Dgi");
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Type taxe :",
          style: gColors.bodyTextFieldBold,
        ),
        Container(
          width: 5,
        ),
        new DropDown<String>(
          items: ['ETABL. DE NUIT (ETN)', 'ODP', 'GROS ODP', 'TICKET MARCHE', 'PUB'],
          initialValue: Type_Taxe_Dgi,
          icon: Icon(
            Icons.expand_more,
            color: gColors.secondary,
          ),
          onChanged: (String? newValuedgi) {
            print("newValuedgi $newValuedgi");
            Type_Taxe_Dgi = newValuedgi;
            setState(() {});
          },
        ),
      ],
    );
  }


  //                       gColors.colTextField(Edt_tauxImposition, 'Taux imposition :', EmptyFocusNode, ""),
  @override
  Widget DD_Taux_Imp() {

    String wSel = '???';
    if (Edt_tauxImposition.text.compareTo("0.02") == 0)
        wSel = '2%';
    else if (Edt_tauxImposition.text.compareTo("0.025") == 0)
      wSel = '2,5%';
    else if (Edt_tauxImposition.text.compareTo("0.04") == 0)
      wSel = '4%';
    else if (Edt_tauxImposition.text.compareTo("0.05") == 0)
      wSel = '5%';
    else if (Edt_tauxImposition.text.compareTo("0.07") == 0)
      wSel = '7%';


    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Taux imposition :",
          style: gColors.bodyTextFieldBold,
        ),
        Container(
          width: 15,
        ),
        new DropDown(
          items: ['???', '2%', '2,5%', '4%', '5%', '7%'],
          initialValue: wSel,
          icon: Icon(
            Icons.expand_more,
            color: gColors.secondary,
          ),
          onChanged: (String? newValue) {
            setState(() {
              Edt_tauxImposition.text = '0.0';
              if (newValue!.compareTo("2%") == 0)
                Edt_tauxImposition.text = '0.02';
              else if (newValue!.compareTo("2,5%") == 0)
                Edt_tauxImposition.text = '0.025';
              else if (newValue!.compareTo("4%") == 0)
                Edt_tauxImposition.text = '0.04';
              else if (newValue!.compareTo("5%") == 0)
                Edt_tauxImposition.text = '0.05';
              else if (newValue!.compareTo("7%") == 0)
                Edt_tauxImposition.text = '0.07';
            });
          },
        ),
      ],
    );
  }


  @override
  Widget DD_Taille_Act() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Taille d'activité TCE :",
          style: gColors.bodyTextFieldBold.copyWith(color: Taille_Act == "???" ? Colors.red : Colors.green),


        ),
        Container(
          width: 15,
        ),
        DropDown(
          items: ['???', 'Très petite', 'Petite', 'Moyenne', 'Grande', 'DGI'],
          initialValue: Taille_Act,
          icon: Icon(
            Icons.expand_more,
            color: gColors.secondary,
          ),
          onChanged: (String? newValue) {
            setState(() {
              Taille_Act = newValue;
            });
          },
        ),
      ],
    );
  }

  Future _select_date_adhesion() async {

    if (DateTime_activity_date_adhesion.year == 1900)
      DateTime_activity_date_adhesion = DateTime(2009);

    DateTime? picked = await showDatePicker(context: context, locale: const Locale("fr", "FR"), initialDate: DateTime_activity_date_adhesion, firstDate: new DateTime(1900), lastDate: new DateTime.now());
    if (picked != null) setState(() => DateTime_activity_date_adhesion = picked);
  }

  Future _select_date_periode_imposition() async {

    if (DateTime_activity_periode_imposition.year == 1900)
      DateTime_activity_periode_imposition = DateTime(2009);

    DateTime? picked = await showDatePicker(context: context, locale: const Locale("fr", "FR"), initialDate: DateTime_activity_periode_imposition, firstDate: new DateTime(1900), lastDate: new DateTime.now());
    if (picked != null) setState(() => DateTime_activity_periode_imposition = picked);
  }
}
