import 'dart:convert';
import 'package:colibri/Tools/DbData.dart';
import 'package:colibri/Tools/DbOdoo.dart';
import 'package:colibri/Tools/DbTools.dart';
import 'package:colibri/Tools/Regex.dart';
import 'package:colibri/Tools/gColors.dart';
import 'package:colibri/Widget/3_bottom_navigation_list.dart';
import 'package:colibri/Widget/Identification/I_KYC_Ins_3.dart';
import 'package:colibri/Widget/Identification/I_Liste_ActivitesIns.dart';
import 'package:colibri/widgetTools/PushPop.dart';
import 'package:colibri/widgetTools/toolbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:intl/intl.dart';

import '../../Tools/Tools.dart';

class I_KYC_Ins_2 extends StatefulWidget {
  Function I_Liste_EntreprenantsState_callback;
  I_KYC_Ins_2(this.I_Liste_EntreprenantsState_callback);
  @override
  I_KYC_Ins_2State createState() => I_KYC_Ins_2State();
}

class I_KYC_Ins_2State extends State<I_KYC_Ins_2> {
  String wError = "";
  String wScan = "";
  String? Type_Doc = 'CNI';

  late FocusNode NomFocusNode;
  bool circularProgressIndicator = false;

  TextEditingController Edt_CNI = new TextEditingController();
  TextEditingController Edt_Nom = new TextEditingController();
  TextEditingController Edt_Nais_Lieu = new TextEditingController();
  TextEditingController Edt_Nais_Pays = new TextEditingController();

  DateTime DateTime_Nais_Date = DateTime.parse("1900-01-01");
  DateTime DateTime_Exp = DateTime.parse("1900-01-01");

  int Genre_id = 0;
  String radioButtonItem = 'H';

  //**************************************************************************
//**************************************************************************
//**************************************************************************

  String wErrorTel = "";
  String wErrorMail = "";
  String wErrorProf = "";
  String wErrorCNI = "";
  String wErrorLN = "";
  String wErrorADDR = "";

  late FocusNode EmptyFocusNode;
  late FocusNode TelFocusNode;
  late FocusNode MailFocusNode;
  late FocusNode ProfFocusNode;
  late FocusNode CNIFocusNode;
  late FocusNode LNFocusNode;
  late FocusNode ADDRFocusNode;

  TextEditingController Edt_Tel = new TextEditingController();
  TextEditingController Edt_Tel_WS = new TextEditingController();
  TextEditingController Edt_Adresse = new TextEditingController();
  TextEditingController Edt_Mail = new TextEditingController();
  TextEditingController Edt_Prof = new TextEditingController();

  String? Type_Terminal = 'Smartphone';

  Item QF_C26D = Item();
  Screen Screen_QF_C26D = Screen();
  Item QF_C26DAUTRE = Item();
  Screen Screen_QF_C26DAUTRE = Screen();
  int pageEntr = 0;

  void screenVoidCallback() {
    setState(() {});
  }

  void initState() {
    pageEntr = DbTools.pageEntr;

    EmptyFocusNode = FocusNode();
    NomFocusNode = FocusNode();
    CNIFocusNode = FocusNode();
    LNFocusNode = FocusNode();
    ADDRFocusNode = FocusNode();

    QF_C26D = Tools.Get_UNIQUE("Q_C26D");
    QF_C26DAUTRE = Tools.Get_UNIQUE("Q_C26DAUTRE");

    print(" DbTools.gEntreprenant.toArr()  ${DbTools.gEntreprenant.toArr()}");

    int i = 0;
    Edt_CNI.text = DbTools.gEntreprenant.cni!;
    Edt_Nom.text = DbTools.gEntreprenant.nomPrenomDirigeant!;

    print("I_KYC_Ins_2 C");
    Edt_Nais_Lieu.text = DbTools.gEntreprenant.lieu_naissance!;
    print("I_KYC_Ins_2 countryId ${DbTools.gEntreprenant.countryId.toString()}");
    Edt_Nais_Pays.text = DbTools.gEntreprenant.countryId.toString()!;
    print("I_KYC_Ins_2 E");

    Type_Doc = DbTools.gEntreprenant.naturePiece;
    if (Type_Doc!.isEmpty) Type_Doc = "AUTRE";

    String? contribuable_Nais_Date = DbTools.gEntreprenant.birthday;
    print("contribuable_Nais_Date |$contribuable_Nais_Date|");

    if (contribuable_Nais_Date == null) contribuable_Nais_Date = "";
    if (!contribuable_Nais_Date.isEmpty) {
      print("parse 1 a");
      try {
        print("parse 1 b");
        DateTime_Nais_Date = DateTime.parse(contribuable_Nais_Date);
      } catch (_) {
        print("parse 1 c");
        DateTime_Nais_Date = DateTime.now();
      }
      print("parse 1 d");
    }

    String? contribuable_cniExp = DbTools.gEntreprenant.dateValiditePiece;
//    print("contribuable_cniExp |$contribuable_cniExp|");
    if (contribuable_cniExp == null) contribuable_cniExp = "";
//    print("contribuable_cniExp2 |$contribuable_cniExp|");
    if (!contribuable_cniExp.isEmpty) {
      try {
        DateTime_Exp = DateTime.parse(contribuable_cniExp);
      } catch (_) {
        DateTime_Exp = DateTime.now();
      }
    }
    print("DateTime_Exp |$DateTime_Exp|");

    String? wGenre = DbTools.gEntreprenant.sexe;

    //wGenre!.contains("masculin") ? radioButtonItem = 'H' : radioButtonItem = 'F';
    //wGenre.contains("masculin") ? Genre_id = 0 : Genre_id = 1;

    radioButtonItem = '';
    Genre_id = -1;
    if (wGenre!.contains("masculin")) {
      radioButtonItem = 'H';
      Genre_id = 0;
    }
    if (wGenre!.contains("feminin")) {
      radioButtonItem = 'F';
      Genre_id = 1;
    }

    if (DbTools.lfCountry.length > 0) {
      DbTools.selectedCountry = DbTools.lfCountry[43];

//      print("get A countryId ${DbTools.gEntreprenant.countryId.toString()} ${DbTools.selectedCountry.toString()}");
      for (int i = 0; i < DbTools.lfCountry.length; ++i) {
        //      print("id $i ${DbTools.lfCountry[i].Countryid.toString()} ${DbTools.lfCountry[i].Country_name}");
        if (DbTools.gEntreprenant.countryId == DbTools.lfCountry[i].Countryid) {
          DbTools.selectedCountry = DbTools.lfCountry[i];
          break;
        }
      }
      print("get B countryId ${DbTools.gEntreprenant.countryId.toString()} ${DbTools.selectedCountry.toString()}");
    }

    print("DbTools.contribuable_natpiece |${DbTools.gEntreprenant.naturePiece}|");

    print("initState fin a");
    var toArr = DbTools.gEntreprenant.toArr();
    gColors.printWrapped("ENTREPRENANT ${toArr} ");

    TelFocusNode = FocusNode();
    print("initState fin b");
    MailFocusNode = FocusNode();
    ProfFocusNode = FocusNode();
    print("initState fin c");

    Edt_Tel.text = DbTools.gEntreprenant.telephoneDirigeant!;
    print("initState fin d");
    Edt_Tel_WS.text = DbTools.gEntreprenant.telephone_dirigeant_whatsapp!;
    Edt_Adresse.text = DbTools.gEntreprenant.adresseDirigeant!;
    print("initState fin e ${DbTools.gEntreprenant.emailDirigeant}");
    Edt_Mail.text = DbTools.gEntreprenant.emailDirigeant!.toLowerCase();
    print("initState fin e ${DbTools.gEntreprenant.profession}");
    Edt_Prof.text = DbTools.gEntreprenant.profession!.toLowerCase();
    print("initState fin f");

    Type_Terminal = DbTools.gEntreprenant.terminal;
    print("initState fin g");
    if (Type_Terminal == "false") Type_Terminal = "Smartphone";

    print("Terminal |${DbTools.gEntreprenant.terminal}|");

    print("initState fin h");

    Screen_QF_C26D = Tools.Get_ScreenCallBack(QF_C26D, context, DbTools.gEntreprenant.qualiteDirigeant!, 0, false, screenVoidCallback);

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
    Screen_QF_C26DAUTRE = Tools.Get_Screen(QF_C26DAUTRE, context, DbTools.gEntreprenant.autreQualite!, 0, false);

    print("build build build build build ");

    wError = "";
    wErrorCNI = "";
    wErrorTel = "";
    wErrorMail = "";
    wErrorProf = "";
    wErrorLN = "";
    wErrorADDR = "";

    if (Edt_Nom.text.isEmpty) {
      wError = "Erreur : Nom vide";
    }

    if (Edt_CNI.text.isEmpty) {
      wErrorCNI = "Erreur : Pièce vide";
    }

    if (Edt_Nais_Lieu.text.isEmpty) {
      wErrorLN = "Erreur : Lieu de naissance vide";
    }

    if (Edt_Adresse.text.isEmpty) {
      wErrorADDR = "Erreur : Adresse vide ";
    }

    if (!gColors.ctrlTelFIXEPORT(Edt_Tel.text, VideOK: false)) {
      wErrorTel = "Erreur : Téléphone Invalide";
    }
    if (!gColors.ctrlTelPORT(Edt_Tel_WS.text, VideOK: true)) {
      wErrorTel = "Erreur : Téléphone Invalide";
    }

    Edt_Mail.text = Edt_Mail.text.toLowerCase();
    if (!Regex.validateEmail(Edt_Mail.text)) {
      wErrorMail = "Erreur : eMail Invalide";
    }

    Edt_Prof.text = Edt_Prof.text.toLowerCase();
    if (Edt_Prof.text.isEmpty) {
      wErrorProf = "Erreur : Profession Invalide";
    }

    print(">>>>>>>>>>>>>>>>>>>   Build  KYC 2 ${DbTools.pageEntr}  $pageEntr <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Container(
          color: Colors.white,
          child: Scaffold(
            appBar: AppBar(
              title: CommonAppBar.TitleEcr("KYC", "IDENTITE", pageEntr, DbTools.pagesEntr, "C2"),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  print("Back");
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
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => BottomNavigationList(), settings: RouteSettings(name: 'BottomNavigationList')));
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
                  (DbTools.gEntreprenant.ImageBase64_PHOTO_ENTR == "")
                      ? Container()
                      : Column(
                          children: [
                            Container(
                              height: 10,
                            ),
                            Image.memory(
                              base64Decode(DbTools.gEntreprenant.ImageBase64_PHOTO_ENTR!),
                              width: 100,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              height: 10,
                            ),
                          ],
                        ),
                  gColors.colTextField(Edt_Nom, 'NOM :', NomFocusNode, wError, Mand: true),
                  Container(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "TYPE DE DOCUMENT:",
                        style: Type_Doc == null || Type_Doc!.isEmpty ? gColors.bodyTextFieldBold.copyWith(color: Colors.red) : gColors.bodyTextFieldBold.copyWith(color: Colors.green),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      DD_Type_Doc(),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: gColors.colTextField(Edt_CNI, 'N° PIECE :', CNIFocusNode, wErrorCNI, Mand: true),
                      ),
                      Flexible(
                          flex: 2,
                          child: TextButton(
                              onPressed: () async {
                                await _select_Valid_Date();
                              },
                              child: DateTime_Exp.year != 1900
                                  ? Text(
                                      'VALIDITE\n${DateFormat('dd-MM-yyyy').format(DateTime_Exp)}',
                                      style: gColors.bodyTextFieldBold,
                                    )
                                  : Text(
                                      'VALIDITE\n???',
                                      style: gColors.bodyTextFieldBold.copyWith(color: Colors.red),
                                    ))),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                          onPressed: () async {
                            await _select_Nais_Date();
                          },
                          child: DateTime_Nais_Date.year != 1900
                              ? Text(
                                  'DATE NAISSANCE\n${DateFormat('dd-MM-yyyy').format(DateTime_Nais_Date)}',
                                  style: gColors.bodyTextFieldBold,
                                )
                              : Text(
                                  'DATE NAISSANCE\n???',
                                  style: gColors.bodyTextFieldBold.copyWith(color: Colors.red),
                                )),
                      genreFilterWidget(),
                    ],
                  ),
                  gColors.colTextField(Edt_Nais_Lieu, 'LIEU DE NAISSANCE :', LNFocusNode, wErrorLN, Mand: true),
                  DD_Country(),
                  gColors.colTextFieldTel(Edt_Tel, 'TELEPHONE :', TelFocusNode, wErrorTel, Mand: true),
                  gColors.colTextFieldTel(Edt_Tel_WS, 'Numéro Whatsapp :', EmptyFocusNode, ""),
                  gColors.colTextField(Edt_Mail, 'MAIL :', MailFocusNode, wErrorMail),
                  gColors.colTextField(Edt_Prof, 'Profession :', ProfFocusNode, wErrorProf, Mand: true),
                  gColors.colTextField(Edt_Adresse, 'Ville/Commune d’habitation', EmptyFocusNode, wErrorADDR, Mand: true),
                  DD_Type_Terminal(),
                  Screen_QF_C26D.Screen_Row,
                  Screen_QF_C26D.Screen_Rep_Int < 5 ? Container() : Screen_QF_C26DAUTRE.Screen_Row,
                ]),
              ),
            ),
            bottomNavigationBar: (DbTools.gEntreprenant.state != "draft" && DbTools.gEntreprenant.state != "cancel")
                ? null
                : BottomAppBar(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(85, 15, 85, 15),
                      child: ElevatedButton(
                        onPressed: () async {
                          wError = "";
                          wErrorCNI = "";
                          wErrorTel = "";
                          wErrorMail = "";
                          wErrorProf = "";
                          wErrorLN = "";
                          wErrorADDR = "";

                          if (Edt_Nom.text.isEmpty) {
                            NomFocusNode.requestFocus();
                            setState(() {
                              wError = "Erreur : Nom vide";
                            });
                            return;
                          }

                          if (Edt_CNI.text.isEmpty) {
                            CNIFocusNode.requestFocus();
                            setState(() {
                              wErrorCNI = "Erreur : Pièce vide";
                            });
                            return;
                          }

                          if (!gColors.ctrlTelFIXEPORT(Edt_Tel.text, VideOK: false)) {
                            TelFocusNode.requestFocus();
                            setState(() {
                              wErrorTel = "Erreur : Téléphone Invalide";
                            });
                            return;
                          }

                          if (!gColors.ctrlTelFIXEPORT(Edt_Tel_WS.text, VideOK: true)) {
                            TelFocusNode.requestFocus();
                            setState(() {
                              wErrorTel = "Erreur : Téléphone Invalide";
                            });
                            return;
                          }

                          Edt_Mail.text = Edt_Mail.text.toLowerCase();
                          if (!Regex.validateEmail(Edt_Mail.text)) {
                            MailFocusNode.requestFocus();
                            setState(() {
                              wErrorMail = "Erreur : eMail Invalide";
                            });
                            return;
                          }
                          Edt_Prof.text = Edt_Prof.text.toLowerCase();
                          if (Edt_Prof.text.isEmpty) {
                            wErrorProf = "Erreur : Profession vide";
                            return;
                          }

                          if (Edt_Nais_Lieu.text.isEmpty) {
                            wErrorLN = "Erreur : Lieu de naissance vide";
                            return;
                          }

                          if (Edt_Adresse.text.isEmpty) {
                            wErrorADDR = "Erreur : Adresse vide |${Edt_Adresse.text}|";
                            return;
                          }

                          if (Edt_Prof.text.isEmpty) {
                            wErrorProf = "Erreur : Profession Invalide";
                            return;
                          }
                          if (DateTime_Exp.year == 1900) return;
                          if (DateTime_Nais_Date.year == 1900) return;

                          if (Genre_id == -1) return;

                          DbTools.gEntreprenant.cni = Edt_CNI.text;
                          DbTools.gEntreprenant.nomPrenomDirigeant = Edt_Nom.text;
                          DbTools.gEntreprenant.name = Edt_Nom.text;
                          DbTools.gEntreprenant.lieu_naissance = Edt_Nais_Lieu.text;
                          DbTools.gEntreprenant.countryId = 44; // Edt_Nais_Pays.text;
                          DbTools.gEntreprenant.birthday = DateFormat('yyyy-MM-dd').format(DateTime_Nais_Date);
                          DbTools.gEntreprenant.dateValiditePiece = DateFormat('yyyy-MM-dd').format(DateTime_Exp);
                          DbTools.gEntreprenant.naturePiece = Type_Doc;
                          DbTools.gEntreprenant.nomPrenomDirigeant = Edt_Nom.text;
                          DbTools.gEntreprenant.telephoneDirigeant = Edt_Tel.text;
                          DbTools.gEntreprenant.telephone_dirigeant_whatsapp = Edt_Tel_WS.text;
                          DbTools.gEntreprenant.adresseDirigeant = Edt_Adresse.text;
                          DbTools.gEntreprenant.emailDirigeant = Edt_Mail.text;
                          DbTools.gEntreprenant.profession = Edt_Prof.text;
                          DbTools.gEntreprenant.terminal = Type_Terminal;

                          DbTools.gEntreprenant.qualiteDirigeant = Screen_QF_C26D.Screen_Rep_Str;
                          DbTools.gEntreprenant.autreQualite = Screen_QF_C26DAUTRE.Screen_Rep_Str;
                          DbTools.gEntreprenant.ID3_templateBytes64 = "";
                          DbTools.gEntreprenant.ID3_croppedBytes64 = "";

                          var toArr = DbTools.gEntreprenant.toArr();
                          gColors.printWrapped("ENTREPRENANT ${toArr} ");

                          if (DbTools.gID3_OK) {
                            DbTools.pageEntr++;
                            PushPop.PushPop_Push(false);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => I_KYC_Ins_3(widget.I_Liste_EntreprenantsState_callback)));
                          } else {
                            setState(() {
                              circularProgressIndicator = true;
                            });
                            print("♦♦♦♦ SAVE ENTREPRENANT ");
                            int wRes = await DbOdoo.EntreprenantAddUpd();
                            DbTools.listEntrVoidCallback();

                            if (wRes == -1) {
                              String wError = "♦♦♦♦♦♦♦♦    Erreur d'enregistrement sur le serveur";
                              circularProgressIndicator = false;
                              PushPop.PushPop_Pop(context);
                              setState(() {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => I_Liste_ActivitesIns()));
                              });
                            } else {
                              print("♦♦♦♦♦♦♦♦  Validation OK");
                              await widget.I_Liste_EntreprenantsState_callback();
                              PushPop.PushPop_Pop(context);
                              setState(() {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => I_Liste_ActivitesIns()));
                              });
                            }
                          }
                          ;
                        },
                        style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                          ),
                          backgroundColor: gColors.primary,
                          elevation: 4,
                        ),
                        child: Text(
                          DbTools.gID3_OK ? "Suivant" : "Enregistrer",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                  ),
          ),
        ));
  }

  Widget buildDropDownRowCountry(Country country) {
    // print("buildDropDownRowCountry ${country.country_name}");
    return Text(country.Country_name ?? "Select");
  }

  @override
  Widget DD_Country() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 15,
        ),
        Text(
          "NATIONALITE :",
          style: gColors.bodyTextFieldBold,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: DropDown<Country>(
            items: DbTools.lfCountry,
            initialValue: DbTools.selectedCountry,
            icon: Icon(
              Icons.expand_more,
              color: gColors.secondary,
            ),
            onChanged: (Country? z) {
              print(z?.Country_name);
              setState(() {
                DbTools.selectedCountry = z;
                DbTools.gEntreprenant.countryId = z!.Countryid;
              });
            },
            isCleared: DbTools.selectedCountry == null,
            customWidgets: DbTools.lfCountry.map((z) => buildDropDownRowCountry(z)).toList(),
            isExpanded: true,
          ),
        ),
      ],
    );
  }

//**************************************************************************
//**************************************************************************
//**************************************************************************

  Widget genreFilterWidget() {
    return Row(
//      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Radio(
          value: -1,
          activeColor: Colors.red,
          fillColor: MaterialStateProperty.all<Color>(Colors.red),
          groupValue: Genre_id,
          onChanged: (dynamic val) {
            setState(() {
              radioButtonItem = '';
              Genre_id = -1;
              DbTools.gEntreprenant.sexe = "";
            });
          },
        ),
        Text(
          '?',
          style: gColors.bodyTextFieldBold,
        ),
        Radio(
          value: 0,
          groupValue: Genre_id,
          onChanged: (dynamic val) {
            setState(() {
              radioButtonItem = 'H';
              Genre_id = 0;
              DbTools.gEntreprenant.sexe = "masculin";
            });
          },
        ),
        Text(
          'H',
          style: gColors.bodyTextFieldBold,
        ),
        Radio(
          value: 1,
          groupValue: Genre_id,
          onChanged: (dynamic val) {
            setState(() {
              radioButtonItem = 'F';
              Genre_id = 1;
              DbTools.gEntreprenant.sexe = "feminin";
            });
          },
        ),
        Text(
          'F',
          style: gColors.bodyTextFieldBold,
        ),
      ],
    );
  }

  @override
  Widget DD_Type_Doc() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DropDown(
          items: ['CNI', 'PASSEPORT', 'ATTESTATION D’IDENTITE', 'AUTRE'],
          initialValue: Type_Doc,
          icon: Icon(
            Icons.expand_more,
            color: gColors.secondary,
          ),
          onChanged: (String? newValue) {
            setState(() {
              Type_Doc = newValue;
            });
          },
        ),
      ],
    );
  }

  Future _select_Nais_Date() async {
    DateTime wDateTime_Nais_Date = DateTime_Nais_Date;
    if (DateTime_Nais_Date.year == 1900) wDateTime_Nais_Date = DateTime.now();
    DateTime? picked = await showDatePicker(context: context, locale: const Locale("fr", "FR"), initialDate: wDateTime_Nais_Date, firstDate: new DateTime(1900), lastDate: new DateTime.now());
    if (picked != null) setState(() => DateTime_Nais_Date = picked);
  }

  Future _select_Valid_Date() async {
    print("DateTime_Valid ${DateTime_Exp}");
    DateTime wDateTime_Exp = DateTime_Exp;
    if (DateTime_Exp.year == 1900) wDateTime_Exp = DateTime.now();
    DateTime? picked = await showDatePicker(
      context: context,
      locale: const Locale("fr", "FR"),
      initialDate: wDateTime_Exp,
      firstDate: new DateTime(1900),
      lastDate: new DateTime(2100),
    );
    if (picked != null) setState(() => DateTime_Exp = picked);
  }

  @override
  Widget DD_Type_Terminal() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "TYPE TERMINAL:",
          style: gColors.bodyTextFieldBold,
        ),
        Container(
          width: 15,
        ),
        DropDown(
          items: ['', 'Smartphone', 'Feature phone'],
          initialValue: Type_Terminal,
          icon: Icon(
            Icons.expand_more,
            color: gColors.secondary,
          ),
          onChanged: (String? newValue) {
            setState(() {
              Type_Terminal = newValue;
            });
          },
        ),
      ],
    );
  }
}
