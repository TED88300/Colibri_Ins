import 'dart:async';
import 'package:colibri/Tools/DbOdoo.dart';
import 'package:colibri/Tools/DbTools.dart';
import 'package:colibri/Tools/Regex.dart';
import 'package:colibri/Tools/gColors.dart';
import 'package:colibri/Tools/intent_result.dart';
import 'package:colibri/Widget/3_bottom_navigation_list.dart';
import 'package:colibri/Widget/Identification/I_KYC_Ins_2.dart';
import 'package:colibri/Widget/Identification/I_KYC_Photo.dart';
import 'package:colibri/Widget/Identification/I_Liste_Entreprenants.dart';
import 'package:colibri/widgetTools/PushPop.dart';
import 'package:colibri/widgetTools/toolbar.dart';
import 'package:flutter/material.dart';

import '../../Tools/Tools.dart';

class I_KYC_Ins_1 extends StatefulWidget {
  Function I_Liste_EntreprenantsState_callback;
  I_KYC_Ins_1(this.I_Liste_EntreprenantsState_callback);
  @override
  I_KYC_Ins_1State createState() => I_KYC_Ins_1State();
}

//bool Screen_Rep_Error = false;
//bool Screen_Rep_Mand = false;

class I_KYC_Ins_1State extends State<I_KYC_Ins_1> {
  Item QF_C1 = Item();
  Screen Screen_QF_C1 = Screen();
  Item QF_C2 = Item();
  Screen Screen_QF_C2 = Screen();

  Item QF_C2A = Item();
  Screen Screen_QF_C2A = Screen();

  Item QF_C3A1 = Item();
  Screen Screen_QF_C3A1 = Screen();
  Item QF_C3A2 = Item();
  Screen Screen_QF_C3A2 = Screen();
  Item QF_C3B = Item();
  Screen Screen_QF_C3B = Screen();
  int pageEntr = 0;

  void screenVoidCallback() {
    print("screenVoidCallback");
    setState(() {});
  }

  void initState() {
    pageEntr = DbTools.pageEntr;

    String Sol = "1,2,3,4,5,";
    if (!Sol.contains(DbTools.gEntreprenant.fonctionRepondant!)) DbTools.gEntreprenant.fonctionRepondant = "1";

    QF_C1 = Tools.Get_UNIQUE("Q_C1");
    QF_C2 = Tools.Get_UNIQUE("Q_C2");
    QF_C2A = Tools.Get_UNIQUE("Q_C2A");
    QF_C3A1 = Tools.Get_UNIQUE("Q_C3A1");
    QF_C3A2 = Tools.Get_UNIQUE("Q_C3A2");
    QF_C3B = Tools.Get_UNIQUE("Q_C3B");

    Screen_QF_C2 = Tools.Get_ScreenCallBack(QF_C2, context, DbTools.gEntreprenant.fonctionRepondant!, 0, false, screenVoidCallback);
    Screen_QF_C3A1 = Tools.Get_ScreenCallBack(QF_C3A1, context, DbTools.gEntreprenant.contact1Repondant!, 0, false, screenVoidCallback);
    QF_C3A1.Screen_Rep_Mand = true;
    QF_C3A1.Screen_Rep_Error = false;

    Screen_QF_C3A2 = Tools.Get_ScreenCallBack(QF_C3A2, context, DbTools.gEntreprenant.contact2Repondant!, 0, false, screenVoidCallback);
    QF_C3A2.Screen_Rep_Mand = false;
    QF_C3A2.Screen_Rep_Error = false;
    Screen_QF_C3B = Tools.Get_ScreenCallBack(QF_C3B, context, DbTools.gEntreprenant.emailRepondant!, 0, false, screenVoidCallback);
    QF_C3A1.Screen_Rep_Mand = false;
    QF_C3B.Screen_Rep_Error = false;

    print(" DbTools.gEntreprenant.ImageBase64_PHOTO_ENTR  ${DbTools.gEntreprenant.ImageBase64_PHOTO_ENTR!.length}");

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
    print(">>>>>>>>>>>>>>>>>>>   Build KYC 1 ${DbTools.pageEntr}  $pageEntr <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
    QF_C3A1.Screen_Rep_Mand = true;

    QF_C3A1.Screen_Rep_Error = !gColors.ctrlTelFIXEPORT(Screen_QF_C3A1.Screen_Rep_Str, VideOK: false);
    QF_C3A2.Screen_Rep_Error = !gColors.ctrlTelFIXEPORT(Screen_QF_C3A2.Screen_Rep_Str, VideOK: true);
    QF_C3B.Screen_Rep_Error = !Regex.validateEmail(Screen_QF_C3B.Screen_Rep_Str.toLowerCase());

    Screen_QF_C1 = Tools.Get_Screen(QF_C1, context, DbTools.gEntreprenant.nomRepondant!, 0, false);
    Screen_QF_C2A = Tools.Get_Screen(QF_C2A, context, DbTools.gEntreprenant.autre_fonction_repondant!, 0, false);
    Screen_QF_C3A1 = Tools.Get_ScreenCallBack(QF_C3A1, context, Screen_QF_C3A1.Screen_Rep_Str!, 0, false, screenVoidCallback);
    Screen_QF_C3A2 = Tools.Get_ScreenCallBack(QF_C3A2, context, Screen_QF_C3A2.Screen_Rep_Str!, 0, false, screenVoidCallback);
    Screen_QF_C3B = Tools.Get_ScreenCallBack(QF_C3B, context, Screen_QF_C3B.Screen_Rep_Str!, 0, false, screenVoidCallback);

    print(">>>>>>>>>>>>>>>>>>>   Build KYC 1 ${QF_C3A1.Screen_Rep_Error} ${Screen_QF_C3A1.Screen_Rep_Str}  ${Screen_QF_C3A1.Screen_Rep_Type}<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");

    return WillPopScope(
        onWillPop: _onWillPop,
        child: Container(
          color: Colors.white,
          child: Scaffold(
            appBar: AppBar(
              title: CommonAppBar.TitleEcr("KYC", "REPONDANT", pageEntr, DbTools.pagesEntr, "C1"),
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
                child: Column(
                  children: [
                    Screen_QF_C1.Screen_Row,
                    Screen_QF_C2.Screen_Row,
                    Screen_QF_C2.Screen_Rep_Int != 5 ? Container() : Screen_QF_C2A.Screen_Row,
                    Screen_QF_C3A1.Screen_Row,
                    Screen_QF_C3A2.Screen_Row,
                    Screen_QF_C3B.Screen_Row,
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(85, 15, 85, 15),
                child: ElevatedButton(
                  onPressed: () async {
                    bool isctrlSaisie = await ctrlSaisie();

                    if (!isctrlSaisie) {
                      setState(() {});
                      return;
                    }

                    DbTools.gEntreprenant.nomRepondant = Screen_QF_C1.Screen_Rep_Str;
                    DbTools.gEntreprenant.fonctionRepondant = Screen_QF_C2.Screen_Rep_Str;

                    print("≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈ I_KYC_Ins_1 Screen_QF_C2  ${Screen_QF_C2.Screen_Rep_Str} ${Screen_QF_C2.Screen_Rep_Int}");

                    DbTools.gEntreprenant.autre_fonction_repondant = Screen_QF_C2A.Screen_Rep_Str;
                    DbTools.gEntreprenant.contact1Repondant = Screen_QF_C3A1.Screen_Rep_Str;
                    DbTools.gEntreprenant.contact2Repondant = Screen_QF_C3A2.Screen_Rep_Str;
                    DbTools.gEntreprenant.emailRepondant = Screen_QF_C3B.Screen_Rep_Str;

                    print("≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈ I_KYC_Ins_1 DbTools.gEntreprenant fonctionRepondant ${DbTools.gEntreprenant.fonctionRepondant}");

                    if (DbTools.isUpdate) {
                      DbTools.pageEntr++;
                      PushPop.PushPop_Push(false);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => I_KYC_Ins_2(widget.I_Liste_EntreprenantsState_callback)));
                    } else {
                      if (DbTools.gEMULATEUR) {
                        debugPrint("CREEEEEEEEEEEEEEEEEEEEEEEEEEER");
                        DbTools.pagesEntr++;
                        DbTools.pageEntr++;
                        PushPop.PushPop_Push(false);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => I_KYC_Ins_2(widget.I_Liste_EntreprenantsState_callback)));


                        return;
                      } else
                        await enrollment();
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

    if (!gColors.ctrlTelFIXEPORT(Screen_QF_C3A1.Screen_Rep_Str, VideOK: false)) {
      isOK = false;
      await gColors.PopupError(context, "Erreur de saisie", "Contact 1 :Téléphone Invalide");
      return isOK;
    }

    if (!gColors.ctrlTelFIXEPORT(Screen_QF_C3A2.Screen_Rep_Str, VideOK: true)) {
      isOK = false;
      await gColors.PopupError(context, "Erreur de saisie", "Contact 2 :Téléphone Invalide");
      return isOK;
    }

    if (!Regex.validateEmail(Screen_QF_C3B.Screen_Rep_Str.toLowerCase())) {
      isOK = false;
      await gColors.PopupError(context, "Erreur de saisie", "eMail Invalide");
      return isOK;
    }

    return isOK;
  }

  String wError = "";
  String? wScan = "";
  String _message = "";
  Image? ImageCNI = null;

  Future enrollment() async {
    try {
      debugPrint(" startEnrol deb");
      Map<dynamic, dynamic>? enrolData = await IntentChannel.startEnrol();

      if (enrolData.toString().contains("CREER") || enrolData.toString().length == 0) {
        debugPrint("CREEEEEEEEEEEEEEEEEEEEEEEEEEER");
        DbTools.pagesEntr++;
        DbTools.pageEntr++;
        PushPop.PushPop_Push(false);
        Navigator.push(context, MaterialPageRoute(builder: (context) => I_KYC_Photo(widget.I_Liste_EntreprenantsState_callback)));
        return;
      }

      if (enrolData!.containsKey("isError") && !(enrolData["isError"]) as bool) {
//        _message = (enrolData['data'] as Map<dynamic, dynamic>?).toString();

        DbTools.pagesEntr = DbTools.gID3_OK ? 2 : 1;
        DbTools.pageEntr = 1;

        Map<dynamic, dynamic> result = (enrolData['data'] as Map<dynamic, dynamic>);
        DbOdoo.printWrapped("result : ${result}------");

        DbTools.gEntreprenant.telephoneDirigeant = "";
        DbTools.gEntreprenant.adresseDirigeant = "";
        DbTools.gEntreprenant.emailDirigeant = "";
        DbTools.gEntreprenant.id = 0;
        DbTools.gEntreprenant.Id_Tmp = 0;
//              - document_number
        DbTools.TraceDbg = "retour KMT\n";

        var document_number = result['document_number'];
        print("document_number : ${document_number}");
        DbTools.gEntreprenant.cni = document_number;

        DbTools.TraceDbg += "document_number ${document_number}\n";

        var document_expiry = result['document_expiry'];
        print("document_expiry : ${document_expiry}");

        DbTools.TraceDbg += "document_expiry ${document_expiry}\n";

        // = 320510

        String YYe = "${document_expiry.substring(0, 2)}";
        String MMe = "${document_expiry.substring(2, 4)}";
        String DDe = "${document_expiry.substring(4, 6)}";
        print("document_expiry : ${document_expiry}");
        DbTools.gEntreprenant.dateValiditePiece = "20$YYe-$MMe-$DDe";
        print("DbTools.gEntreprenant.dateValiditePiece : ${DbTools.gEntreprenant.dateValiditePiece}");

        DbTools.TraceDbg += "dateValiditePiece ${DbTools.gEntreprenant.dateValiditePiece}\n";

        // = 2032-05-10

        //              - first_name
        var first_name = result['first_name'];
        print("first_name : ${first_name}");

//              - last_name
        var last_name = result['last_name'];
        print("last_name : ${last_name}");
        DbTools.gEntreprenant.nomPrenomDirigeant = "${last_name} ${first_name}";
        wScan = DbTools.gEntreprenant.nomPrenomDirigeant;

        DbTools.TraceDbg += "contribuable_name ${DbTools.gEntreprenant.nomPrenomDirigeant}\n";

//              - gender
        var gender = result['gender'];
        print("gender : ${gender}");

        DbTools.TraceDbg += "gender |${gender}|\n";

// gender = FEMALE

        if (gender == "MALE")
          DbTools.gEntreprenant.sexe = "masculin";
        else
          DbTools.gEntreprenant.sexe = "feminin";

        DbTools.TraceDbg += "sexe |${DbTools.gEntreprenant.sexe}|\n";

        print("sexe : ${DbTools.gEntreprenant.sexe}");

//              - country_code
        var country_code = result['country_code'];
        print("country_code : ${country_code}");

        DbTools.TraceDbg += "country_code ${country_code}\n";

//              - nationality
        var nationality = result['nationality'];
        print("nationality : ${nationality}");
        DbTools.gEntreprenant.countryId = 44;
        DbTools.gEntreprenant.terminal = "Smartphone";

        var nationality2 = "";

        for (int i = 0; i < DbTools.Alpha2_3.length; ++i) {
          if (DbTools.Alpha2_3[i][1] == nationality) nationality2 = DbTools.Alpha2_3[i][0];
        }
        print("nationality ${nationality} ${nationality2}");

        DbTools.TraceDbg += "nationality ${nationality} ${nationality2}\n";

        for (int i = 0; i < DbTools.lfCountry.length; ++i) {
          if (nationality2 == DbTools.lfCountry[i].Country_code) {
            print("Conutry ${DbTools.lfCountry[i].toMap()}");
            DbTools.gEntreprenant.countryId = DbTools.lfCountry[i].Countryid;
          }
        }

        DbTools.TraceDbg += "contribuable_Nais_Pays ${DbTools.gEntreprenant.countryId}\n";

        var place_of_birth = result['place_of_birth'];
        DbTools.gEntreprenant.lieu_naissance = place_of_birth;

        DbTools.TraceDbg += "place_of_birth ${place_of_birth}\n";

//              - date_of_birth
        String date_of_birth = result['date_of_birth'];
        String YY = "${date_of_birth.substring(0, 2)}";
        String MM = "${date_of_birth.substring(2, 4)}";
        String DD = "${date_of_birth.substring(4, 6)}";
        print("date_of_birth : ${date_of_birth}");

        String Seicle = "19";
        if (int.parse(YY) < 22) Seicle = "20";

        DbTools.gEntreprenant.birthday = "$Seicle$YY-$MM-$DD";
        print("gEntreprenant.contribuable_Nais_Date : ${DbTools.gEntreprenant.birthday}");

        DbTools.TraceDbg += "contribuable_Nais_Date ${DbTools.gEntreprenant.birthday}\n";

        var document_code = result['document_code'];
        print("document_code : ${document_code}");

        if (document_code == "P")
          DbTools.gEntreprenant.naturePiece = "PASSEPORT";
        else if (document_code == "C" || document_code == "I" || document_code == "ID")
          DbTools.gEntreprenant.naturePiece = "CNI";
        else
          DbTools.gEntreprenant.naturePiece = "AUTRE";

        DbTools.TraceDbg += "document_code ${document_code}\n";
        DbTools.TraceDbg += "contribuable_natpiece ${DbTools.gEntreprenant.naturePiece}\n";

        DbTools.gEntreprenant.state = "draft";

        var mrz = result['mrz'];
        print("mrz : ${mrz}");


        var image = result['image'];
        print("image : ${image}");
        if (image != null)
          {

            DbTools.gEntreprenant.ImageBase64_PHOTO_ENTR = image;
            print("DbTools.gEntreprenant.ImageBase64_PHOTO_ENTR : ${DbTools.gEntreprenant.ImageBase64_PHOTO_ENTR}");
            PushPop.PushPop_Push(false);
            Navigator.push(context, MaterialPageRoute(builder: (context) => I_KYC_Ins_2(widget.I_Liste_EntreprenantsState_callback)));
          }
        else
          {
            PushPop.PushPop_Push(false);
            Navigator.push(context, MaterialPageRoute(builder: (context) => I_KYC_Photo(widget.I_Liste_EntreprenantsState_callback)));
          }





      } else {}
    } catch (e) {}
  }
}
