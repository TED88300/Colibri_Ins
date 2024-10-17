import 'dart:convert';

import 'package:Colibri_Collecte/Tools/Classes_V3.dart';
import 'package:Colibri_Collecte/Tools/DbData.dart';
import 'package:Colibri_Collecte/Tools/DbTools.dart';
import 'package:Colibri_Collecte/Tools/Ilot.dart';
import 'package:Colibri_Collecte/Tools/Ins_Activite.dart';
import 'package:Colibri_Collecte/Tools/Ins_Entreprenant.dart';
import 'package:Colibri_Collecte/Tools/gColors.dart';
import 'package:Colibri_Collecte/Tools/identifier_stats.dart';
import 'package:Colibri_Collecte/Tools/shared_pref.dart';
import 'package:http/http.dart' as http;


class DbToolsV3 {
  DbToolsV3();


  static int? UserId =0;
  static String? UserMat ="";
  static String? UserName = "";
  static int? Userilot_id =0;
  static String username = "";
  static String password = "";
  static String authorization = "";

  static int nombre_fiche_create = 0;
  static int nombre_fiche_draft = 0;
  static int nombre_fiche_valid = 0;
  static int nombre_fiche_cancel = 0;

  static final UrlV3 = "https://app.id30.ci/api/v1/";
//  static final UrlV3 = "https://7eef-88-181-251-25.ngrok-free.app//api/v1/";


  static Future ImgMafa_getToken() async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://colibri-test.herokuapp.com/token'));
    request.fields.addAll({'username': 'APP_ITC', 'password': 'TED88300'});

    print("ImgMafa_getToken request.send()");
    http.StreamedResponse response = await request.send();
    print("ImgMafa_getToken response ${response.statusCode}");
    if (response.statusCode == 200) {
      var parsedJson = json.decode(await response.stream.bytesToString());
      print("ImgMafa_getToken parsedJson ${parsedJson.toString()}");
    } else {
      print(response.reasonPhrase);
    }
//    eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MywidXNlcm5hbWUiOiJBUFBfSVRDIiwicGFzc3dvcmRfaGFzaCI6IiQyYiQxMiQyYWgwcUJFZVBCQkhDNmxZSjVELzhlTi5meDIvOEpiSlUvTnRIZ2hkTllQYXUyL00wbTNGUyJ9.e9WMmCBDuwNjpI4gtby6ls3ri3FttgeXf4Obo7oFCx8
  }


  static Future<bool> LoginV3(String user, String pw) async {

    print("☗☗☗☗☗☗☗☗☗☗ LoginV3 ☗☗☗☗☗☗☗☗☗☗ ☗☗☗☗☗☗☗☗☗☗ ☗☗☗☗☗☗☗☗☗☗ ");
    print('☗☗☗☗☗☗☗☗☗☗ Login: $user $pw');


    bool wRet = false;

    var request = http.MultipartRequest(
        'POST', Uri.parse('${UrlV3}sign_in'));
    request.fields.addAll({'user[email]': '$user', 'user[password]': '$pw'});

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print('☗☗☗☗☗☗☗☗☗☗ response.headers: ${response.headers}');
      Map<String, String> headers= response.headers;
      print('☗☗☗☗☗☗☗☗☗☗ headers: ${headers}');
      authorization = headers["authorization"].toString();
      print('☗☗☗☗☗☗☗☗☗☗ authorization: ${authorization}');

      var parsedJson = json.decode(await response.stream.bytesToString());
       User_Login wUser_Login = User_Login.fromJson(parsedJson);
       print('☗☗☗☗☗☗☗☗☗☗ User_Login: ${wUser_Login.status!.data!.user!.toJson()}');

       username = user;
       password = pw;

       UserId = wUser_Login.status!.data!.user!.id;
       UserMat = wUser_Login.status!.data!.user!.id.toString();
       UserName = wUser_Login.status!.data!.user!.serial;
       Userilot_id = wUser_Login.status!.data!.user!.sector!.ilotId!;



/*
       nombre_fiche_create = res_User[0]["nombre_fiche_create"];
       nombre_fiche_draft = res_User[0]["nombre_fiche_draft"];
       nombre_fiche_valid = res_User[0]["nombre_fiche_confirm"];
       nombre_fiche_cancel = res_User[0]["nombre_fiche_cancel"];
*/

       print("B");

       await SharedPref.setStrKey("res_UserId", UserId.toString());
       await SharedPref.setStrKey("res_UserMat", UserMat!);
       await SharedPref.setStrKey("res_UserName", UserName!);
       await SharedPref.setStrKey("res_Userilot_id", Userilot_id.toString());
       await SharedPref.setStrKey("authorization", authorization);

       await SharedPref.setStrKey("nombre_fiche_create", nombre_fiche_create.toString());
       await SharedPref.setStrKey("nombre_fiche_draft", nombre_fiche_draft.toString());
       await SharedPref.setStrKey("nombre_fiche_valid", nombre_fiche_valid.toString());
       await SharedPref.setStrKey("nombre_fiche_cancel", nombre_fiche_cancel.toString());

       print('  >>>>>>>>> nombre_fiche_create: ${nombre_fiche_create}');
       nombre_fiche_create = int.parse(await SharedPref.getStrKey("nombre_fiche_create", "0"));
       print('  <<<<<<<<< nombre_fiche_create: ${nombre_fiche_create}');



      print('${DateTime.now()} > Userilot_id: ${Userilot_id}');
      await getIlots(Userilot_id!);

       await SharedPref.setStrKey("username", username);
       await SharedPref.setStrKey("password", password);
       DbTools.gUsername = username;
       DbTools.gPassword = password;
       return true;
    } else {
      print("☗☗☗☗☗☗☗☗☗☗ LoginV3 Error : ${response.statusCode}");
      print("☗☗☗☗☗☗☗☗☗☗ LoginV3 Error : ${response.reasonPhrase}");
      return false;
    }
    return true;
  }


  static identifier_stats gIdentifier_stats = identifier_stats();
  static Future<int?> GetStat() async {
    String wUrl = "${UrlV3}identifier_stats/$UserId";

    var headers = {
      'Authorization': '$authorization',
    };


    var request = http.MultipartRequest('GET', Uri.parse(wUrl.toString()));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print('☗☗☗☗☗☗☗☗☗☗ GetStat response.statusCode : ${response.statusCode}');

      String wTmp = await response.stream.bytesToString();
      print('☗☗☗☗☗☗☗☗☗☗ wTmp : ${wTmp}');

      var parsedJson = json.decode(await wTmp);
      gIdentifier_stats = identifier_stats.fromJson(parsedJson);



    }
    return null;
  }



    static List<Ilot> Ilots = [];

  static Future<int?> getIlots(int ailot) async {
    String wUrl = "${UrlV3}sectors/$ailot";


    var headers = {
      'Authorization': '$authorization',
    };


    print("wUrlA $wUrl");

    var request = http.MultipartRequest('GET', Uri.parse(wUrl.toString()));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print('☗☗☗☗☗☗☗☗☗☗ getIlots response.statusCode : ${response.statusCode}');

      String wTmp = await response.stream.bytesToString();
      print('☗☗☗☗☗☗☗☗☗☗ wTmp : ${wTmp}');

      var element = json.decode(wTmp);


      print('☗☗☗☗☗☗☗☗☗☗ items : ${element}');
      if (element != null) {
        print(" ILOT ${element}");
        Ilot ilot = Ilot.fromJson(element);
        ilot.ilotid = ailot;
        Ilots.add(ilot);

        final db = await DbTools.database;
        await db.execute("Delete from Ilot");
        int? repid = await db.insert("Ilot", ilot.toMap());
        print(" ILOT repid ${repid} ${Ilots[0].clusterName}");

        print("Ilots ${Ilots.length}");
        return Ilots.length;
      }
    } else {
      print("ilot ${response.statusCode}");
      print("ilot ${response.reasonPhrase}");
      print("ilot ${response.headers}");
      return 0;
    }
    return null;
  }



  //*********************************************************
  //*********************************************************
  //*********************************************************

  static List<Entreprenant> Ins_Entreprenants = [];

  static Future<int?> Entreprenants(int sector_id, int offset, int limit, bool without_activity) async {
//    String wUrl = "${UrlAPI}get_entreprenant_by_ilot&ilot=${ilot}&offset=$offset&limit=$limit";
    String wUrl = "${UrlV3}entrepreneurs?sector_id=${sector_id}&offset=$offset&limit=$limit&without_activity=$without_activity";


    print("wUrlA Entreprenants $wUrl");
    var request = http.MultipartRequest('GET', Uri.parse(wUrl.toString()));

    var headers = {
      'Authorization': '$authorization',
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String wTmp = await response.stream.bytesToString();

      print("wTmp Entreprenants $wTmp");


      wTmp = wTmp.replaceAll("N/A", "");



      List<dynamic> items = json.decode(wTmp);
      print("items.length ${items.length}");
      for (int i = 0; i < items.length; ++i) {
        var element = items[i];
//          if (offset == 0 && i == 0) print("element id index 0 ${element['id']}");
        if (i == 0) print("element id index 0 ${element}");


        Entreprenant ins_Entreprenant = Entreprenant.fromJson(element);
        ins_Entreprenant.Id_Tmp = ins_Entreprenant.id;
//          print("ins_Entreprenant A ${ins_Entreprenant.name} ${ins_Entreprenant.telephoneDirigeant} ${element['telephone_dirigeant']}");
        Ins_Entreprenants.add(ins_Entreprenant);
      }
      print("ins_Entreprenant ${Ins_Entreprenants.length}");
      return Ins_Entreprenants.length;
        } else {
      print(response.statusCode);
      print(response.reasonPhrase);
      print(response.headers);
      return 0;
    }
    return null;
  }

  static Future<int?> EntreprenantsID(int UserId, int offset, int limit, bool without_activity) async {

    String wUrl = "${UrlV3}entrepreneurs?identifier_id=${UserId}&offset=$offset&limit=$limit&statuses[]=draft&statuses[]=rejected&statuses[]=confirm";


    print("wUrlA $wUrl");
    var request = http.MultipartRequest('GET', Uri.parse(wUrl.toString()));

    var headers = {
      'Authorization': '$authorization',
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String wTmp = await response.stream.bytesToString();
      wTmp = wTmp.replaceAll("N/A", "");

      List<dynamic> items = json.decode(wTmp);
      print("items.length ${items.length}");
      for (int i = 0; i < items.length; ++i) {
        var element = items[i];
//          if (offset == 0 && i == 0) print("element id index 0 ${element['id']}");
        if (i == 0) print("element id index 0 ${element}");


        Entreprenant ins_Entreprenant = Entreprenant.fromJson(element);
        ins_Entreprenant.Id_Tmp = ins_Entreprenant.id;
//          print("ins_Entreprenant A ${ins_Entreprenant.name} ${ins_Entreprenant.telephoneDirigeant} ${element['telephone_dirigeant']}");
        Ins_Entreprenants.add(ins_Entreprenant);
      }
      print("ins_Entreprenant ${Ins_Entreprenants.length}");
      return Ins_Entreprenants.length;
        } else {
      print(response.statusCode);
      print(response.reasonPhrase);
      print(response.headers);
      return 0;
    }
    return null;
  }




  static Future<int?> EntreprenantsIntegration() async {
    final db = await DbTools.database;
    var dbb = db.batch();

    print(">>>>>>>>>>>>>>>>>>>>>>>>> EntreprenantsIntegration");

//    db.execute("DROP INDEX `PRIMARY` ON Contribuables;");

    bool Dbg = false;

    for (int i = 0; i < Ins_Entreprenants.length; ++i) {
      var element = Ins_Entreprenants[i];
      if (Dbg) print("element ${element}");
      element.ENT_Id_Server = element.id;
//      print("element integration ${element.toJson()}");
      try{
        int? repid = await db.insert("Entreprenants", element.toJson());
        if (Dbg) print("repid ${repid}");
      }catch(e){}
    }

    await dbb.commit(noResult: false);

    print(">>>>>>>>>>>>>>>>>>>>>>>>> EntreprenantsIntegration After commit");

    int count = 0;
    final tables = await db.rawQuery('SELECT count(*) as c FROM Entreprenants;');
    tables.forEach((element) {
      count = element['c'];
    });

    return count;
  }



  static Future<int> entrepreneursADD(Entreprenant aEntreprenant) async {
    return 0;

    print("☗☗☗☗☗☗☗☗☗☗ entrepreneursADD ☗☗☗☗☗☗☗☗☗☗ ☗☗☗☗☗☗☗☗☗☗ ☗☗☗☗☗☗☗☗☗☗ ");
    bool wRet = false;
    var request = http.MultipartRequest('POST', Uri.parse('${UrlV3}entrepreneurs'));

    Map<String, dynamic> toArrInsert = aEntreprenant.toArrInsert();
    Map<String, String> stringQueryParameters = toArrInsert.map((key, value) => MapEntry(key, value.toString()));
    request.fields.addAll(stringQueryParameters);
    var headers = {
      'Authorization': '$authorization',
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {

      var parsedJson = json.decode(await response.stream.bytesToString());
      int gLastID = -1;
      gLastID = int.tryParse("${parsedJson['last_id']}") ?? 0;
      return gLastID;
    } else {
      print("☗☗☗☗☗☗☗☗☗☗ entrepreneurs Error : ${response.reasonPhrase}");
      return -1;
    }
    return 0;
  }

  static Future<bool> entrepreneursUPD(Entreprenant aEntreprenant) async {
    return false;

    print("☗☗☗☗☗☗☗☗☗☗ entrepreneursUPD ☗☗☗☗☗☗☗☗☗☗ ☗☗☗☗☗☗☗☗☗☗ ☗☗☗☗☗☗☗☗☗☗ ");
    bool wRet = false;
    var request = http.MultipartRequest('PATCH', Uri.parse('${UrlV3}entrepreneurs/${aEntreprenant.id}'));
    var headers = {
      'Authorization': '$authorization',
    };
    request.headers.addAll(headers);

    Map<String, dynamic> toArrInsert = aEntreprenant.toArrUpd();
    Map<String, String> stringQueryParameters = toArrInsert.map((key, value) => MapEntry(key, value.toString()));
    request.fields.addAll(stringQueryParameters);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String wTmp = await response.stream.bytesToString();
      print("☗☗☗☗☗☗☗☗☗☗ entrepreneursUPD stream  ${wTmp}");


      return true;
    } else {
      print("☗☗☗☗☗☗☗☗☗☗ entrepreneurs Error : ${response.reasonPhrase}");
      return false;
    }
    return true;
  }


  //*********************************************************
  //*********************************************************
  //*********************************************************

  static List<Activite_ins> Ins_Activites = [];

  static Future<int?> getActivites_Ins(int ilot, int offset, int limit) async {
//    String wUrl = "${UrlAPI}get_activites_in_ilot&ilot=${ilot}&offset=$offset&limit=$limit";
    String wUrl = "${UrlV3}activities?sector_id=${ilot}&offset=$offset&limit=$limit";

    var headers = {
      'Authorization': '$authorization',
    };

    print("getActivites_Ins  $wUrl");

    var request = http.MultipartRequest('GET', Uri.parse(wUrl.toString()));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("response.statusCode ${response.statusCode}");
      String wTmp = await response.stream.bytesToString();
      wTmp = wTmp.replaceAll("N/A", "");

//            printWrapped("getActivites_Ins wTmp ${wTmp}");

      List<dynamic> items = json.decode(wTmp);
//      printWrapped("getlfEntreprenants items ${items}");
      for (int i = 0; i < items.length; ++i) {
        var element = items[i];
        Activite_ins activite_ins = Activite_ins.fromJson(element);
        Ins_Activites.add(activite_ins);
      }

      print(" API Ins_Activites ${Ins_Activites.length}");
      return Ins_Activites.length;
        } else {
      print(response.statusCode);
      print(response.reasonPhrase);
      print(response.headers);
      return 0;
    }
    return null;
  }


  static Future<int?> getActivites_InsID(int UserId, int offset, int limit) async {
//    String wUrl = "${UrlAPI}get_activites_in_ilot&ilot=${ilot}&offset=$offset&limit=$limit";
    String wUrl = "${UrlV3}activities?identifier_id=${UserId}&offset=$offset&limit=$limit&statuses[]=draft&statuses[]=rejected&statuses[]=confirm";



    var headers = {
      'Authorization': '$authorization',
    };

    print("getActivites_Ins  $wUrl");

    var request = http.MultipartRequest('GET', Uri.parse(wUrl.toString()));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("response.statusCode ${response.statusCode}");
      String wTmp = await response.stream.bytesToString();
      wTmp = wTmp.replaceAll("N/A", "");

//            printWrapped("getActivites_Ins wTmp ${wTmp}");

      List<dynamic> items = json.decode(wTmp);
//      printWrapped("getlfEntreprenants items ${items}");
      for (int i = 0; i < items.length; ++i) {
        var element = items[i];
        Activite_ins activite_ins = Activite_ins.fromJson(element);
        Ins_Activites.add(activite_ins);
      }

      print(" API Ins_Activites ${Ins_Activites.length}");
      return Ins_Activites.length;
        } else {
      print(response.statusCode);
      print(response.reasonPhrase);
      print(response.headers);
      return 0;
    }
    return null;
  }




  static Future<int?> ActivitesInsIntegration() async {
    print(" ActivitesInsIntegration ${Ins_Activites.length} à intégrer");

    final db = await DbTools.database;


//    db.execute("DROP INDEX `PRIMARY` ON Activites;");

    bool Dbg = false;

    for (int i = 0; i < DbToolsV3.Ins_Activites.length; ++i) {
      var element = DbToolsV3.Ins_Activites[i];
      element.ACT_TRANSF_OK = 1;
      element.ACT_Id_Server = element.id;
  //    gColors.printWrapped(" entreprenantId  ${element.entreprenantId}");
  //    gColors.printWrapped(" Ins_Activites.toJson()  ${element.toJson()}");

      try {
        int? repid = await db.insert("Activites_Ins", element.toJson());
      } catch (e) {
        print("ERROR SQL INSERT $e");
      }
    }

    List<Activite_ins> lfActivite_ins;
    lfActivite_ins = await DbTools.getActivitesInsAll();

    if (Dbg) {
      for (int i = 0; i < lfActivite_ins.length; ++i) {
        print("======= $i ${lfActivite_ins[i].name} ${lfActivite_ins[i].telephoneFixe1Entreprise} ${lfActivite_ins[i].mobile}");
      }
    }
    print(" ActivitesInsIntegration ${lfActivite_ins.length} intégrées");



    return lfActivite_ins.length;
  }

  static Future<int> activitiesADD(Activite_ins aActivite_ins) async {
    return 0;

    print("☗☗☗☗☗☗☗☗☗☗ activitiesADD ☗☗☗☗☗☗☗☗☗☗ ☗☗☗☗☗☗☗☗☗☗ ☗☗☗☗☗☗☗☗☗☗ ");
    bool wRet = false;
    var request = http.MultipartRequest('POST', Uri.parse('${UrlV3}activities'));

    print("☗☗☗☗☗☗☗☗☗☗ activitiesADD aActivite_ins.toArr()  ${aActivite_ins.toArr()}");

    Map<String, dynamic> toArrInsert = aActivite_ins.toArr();
    Map<String, String> stringQueryParameters = toArrInsert.map((key, value) => MapEntry(key, value.toString()));
    request.fields.addAll(stringQueryParameters);
    var headers = {
      'Authorization': '$authorization',
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {

      var parsedJson = json.decode(await response.stream.bytesToString());
      int gLastID = -1;
      gLastID = int.tryParse("${parsedJson['last_id']}") ?? 0;
      return gLastID;


    } else {
      print("☗☗☗☗☗☗☗☗☗☗ activitiesADD ${response.statusCode} Error : ${response.reasonPhrase}");
      String wTmp = await response.stream.bytesToString();
      print("☗☗☗☗☗☗☗☗☗☗ activitiesADD stream  ${wTmp}");

      return -1;
    }
    return 0;
  }

  static Future<bool> activitiesUPD(Activite_ins aActivite_ins) async {
    return true;

    print("☗☗☗☗☗☗☗☗☗☗ activitiesUPD ☗☗☗☗☗☗☗☗☗☗ ☗☗☗☗☗☗☗☗☗☗ ☗☗☗☗☗☗☗☗☗☗ ");
    bool wRet = false;
    var request = http.MultipartRequest('PATCH', Uri.parse('${UrlV3}activities/${aActivite_ins.id}'));
    var headers = {
      'Authorization': '$authorization',
    };
    request.headers.addAll(headers);

    Map<String, dynamic> toArrInsert = aActivite_ins.toArrUpd();

    gColors.printWrapped("♦♦♦♦♦♦♦♦ UPDATE DbToolsV3 toArrInsert ${toArrInsert} ");


    Map<String, String> stringQueryParameters = toArrInsert.map((key, value) => MapEntry(key, value.toString()));
    request.fields.addAll(stringQueryParameters);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String wTmp = await response.stream.bytesToString();
      print("☗☗☗☗☗☗☗☗☗☗ activitiesUPD stream  ${wTmp}");
      return true;
    } else {
      print("☗☗☗☗☗☗☗☗☗☗ activitiesUPD Error : ${response.reasonPhrase}");
      return false;
    }
    return true;
  }



  //***********************************************
  //***********************************************
  //***********************************************

  static Future<int?> activity_sectors() async {

    final db = await DbTools.database;
    //    String wUrl = "${UrlAPI}get_activites_in_ilot&ilot=${ilot}&offset=$offset&limit=$limit";
    String wUrl = "${UrlV3}activity_sectors";

    var headers = {
      'Authorization': '$authorization',
    };

    print("activity_sectors  $wUrl");

    var request = http.MultipartRequest('GET', Uri.parse(wUrl.toString()));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("response.statusCode ${response.statusCode}");
      String wTmp = await response.stream.bytesToString();
      wTmp = wTmp.replaceAll("N/A", "");

//            printWrapped("getActivites_Ins wTmp ${wTmp}");

      List<dynamic> items = json.decode(wTmp);
//      printWrapped("getlfEntreprenants items ${items}");
      for (int i = 0; i < items.length; ++i) {
        var element = items[i];

        String wForme = "COMMERCE";
        if (element["forme_activite"] != "false") wForme = element["forme_activite"].toString();
        String wname = "";
        if (!element["name"].toString().contains("null")) wname = element["name"];
        String wtype_activite = "";
        if (element["type_activite"] != "false") {
          wtype_activite = element["type_activite"].toString();
        }

        if (wname.compareTo(" ") == 0) {
          wname = "???";
        }

        var SecteurData = Secteur(
          secteurid: element["id"],
          secteur_name: "${wname}",
          secteur_forme: "${wForme}",
          type_activite: "${wtype_activite}",
        );


        int? repid = await db.insert("Secteurs", SecteurData.toMap());


      }


        } else {
      print(response.statusCode);
      print(response.reasonPhrase);
      print(response.headers);
      return 0;
    }
    return null;
  }


  static Future<int?> countries() async {

    final db = await DbTools.database;
    //    String wUrl = "${UrlAPI}get_activites_in_ilot&ilot=${ilot}&offset=$offset&limit=$limit";
    String wUrl = "${UrlV3}countries";

    var headers = {
      'Authorization': '$authorization',
    };

    print("API countries  $wUrl");

    var request = http.MultipartRequest('GET', Uri.parse(wUrl.toString()));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("response.statusCode ${response.statusCode}");
      String wTmp = await response.stream.bytesToString();
      wTmp = wTmp.replaceAll("N/A", "");

//            printWrapped("getActivites_Ins wTmp ${wTmp}");

      List<dynamic> items = json.decode(wTmp);
//      printWrapped("getlfEntreprenants items ${items}");
      for (int i = 0; i < items.length; ++i) {
        var element = items[i];

        var CountryData = Country(
          Countryid: element["id"],
          Country_name: "${element["name"]}",
          Country_code: "${element["code"]}",
        );
        int? repid = await db.insert("Countrys", CountryData.toMap());
      }
        } else {
      print(response.statusCode);
      print(response.reasonPhrase);
      print(response.headers);
      return 0;
    }
    return null;
  }

}