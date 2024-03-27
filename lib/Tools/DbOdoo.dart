import 'dart:convert';

import 'package:colibri/Tools/API_Data.dart';
import 'package:colibri/Tools/DbData.dart';
import 'package:colibri/Tools/Ilot.dart';
import 'package:colibri/Tools/Ins_Activite.dart';
import 'package:colibri/Tools/Ins_Entreprenant.dart';
import 'package:colibri/Tools/gColors.dart';
import 'package:colibri/Tools/shared_pref.dart';
import 'package:http/http.dart' as http;
import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:postgres/postgres.dart';

import 'DbTools.dart';

class DbOdoo {
  DbOdoo();
//  static final client = OdooClient('https://mcolibri.nzassa.pro');
//  static final String dbc = "mcolibri.nzassa.pro";

/*
  static final client = OdooClient('https://id30.nzassa.pro/');
  static final Url = "https://id30.nzassa.pro/";
  static final UrlAPIV2 = "https://id30.nzassa.pro/api/";
  static final String dbc = "innoving_id30_national_db_v3";
*/

  static final client = OdooClient('https://id30v2.nzassa.pro/');
  static final Url = "https://id30v2.nzassa.pro/";
  static final UrlAPIV2 = "https://id30v2.nzassa.pro/api/";
  static final String dbc = "id30_v2";

  static String username = "";
  static String password = "";

  static var res_User;
  static var res_UserId;
  static var res_UserMat;
  static var res_UserName;
  static int res_Usercluster_id = 0;
  static int res_Userregion_id = 0;
  static int res_Userdepartement_id = 0;
  static int res_Usersousprefecture_id = 0;
  static int res_Usercommune_id = 0;
  static int res_Userlocalite_id = 0;
  static int res_Userzonerecensement_id = 0;
  static int res_Userquartier_id = 0;
  static int res_Userilot_id = 0;

  static var res_Contribuables;
  static var res_Activites_Ins;
  static var res_Activites;
  static var res_Secteurs;
  static var res_Zones;
  static var res_Svas;
  static var res_Countrys;

  static int nombre_fiche_create = 0;
  static int nombre_fiche_draft = 0;
  static int nombre_fiche_valid = 0;
  static int nombre_fiche_cancel = 0;

  static var res_Fournisseurs;

  static var Mem_B5 = "";

  static Future<void> setData(PostgreSQLConnection connection, String table,
      Map<String, dynamic> data) async {
    await connection.execute(
        'INSERT INTO $table (${data.keys.join(', ')}) VALUES (${data.keys.map((k) => '@$k').join(', ')})',
        substitutionValues: data);
  }

  static Future<int> Debug_Data_insAdd(String code, String debug_data, String activite, String name) async {

    try {

      var databaseConnection = PostgreSQLConnection("51.255.70.124", 5432, "id30_v2", username: "id30", password: "azertyuiopP#554");


       var wArgs = {
         'name': "$name $activite",
         'User_id': res_UserId,
         'ilot_id': res_Userilot_id,
         'code': code,
         'debug_data': debug_data,
       };

     await databaseConnection.open().then((value) async {
       print("Database Connected!");
       await setData(databaseConnection, "innoving_debug_data", wArgs);
       await databaseConnection.close();
     });
    } catch (e) {
      print("Debug_Data_insAdd ERROR SQL INSERT $e");
    }
    return 1;
  }

      static Future<bool> Login(String user, String pw) async {
//    print("client ${client.sessionId}");

    print('Login: $user $pw');

    username = user;
    password = pw;

   try {
      print("Login session > ${dbc} ");
      final session = await client.authenticate(dbc, username, password);
      print("Login session < ${dbc} ${session}");

      final uid = session.userId;
      print("Login uid ${uid}");



      res_User = await client.callKw({
        'model': 'res.users',
        'method': 'search_read',
        'args': [],
        'kwargs': {
          'context': {'bin_size': true},
          'domain': [
            ['id', '=', uid]
          ],
//          'fields': ['id', 'name', 'email', '__last_update', 'is_collector', 'partner_id', 'is_evaluator', 'is_identificator', 'ville_id', 'cluster_id', 'region_id', 'departement_id', 'sousprefecture_id', 'commune_id', 'localite_id', 'zonerecensement_id', 'quartier_id', 'ilot_id, nombre_fiche_create,nombre_fiche_draft,nombre_fiche_valid,nombre_fiche_cancell'],
        }
      });



      printWrapped("Login users ${res_User[0].toString()}");
      print ("---");

      res_UserId = res_User[0]["id"];
      print ("A");
      res_UserMat = res_User[0]["partner_id"][0].toString();
      print ("A2");
      res_UserName = res_User[0]["name"];
      print ("A3 ${res_User[0]["ilot_id"][0]}");
      res_Userilot_id = res_User[0]["ilot_id"][0];
      print ("A4");
      res_Usercluster_id = res_User[0]["cluster_id"][0];
      print ("A5");
      res_Userregion_id = res_User[0]["region_id"][0];
      print ("A6");
      res_Userdepartement_id = res_User[0]["departement_id"][0];
      print ("A7");
      res_Usersousprefecture_id = res_User[0]["sousprefecture_id"][0];
      print ("A8");
      res_Usercommune_id = res_User[0]["commune_id"][0];
      print ("A9");
      res_Userlocalite_id = res_User[0]["localite_id"][0];
      print ("A10");
      res_Userzonerecensement_id = res_User[0]["zonerecensement_id"][0];
      print ("A1");
      res_Userquartier_id = res_User[0]["quartier_id"][0];
      print ("A2");


    nombre_fiche_create = res_User[0]["nombre_fiche_create"];
      nombre_fiche_draft = res_User[0]["nombre_fiche_draft"];
      nombre_fiche_valid = res_User[0]["nombre_fiche_confirm"];
      nombre_fiche_cancel = res_User[0]["nombre_fiche_cancel"];

    print ("B");

    await SharedPref.setStrKey("res_UserId", res_UserId.toString());
      await SharedPref.setStrKey("res_UserMat", res_UserMat);
      await SharedPref.setStrKey("res_UserName", res_UserName);
      await SharedPref.setStrKey("res_Userilot_id", res_Userilot_id.toString());
      await SharedPref.setStrKey("res_Usercluster_id", res_Usercluster_id.toString());
      await SharedPref.setStrKey("res_Userregion_id", res_Userregion_id.toString());
      await SharedPref.setStrKey("res_Userdepartement_id", res_Userdepartement_id.toString());
      await SharedPref.setStrKey("res_Usersousprefecture_id", res_Usersousprefecture_id.toString());
      await SharedPref.setStrKey("res_Usercommune_id", res_Usercommune_id.toString());
      await SharedPref.setStrKey("res_Userlocalite_id", res_Userlocalite_id.toString());
      await SharedPref.setStrKey("res_Userzonerecensement_id", res_Userzonerecensement_id.toString());
      await SharedPref.setStrKey("res_Userquartier_id", res_Userquartier_id.toString());

      await SharedPref.setStrKey("nombre_fiche_create", nombre_fiche_create.toString());
      await SharedPref.setStrKey("nombre_fiche_draft", nombre_fiche_draft.toString());
      await SharedPref.setStrKey("nombre_fiche_valid", nombre_fiche_valid.toString());
      await SharedPref.setStrKey("nombre_fiche_cancel", nombre_fiche_cancel.toString());

      print('  >>>>>>>>> nombre_fiche_create: ${nombre_fiche_create}');
      nombre_fiche_create = int.parse(await SharedPref.getStrKey("nombre_fiche_create", "0"));
      print('  <<<<<<<<< nombre_fiche_create: ${nombre_fiche_create}');

      print('${DateTime.now()} > res_Userilot_id: ${res_Userilot_id}');
      await getIlots(res_Userilot_id);
      await DbTools.getIlot();
      print("ILOT0 ${Ilots[0].ilotName}");

      await SharedPref.setStrKey("username", username);
      await SharedPref.setStrKey("password", password);
      DbTools.gUsername = username;
      DbTools.gPassword = password;

      return true;
    } catch (e) {
      print("OdooException ERROR LOGIN $e");
      print(e);

    }



    await DbTools.getIlot();
    DbTools.gUsername = await SharedPref.getStrKey("username", "");
    DbTools.gPassword = await SharedPref.getStrKey("password", "");
    print("∆∆∆∆∆∆∆∆∆∆∆ OdooException ERROR LOGIN A");

    res_UserId = await SharedPref.getStrKey("res_UserId", "");
    res_UserMat = await SharedPref.getStrKey("res_UserMat", "");
    res_UserName = await SharedPref.getStrKey("res_UserName", "");
    res_Userilot_id = int.parse(await SharedPref.getStrKey("res_Userilot_id", "0"));
    res_Usercluster_id = int.parse(await SharedPref.getStrKey("res_Usercluster_id", "0"));
    res_Userregion_id = int.parse(await SharedPref.getStrKey("res_Userregion_id", "0"));
    res_Userdepartement_id = int.parse(await SharedPref.getStrKey("res_Userdepartement_id", "0"));
    res_Usersousprefecture_id = int.parse(await SharedPref.getStrKey("res_Usersousprefecture_id", "0"));
    res_Usercommune_id =  int.parse( await SharedPref.getStrKey("res_Usercommune_id", "0"));
    res_Userlocalite_id = int.parse(await SharedPref.getStrKey("res_Userlocalite_id", "0"));
    res_Userzonerecensement_id = int.parse(await SharedPref.getStrKey("res_Userzonerecensement_id", "0"));
    res_Userquartier_id = int.parse(await SharedPref.getStrKey("res_Userquartier_id", "0"));
    print("∆∆∆∆∆∆∆∆∆∆∆ OdooException ERROR LOGIN B");

    print('  >>>>>>>>> nombre_fiche_create: ${nombre_fiche_create}');
    nombre_fiche_create = int.parse(await SharedPref.getStrKey("nombre_fiche_create", "0"));
    print('  <<<<<<<<< nombre_fiche_create: ${nombre_fiche_create}');


    nombre_fiche_draft = int.parse(await SharedPref.getStrKey("nombre_fiche_draft", "0"));
    nombre_fiche_valid = int.parse(await SharedPref.getStrKey("nombre_fiche_valid", "0"));
    nombre_fiche_cancel = int.parse(await SharedPref.getStrKey("nombre_fiche_cancel", "0"));

    print("∆∆∆∆∆∆∆∆∆∆∆ OdooException ERROR LOGIN C");

    return false;



  }
  //*********************************************************
  //*********************************************************
  //*********************************************************
  //*********************************************************
  //*********************************************************

  static List<Ilot> Ilots = [];

  static Future<int?> getIlots(int ailot) async {
    String wUrl = "${UrlAPIV2}get_ilot?ilot=${ailot}";

    print("wUrlA $wUrl");

    var request = http.MultipartRequest('GET', Uri.parse(wUrl.toString()));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String wTmp = await response.stream.bytesToString();

      List<dynamic> items = json.decode(wTmp);
      if (items != null) {
        for (int i = 0; i < items.length; ++i) {
          var element = items[i];
          print(" ILOT ${element}");
          Ilot ilot = Ilot.fromJson(element);
          ilot.ilotid = ailot;
          Ilots.add(ilot);

          final db = await DbTools.database;
          await db.execute("Delete from Ilot");
          int? repid = await db.insert("Ilot", ilot.toMap());
          print(" ILOT repid ${repid}");
        }
        print("Ilots ${Ilots.length}");
        return Ilots.length;
      }
    } else {
      print(response.statusCode);
      print(response.reasonPhrase);
      print(response.headers);
      return 0;
    }
  }

  //*********************************************************
  //*********************************************************

  static Future<int?> getActivites_Ins(int ilot, int offset, int limit) async {
//    String wUrl = "${UrlAPI}get_activites_in_ilot&ilot=${ilot}&offset=$offset&limit=$limit";
    String wUrl = "${UrlAPIV2}get_activite_in_ilot?ilot=${ilot}&offset=$offset&limit=$limit";

    print("getActivites_Ins  $wUrl");

    var request = http.MultipartRequest('GET', Uri.parse(wUrl.toString()));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("response.statusCode ${response.statusCode}");
      String wTmp = await response.stream.bytesToString();
      wTmp = wTmp.replaceAll("N/A", "");

//            printWrapped("getActivites_Ins wTmp ${wTmp}");

      List<dynamic> items = json.decode(wTmp);
//      printWrapped("getlfEntreprenants items ${items}");
      if (items != null) {
        for (int i = 0; i < items.length; ++i) {
          var element = items[i];
          Activite_ins activite_ins = Activite_ins.fromJson(element);
          Ins_Activites.add(activite_ins);
        }

        print(" API Ins_Activites ${Ins_Activites.length}");
        return Ins_Activites.length;
      }
    } else {
      print(response.statusCode);
      print(response.reasonPhrase);
      print(response.headers);
      return 0;
    }
  }

  static Future<int?> ActivitesInsIntegration() async {
    print(" ActivitesInsIntegration ${Ins_Activites.length}");

    final db = await DbTools.database;
    var dbb = db.batch();

//    db.execute("DROP INDEX `PRIMARY` ON Activites;");

    bool Dbg = true;

    for (int i = 0; i < DbOdoo.Ins_Activites.length; ++i) {
      var element = DbOdoo.Ins_Activites[i];
      element.ACT_TRANSF_OK = 1;
      element.ACT_Id_Server = element.id;
      gColors.printWrapped(" entreprenantId  ${element.entreprenantId}");
      gColors.printWrapped(" Ins_Activites.toJson()  ${element.toJson()}");

      try {
        int? repid = await dbb.insert("Activites_Ins", element.toJson());
      } catch (e) {
        print("ERROR SQL INSERT $e");
      }
    }

    await dbb.commit(noResult: true);

    List<Activite_ins> lfActivite_ins;
    lfActivite_ins = await DbTools.getActivitesInsAll();

    if (Dbg) {
      for (int i = 0; i < lfActivite_ins.length; ++i) {
        print("======= $i ${lfActivite_ins[i].name} ${lfActivite_ins[i].telephoneFixe1Entreprise} ${lfActivite_ins[i].mobile}");
      }
    }

    return lfActivite_ins.length;
  }

  //*********************************************************

  static Future<String?> Activite_InsRef(int? uid) async {
    try {
      res_Activites = await client.callKw({
        'model': 'innoving.activite',
        'method': 'search_read',
        'args': [],
        'kwargs': {
          'context': {'bin_size': true},
          'fields': [
            'id',
            'name',
            'ref',
          ],
          ''
              'domain': [
            ['active', '=', 'true'],
            ['id', '=', uid]
          ],
          'order': 'id Asc',
        },
      });
      String? ref = "";
      var res_Activites_List = List.from(res_Activites);

      printWrapped("ActiviteRef $res_Activites_List");

      if (res_Activites_List.length == 1) ref = res_Activites_List[0]["ref"];

      return ref;
    } on OdooException catch (e) {
      print("ERROR ");
      print(e);

      return "";
    }
  }

  static Future<int> getErrEntreprenantId() async {
//    if (DbTools.gEntreprenant.Id_Tmp! < 0) return DbTools.gEntreprenant.id!;
    int maxId = 0;
    DbTools.glfEntreprenant.forEach((element) async {
      if (element.id! > maxId) maxId = element.id!;
    });
    maxId = maxId + 1;
    return maxId;
  }

  static Future<int> getErrActivite_insId() async {
    DbTools.gActivite_ins_Is_New = true;
    if (DbTools.gActivite_ins.Id_Tmp! < 0) return DbTools.gActivite_ins.id!;

    DbTools.gActivite_ins_Is_New = false;
    List<Activite_ins> lfActivite_ins = await DbTools.getActivitesInsAll();
    int minId = 0;
    lfActivite_ins.forEach((element) async {
      if (element.id! < minId) minId = element.id!;
    });
    minId = minId - 1;
    return minId;
  }

  static Future<int> Activite_insAdd() async {
    int activiteId = 0;
    var wArgs = DbTools.gActivite_ins.toArr();

    try {

      await DbOdoo.Debug_Data_insAdd("♦♦♦♦ INSERT ODOO ♦♦♦♦", "${wArgs}", "INSERT", "ACTIVITE");

      print("♦♦♦♦ INSERT ODOO ♦♦♦♦");
      print("♦♦♦♦♦♦♦♦ INSERT ODOO toArr ${wArgs} ");
      activiteId = await (client.callKw({
        'model': 'innoving.activite',
        'method': 'create',
        'args': [wArgs],
        'kwargs': {},
      }) as Future<dynamic>);

      await DbOdoo.Debug_Data_insAdd("♦♦♦♦ INSERT ODOO ♦♦♦♦", "OK ID = ${activiteId}", "INSERT", "ACTIVITE");

      print(' O D O O ');
      print('> INSERT ODOO OK ID = ${activiteId}');
      print(' O D O O ');
      await EntreprenantUpdIlot();
      await EntreprenantState(DbTools.gActivite_ins.state!);

      try {
        print("♦♦♦♦ DELETE SQL ♦♦♦♦");
        print("♦♦♦♦ DELETE ${DbTools.gActivite_ins.id!}");
        await DbTools.deleteActivite(DbTools.gActivite_ins.id!);
      } catch (e) {
        print("♦♦♦♦ ERROR DELETE");
        printWrapped(e.toString());
      }

      DbTools.gActivite_ins.id = activiteId;
      DbTools.gActivite_ins.Id_Tmp = activiteId;
      DbTools.gActivite_ins.ACT_Id_Server = activiteId;
      DbTools.gActivite_ins.ACT_TRANSF_OK = 1;

      try {
        final db = await DbTools.database;
        gColors.printWrapped(" insertActivite_ins toArrLocal ${DbTools.gActivite_ins.toArrLocal()}");
        int? repid = await db.insert("Activites_Ins", DbTools.gActivite_ins.toArr());
        print("insertActivite_ins repid ${repid}");
      } catch (e) {
        print("ERROR db.insert");
        gColors.printWrapped(e.toString());
      }

      return activiteId;
    } catch (e) {

      await DbOdoo.Debug_Data_insAdd("$wArgs", e.toString(), "INSERT", "ACTIVITE");


      print(' O D O O ');
      print('ERROR ODOO');
      printWrapped(e.toString());
      print('ERROR ODOO');
      print(' O D O O ');

      try {
        try {
          print("♦♦♦♦ DELETE SQL ♦♦♦♦");
          print("♦♦♦♦ DELETE ${DbTools.gActivite_ins.id!}");
          await DbTools.deleteActivite(DbTools.gActivite_ins.id!);
        } catch (e) {
          print("♦♦♦♦ ERROR DELETE");
          printWrapped(e.toString());
        }

        DbTools.gActivite_ins.id = activiteId;
        DbTools.gActivite_ins.Id_Tmp = activiteId;
        DbTools.gActivite_ins.ACT_Id_Server = -1;
        DbTools.gActivite_ins.ACT_TRANSF_OK = 0;

        try {
          final db = await DbTools.database;
          gColors.printWrapped(" insertActivite_ins toArrLocal ${DbTools.gActivite_ins.toArrLocal()}");
          int? repid = await db.insert("Activites_Ins", DbTools.gActivite_ins.toArrLocal());
          print("insertActivite_ins repid ${repid}");
        } catch (e) {
          print("ERROR db.insert");
          gColors.printWrapped(e.toString());
        }
      } catch (e) {
        print("ERROR db.insert");
        printWrapped(e.toString());
      }

      return -1;
    }
  }

//ContribuableAddUpd

  static Future<int> Activite_insUpd() async {
    int activiteId = 0;

    print("Activite_insUpd B ${DbTools.gActivite_ins.name}");

    DbTools.gActivite_ins.entreprenantId = DbTools.gEntreprenant.id;
    print("Activite_insUpd ${DbTools.gActivite_ins.name}");
    String? wCGA = DbTools.gActivite_ins.cga;

    var wArgs = DbTools.gActivite_ins.toArrUpd();
    try {
      printWrapped("≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈ Activite_insUpd updateActivite_ins ");
      await DbTools.updateActivite_ins(DbTools.gActivite_ins);
      printWrapped("≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈ Activite_insUpd update ${wArgs} ");

      await DbOdoo.Debug_Data_insAdd("♦♦♦♦ UPDATE ODOO ♦♦♦♦", "${wArgs}", "UPDATE", "ACTIVITE");


      print("♦♦♦♦ UPDATE ODOO ♦♦♦♦");
      print("♦♦♦♦♦♦♦♦ UPDATE ODOO toArrUpd ${wArgs} ");

      await client.callKw({
        'model': 'innoving.activite',
        'method': 'write',
        'args': [DbTools.gActivite_ins.id, wArgs],
        'kwargs': {},
      });

      await DbOdoo.Debug_Data_insAdd("♦♦♦♦ INSERT ODOO ♦♦♦♦", "OK ID = ${DbTools.gActivite_ins.id}", "UPDATE", "ACTIVITE");


      print(' O D O O ');
      printWrapped("> Activite_insUpd A ODOO OK");
      print(' O D O O ');

      await EntreprenantUpdIlot();
      await EntreprenantState(DbTools.gActivite_ins.state!);

      DbTools.gActivite_ins.ACT_TRANSF_OK = 1;
      DbTools.gActivite_ins_Is_New = false;
      printWrapped("≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈ Activite_insUpd B  DbTools.gActivite_ins_Is_New ${DbTools.gActivite_ins_Is_New}");
      await DbTools.insertUpdateActivite_ins(DbTools.gActivite_ins);
      printWrapped("≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈ Activite_insUpd C ");

      await DbTools.getActivitesInsAllTest();

      return activiteId;
    } catch (e) {

      await DbOdoo.Debug_Data_insAdd("$wArgs", e.toString(), "INSERT", "ACTIVITE");


      print("Activite write ERROR ODDO >>> Lenght ${e.toString().length}");
      printWrapped("ERROR ODDO : ${e.toString()}");
      print("Activite write ERROR ODDO <<<");

      try {
        int newErrActiviteId = await getErrActivite_insId();
        print("Activite write ERROR ODDO newErrActiviteId $newErrActiviteId");
        print("Activite write ERROR ODDO ACT_Id_Server ${DbTools.gActivite_ins.ACT_Id_Server}");



        //        DbTools.gActivite_ins.id = newErrActiviteId;
        DbTools.gActivite_ins.ACT_TRANSF_OK = 0;
        await DbTools.insertUpdateActivite_ins(DbTools.gActivite_ins);
      } catch (f) {
        print("ERROR db.insert");
        printWrapped(f.toString());
      }
      return -1;
    }
  }

  static Future<int> Activite_insAddUpd() async {
    print("♦♦♦♦ Activite_insAddUpd ${DbTools.gActivite_ins.ACT_Id_Server}");
    if (DbTools.gActivite_ins.resultatEntretien == null) DbTools.gActivite_ins.resultatEntretien = "";
    if (DbTools.gActivite_ins.statutEntreprise == "4") DbTools.gActivite_ins.statutEntreprise = "0";



    if (DbTools.gActivite_ins.ACT_Id_Server! <= 0) {
      print("♦♦♦♦ INSERT DANS LE SERVEUR ${DbTools.gActivite_ins.ACT_Id_Server}");
      await Activite_insAdd();
    } else {
      print("♦♦♦♦ UPDATE DANS LE SERVEUR ");
      await Activite_insUpd();
    }

    print("≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈ Call Colibri_Send");
    try {
      print("Colibri_Send  activite Photo jpeg ${DbTools.gActivite_ins.id!} ${DbTools.gActivite_ins.ImageBase64_PHOTO_ACT!}");
      if (DbTools.gActivite_ins.ImageBase64_PHOTO_ACT!.length > 0) {
        await API_Data.Colibri_Send("activite", DbTools.gActivite_ins.id!, "Photo", "jpeg", DbTools.gActivite_ins.ImageBase64_PHOTO_ACT!);
      }
    } catch (_) {
      print("ERROR Colibri_Send  activiteV2 Photo ${DbTools.gActivite_ins.id!}");
    }
    return 1;
  }

  //*********************************************************
  //*********************************************************
  //*********************************************************

  static List<Entreprenant> Ins_Entreprenants = [];

  static Future<int?> Entreprenants(int ilot, int offset, int limit) async {
//    String wUrl = "${UrlAPI}get_entreprenant_by_ilot&ilot=${ilot}&offset=$offset&limit=$limit";
    String wUrl = "${UrlAPIV2}get_entreprenant_by_ilot?ilot=${ilot}&offset=$offset&limit=$limit";

//    https: //cervo-ci.com/api/index.php?endpt=get_entreprenant_by_ilot&ilot=5169&offset=0&limit=500
    //  https: //cervo-ci.com/api/api/index.php?endpt=get_entreprenant_by_ilot&ilot=5169&offset=0&limit=500
    print("wUrlA $wUrl");
    var request = http.MultipartRequest('GET', Uri.parse(wUrl.toString()));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String wTmp = await response.stream.bytesToString();
      wTmp = wTmp.replaceAll("N/A", "");

      List<dynamic> items = json.decode(wTmp);
//      print("items ${items}");
      if (items != null) {
        for (int i = 0; i < items.length; ++i) {
          var element = items[i];
//          if (offset == 0 && i == 0) print("element id index 0 ${element['id']}");
          if (i == 0) print("element id index 0 ${element}");

          if (element['id'] == 568) print("element 568 $i ${element}");
          if (element['nomPrenomDirigeant'].toString().contains("Ted")) print("element TED $i ${element}");

          Entreprenant ins_Entreprenant = Entreprenant.fromJson(element);
          ins_Entreprenant.Id_Tmp = ins_Entreprenant.id;

          print("ins_Entreprenant ${ins_Entreprenant.name} ${ins_Entreprenant.telephoneDirigeant} ${element['telephone_dirigeant']}");

          Ins_Entreprenants.add(ins_Entreprenant);
        }
        print("ins_Entreprenant ${Ins_Entreprenants.length}");
        return Ins_Entreprenants.length;
      }
    } else {
      print(response.statusCode);
      print(response.reasonPhrase);
      print(response.headers);
      return 0;
    }
  }

  static Future<int?> Entreprenants_Sans_Activite(int ilot, int offset, int limit) async {
//    String wUrl = "${UrlAPI}get_etp_sans_activite&ilot=${ilot}&offset=$offset&limit=$limit";
    String wUrl = "${UrlAPIV2}get_entreprenant_sans_activite?ilot=${ilot}&offset=$offset&limit=$limit";

    //  https://cervo-ci.com/api/index.php?endpt=get_etp_sans_activite&ilot=5169
    print("wUrlA $wUrl");

    var request = http.MultipartRequest('GET', Uri.parse(wUrl.toString()));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String wTmp = await response.stream.bytesToString();
      printWrapped("response ${wTmp}");
      List<dynamic> items = json.decode(wTmp);
      print("NB items ${items.length}");
      print("items ${items}");
      if (items != null) {
        for (int i = 0; i < items.length; ++i) {
          var element = items[i];
          if (offset == 0 && i == 0) print("element ${element['id']}");

//          if (element['id'] == 564)
          {
            print("element ${element}");
            Entreprenant ins_Entreprenant = Entreprenant.fromJson(element);
            ins_Entreprenant.Id_Tmp = ins_Entreprenant.id;
            Ins_Entreprenants.add(ins_Entreprenant);
          }
        }
        print("ins_Entreprenant ${Ins_Entreprenants.length}");
        return Ins_Entreprenants.length;
      }
    } else {
      print(response.statusCode);
      print(response.reasonPhrase);
      print(response.headers);
      return 0;
    }
  }

  static Future<int?> EntreprenantsIntegration() async {
    final db = await DbTools.database;
    var dbb = db.batch();

    print(">>>>>>>>>>>>>>>>>>>>>>>>> EntreprenantsIntegration");

//    db.execute("DROP INDEX `PRIMARY` ON Contribuables;");

    bool Dbg = false;

    for (int i = 0; i < DbOdoo.Ins_Entreprenants.length; ++i) {
      var element = DbOdoo.Ins_Entreprenants[i];
      if (Dbg) print("element ${element}");

      element.ENT_Id_Server = element.id;
      print("element integration ${element.toJson()}");

      int? repid = await db.insert("Entreprenants", element.toJson());
      if (Dbg) print("repid ${repid}");
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

  //******************************************************
//******************************************************
//******************************************************

  static Future<int> EntreprenantAdd() async {
    int? Entreprenant_id = 0;
    int? Entreprenant_id_Tmp = 0;
    var wArgs = DbTools.gEntreprenant.toArrInsert();

    try {
      print("♦♦♦♦ INSERT ODOO ♦♦♦♦");
      print("♦♦♦♦♦♦♦♦ INSERT ODOO toArrInsert ${wArgs} ");

      await DbOdoo.Debug_Data_insAdd("♦♦♦♦ INSERT ODOO ♦♦♦♦", "${wArgs}", "INSERT", "Entreprenant");


      Entreprenant_id = await (client.callKw({
        'model': 'innoving.entreprenant',
        'method': 'create',
        'args': [wArgs],
        'kwargs': {},
      }) as Future<dynamic>);


      await DbOdoo.Debug_Data_insAdd("♦♦♦♦ INSERT ODOO ♦♦♦♦", "OK ID = ${Entreprenant_id}", "INSERT", "Entreprenant");


      print(' O D O O ');
      print('> INSERT ODOO OK ID = ${Entreprenant_id}');
      print(' O D O O ');

      try {
        print("♦♦♦♦ DELETE SQL ♦♦♦♦");
        print("♦♦♦♦ DELETE ${DbTools.gEntreprenant.id!}");
        await DbTools.deleteEntreprenant(DbTools.gEntreprenant.id!);
      } catch (e) {
        print("♦♦♦♦ ERROR DELETE");
        printWrapped(e.toString());
      }

      DbTools.gEntreprenant.id = Entreprenant_id;
      DbTools.gEntreprenant.Id_Tmp = Entreprenant_id;
      DbTools.gEntreprenant.ENT_Id_Server = Entreprenant_id;
      DbTools.gEntreprenant.ENT_TRANSF_OK = 1;

      try {
        final db = await DbTools.database;
        print("♦♦♦♦ INSERT SQL ♦♦♦♦");
        print("♦♦♦♦ DbTools.gEntreprenant.ImageBase64_PHOTO_ENTR  ${DbTools.gEntreprenant.ImageBase64_PHOTO_ENTR!.length}");
        printWrapped("♦♦♦♦ db.insert toJsonIMG ${DbTools.gEntreprenant.toJsonIMG()} ");
        int? repid = await db.insert("Entreprenants", DbTools.gEntreprenant.toJsonIMG());
        print("db.insert OK repid ${repid} ");
      } catch (e) {
        print("♦♦♦♦ ERROR INSERT");
        printWrapped(e.toString());
        return -1;
      }
      return 1;
    } catch (e) {

      await DbOdoo.Debug_Data_insAdd("$wArgs", e.toString(), "INSERT", "Entreprenant");


      print(' O D O O ');
      print('ERROR ODOO');
      printWrapped(e.toString());
      print('ERROR ODOO');
      print(' O D O O ');

      try {
        print("♦♦♦♦ DELETE SQL ♦♦♦♦");
        print("♦♦♦♦ DELETE ${DbTools.gEntreprenant.id!}");
        await DbTools.deleteEntreprenant(DbTools.gEntreprenant.id!);
      } catch (e) {
        print("♦♦♦♦ ERROR DELETE");
        printWrapped(e.toString());
      }

      int newErrEntreprenantId = await getErrEntreprenantId();
      DbTools.gEntreprenant.id = newErrEntreprenantId;
      DbTools.gEntreprenant.Id_Tmp = newErrEntreprenantId;
      DbTools.gEntreprenant.ENT_TRANSF_OK = 0;

      try {
        final db = await DbTools.database;
        print("♦♦♦♦ INSERT SQL ♦♦♦♦");
        print("♦♦♦♦ DbTools.gEntreprenant.ImageBase64_PHOTO_ENTR  ${DbTools.gEntreprenant.ImageBase64_PHOTO_ENTR!.length}");
        printWrapped("♦♦♦♦ db.insert toJsonIMG ${DbTools.gEntreprenant.toJsonIMG()} ");
        int? repid = await db.insert("Entreprenants", DbTools.gEntreprenant.toJsonIMG());
        print("db.insert OK repid ${repid} ");
      } catch (e) {
        print("♦♦♦♦ ERROR INSERT");
        printWrapped(e.toString());
        return -1;
      }

      return 1;
    }
    return -1;
  }

//******************************************************
//******************************************************
//******************************************************

  static Future<int> EntreprenantUpd() async {
    int? Entreprenant_id = 0;

    var wArgs = DbTools.gEntreprenant.toArrUpd();
    try {
      await DbTools.updateEntreprenant(DbTools.gEntreprenant);

      await DbOdoo.Debug_Data_insAdd("♦♦♦♦ UPDATE ODOO ♦♦♦♦", "${wArgs}", "UPDATE", "Entreprenant");

      print("♦♦♦♦ UPDATE ODOO ♦♦♦♦");
      print("♦♦♦♦♦♦♦♦ UPDATE ODOO toArrUpd ${wArgs} ");
      await client.callKw({
        'model': 'innoving.entreprenant',
        'method': 'write',
        'args': [DbTools.gEntreprenant.id, wArgs],
        'kwargs': {},
      });

      await DbOdoo.Debug_Data_insAdd("♦♦♦♦ UPDATE ODOO ♦♦♦♦", "OK ID = ${DbTools.gEntreprenant.id}", "UPDATE", "Entreprenant");

      print(' O D O O ');
      print('> UPDATE ODOO OK ID = ${Entreprenant_id}');
      print(' O D O O ');

      DbTools.gEntreprenant.ENT_TRANSF_OK = 1;
      DbTools.gEntreprenant.Id_Tmp = DbTools.gEntreprenant.id;
      await DbTools.updateEntreprenant(DbTools.gEntreprenant);
      await DbTools.gloadDataEntr();

      return 1;
    } catch (e) {

      await DbOdoo.Debug_Data_insAdd("$wArgs", e.toString(), "UPDATE", "Entreprenant");

      print(' O D O O ');
      print('ERROR ODOO');
      printWrapped(e.toString());
      print('ERROR ODOO');
      print(' O D O O ');
      try {
        int newErrEntreprenantId = await getErrEntreprenantId();
        print(" >>> ERROR ODDO newErrEntreprenantId $newErrEntreprenantId");
        DbTools.gEntreprenant.Id_Tmp = newErrEntreprenantId;
        DbTools.gEntreprenant.ENT_TRANSF_OK = 0;
        await DbTools.updateEntreprenant(DbTools.gEntreprenant);
        print(" <<< ERROR ODDO newErrEntreprenantId $newErrEntreprenantId");
        await DbTools.gloadDataEntr();
      } catch (e) {
        print("ERROR updateEntreprenant");
        printWrapped(e.toString());
      }
    }
    return -1;
  }

  static Future<int> EntreprenantUpdIlot() async {
    try {
      print(' EntreprenantUpdd ${DbTools.gEntreprenant.id}');
      await DbTools.updateEntreprenant(DbTools.gEntreprenant);

      var wArgs = DbTools.gEntreprenant.toArrIlot();
      print("≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈ EntreprenantUpd ODOO toArrUpd ${wArgs} ");

      print("write ${DbTools.gEntreprenant.id} ${DbTools.gEntreprenant.nomPrenomDirigeant} ${DbTools.gEntreprenant.state} ${DbTools.gEntreprenant.countryId}");
      await client.callKw({
        'model': 'innoving.entreprenant',
        'method': 'write',
        'args': [DbTools.gEntreprenant.id, wArgs],
        'kwargs': {},
      });

      print(' O D O O ');
      print("write ILOT OK");
      print(' O D O O ');

      return 1;
    } catch (e) {
      print(" ERROR ILOT ODDO");
    }
    return -1;
  }

  static Future<int> EntreprenantState(String wState) async {
    try {
      print(' EntreprenantState ${DbTools.gEntreprenant.id} wState');
      DbTools.gEntreprenant.state = wState;
      await DbTools.updateEntreprenant(DbTools.gEntreprenant);

      var wArgs = {
        'state': '${wState}',
      };

      print("≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈ EntreprenantState ODOO toArrUpd ${wArgs} ");

      print("write ${DbTools.gEntreprenant.id} ${DbTools.gEntreprenant.nomPrenomDirigeant} ${DbTools.gEntreprenant.state} ${DbTools.gEntreprenant.countryId}");
      await client.callKw({
        'model': 'innoving.entreprenant',
        'method': 'write',
        'args': [DbTools.gEntreprenant.id, wArgs],
        'kwargs': {},
      });

      print(' O D O O ');
      print("write STATE OK");
      print(' O D O O ');

      return 1;
    } catch (e) {
      print(" ERROR STATE ODDO");
    }
    return -1;
  }

  //******************************************************
  //******************************************************
  //******************************************************

  static Future<int> EntreprenantAddUpd() async {
    if (DbTools.gEntreprenant.state == "cancel") DbTools.gEntreprenant.state = "draft";
    if (DbTools.gEntreprenant.state == "") DbTools.gEntreprenant.state = "draft";
    print("♦♦♦♦ EntreprenantAddUpd ${DbTools.gEntreprenant.ENT_Id_Server}");

    int wRes = 0;

    if (DbTools.gEntreprenant.ENT_Id_Server! < 0) {
      // Creation d'un ENTR NOUVEAU (PAS DANS LE SERVEUR)
      print("♦♦♦♦ INSERT DANS LE SERVEUR ");
      wRes = await EntreprenantAdd();
    } else {
      print("♦♦♦♦ UPDATE DANS LE SERVEUR ");
      wRes = await EntreprenantUpd();
    }

    if (DbTools.gEntreprenant.ID3_templateBytes64 != "") {
      String templateBytes64 = DbTools.gEntreprenant.ID3_templateBytes64!;
      print("templateBytes64 ${DbTools.gEntreprenant.id!}  $templateBytes64");
      print("templateBytes64.length  ${templateBytes64.length}");
      try {
        await API_Data.Colibri_Send("entreprenant", DbTools.gEntreprenant.id!, "String_ID3", "txt", templateBytes64!);
      } catch (_) {
        print("ERROR Colibri_Send  String_ID3");
      }

      String croppedBytes64 = DbTools.gEntreprenant.ID3_croppedBytes64!;
      print("croppedBytes64  $croppedBytes64");
      print("croppedBytes64.length  ${croppedBytes64.length}");
      try {
        await API_Data.Colibri_Send("entreprenant", DbTools.gEntreprenant.id!, "Photo_ID3", "jpeg", croppedBytes64!);
      } catch (_) {
        print("ERROR Colibri_Send  Photo_ID3");
      }
    }

    if (DbTools.gEntreprenant.ImageBase64_PHOTO_ENTR != "") {
      try {
        await API_Data.Colibri_Send("entreprenant", DbTools.gEntreprenant.id!, "Photo", "jpeg", DbTools.gEntreprenant.ImageBase64_PHOTO_ENTR!);
      } catch (_) {
        print("ERROR Colibri_Send  Photo");
      }
    }

    return wRes;
  }

  //*********************************************************
  //*********************************************************
  //*********************************************************
  //*********************************************************
  //*********************************************************

  static List<Activite_ins> Ins_Activites = [];

  static Future<int?> getActivite_ins(int ilot, int offset, int limit) async {
//    String wUrl = "${UrlAPI}get_entreprenant_by_ilot&ilot=${ilot}&offset=$offset&limit=$limit";
    String wUrl = "${UrlAPIV2}get_entreprenant_by_ilot?ilot=${ilot}&offset=$offset&limit=$limit";
    //https://cervo-ci.com/api/index.php?endpt=get_entreprenant_by_ilot&ilot=5169

    print("wUrlA $wUrl");

    var request = http.MultipartRequest('GET', Uri.parse(wUrl.toString()));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      List<dynamic> items = json.decode(await response.stream.bytesToString());
//      print("items ${items}");
      if (items != null) {
        for (int i = 0; i < items.length; ++i) {
          var element = items[i];
          if (offset == 0 && i == 0) print("element ${element['id']}");

//          if (element['id'] == 564)
          {
//            print("element ${element}");
            Entreprenant ins_Entreprenant = Entreprenant.fromJson(element);
            ins_Entreprenant.Id_Tmp = ins_Entreprenant.id;
            Ins_Entreprenants.add(ins_Entreprenant);
          }
        }
        print("ins_Entreprenant ${Ins_Entreprenants.length}");
        return Ins_Entreprenants.length;
      }
    } else {
      print(response.statusCode);
      print(response.reasonPhrase);
      print(response.headers);
      return 0;
    }
  }

  //******************************

//******************************************************
  //******************************************************
  //******************************************************

  static void printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  //*************
  //*************
  //*************

  static Future<int?> Activites(int offset, int limit) async {
    //contribuable[1]: [{id: 37753, ref: C_SPY-041369/21, name: KASSY EHUI, telephone: 0707070707, adresse: abidjan, email: false, cni: false, image: false, contribuable_type_id: [1, PERSONNE PHYSIQUE], activite_ids: [38514], state: valid, user_id: [2, Administrateur], date_ajout: 2021-11-17 14:36:56, date_confirm: 2021-11-17, date_valid: 2021-11-17, creat_year: 2021, creat_month: 11, activity_number: 1, transaction_ids: [], activity_ids: [], message_follower_ids: [491970], message_ids: [1432865, 1432844, 1432841, 1432840], message_main_attachment_id: false, website_message_ids: [], access_token: false, create_uid: [2, Administrateur], create_date: 2021-11-17 14:36:56, write_uid: [2, Administrateur], write_date: 2021-11-17 14:47:30, amount_total: 264000.0, amount_paye: 0.0, activity_state: false, activity_user_id: false, activity_type_id: false, activity_date_deadline: false, activity_summary: false, message_is_follower: false, message_partner_ids: [3], message_channel_ids: [], message

    try {
      res_Activites = await client.callKw({
        'model': 'innoving.activite',
        'method': 'search_read',
        'args': [],
        'kwargs': {
          'context': {'bin_size': true},
          'fields': [
            'id',
            'name',
            'ref',
            'contribuable_id',
            'activite_type_id',
            'secteur_id',
            'zone_id',
            'period_id',
            'min_ca',
            'max_ca',
            'taille_activite',
            'street',
            'street2',
            'city',
            'email',
            'mobile',
            'phone',
            'pub_longueur',
            'pub_largeur',
            'pub_en_metre_carre',
            'pub_longueur_1',
            'pub_largeur_1',
            'pub_en_metre_carre_1',
            'longueur',
            'largeur',
            'odp',
            'baux_loyer',
            'marque',
            'immatriculation',
            'equipement',
            'type_vehicule',
            'partner_latitude',
            'partner_longitude',
            'type_taxe',
            'chiffre_affaire_taxable',
            'regime_fiscale',
            'paiement_prec',
            'activity_birthday',
            'id_unique',
            'ca_taxable',
            'amout_achat_annee_precedante',
            'amout_ventes',
            'amout_salaire_annuel',
            'amout_loyer_annuel',
            'amout_stock_marchandise',
            'amout_autre_charge',
            'nombre_employe',
            'nombre_vehicule',
            'cga',
            'date_adhesion',
            'ref_cga',
          ],
          'domain': [
            ['active', '=', 'true'],
            ['ref', '!=', 'null'],
          ],
          'order': 'id Asc',
          'offset': offset,
          'limit': limit,
        },
      });

//      var target_list_2 = List.from(res_Contribuables);
      print('${DateTime.now()} > Activites ${res_Activites.length}');

      return res_Activites.length;
    } on OdooException catch (e) {
      print("ERROR ");
      print(e);

      return -1;
    }
  }

  static Future<String?> ActiviteRef(int? uid) async {
    try {
      res_Activites = await client.callKw({
        'model': 'innoving.activite',
        'method': 'search_read',
        'args': [],
        'kwargs': {
          'context': {'bin_size': true},
          'fields': [
            'id',
            'name',
            'ref',
            'contribuable_id',
            'activite_type_id',
            'secteur_id',
            'zone_id',
            'period_id',
            'min_ca',
            'max_ca',
            'taille_activite',
            'street',
            'street2',
            'city',
            'email',
            'mobile',
            'phone',
            'pub_longueur',
            'pub_largeur',
            'pub_en_metre_carre',
            'pub_longueur_1',
            'pub_largeur_1',
            'pub_en_metre_carre_1',
            'longueur',
            'largeur',
            'odp',
            'baux_loyer',
            'marque',
            'immatriculation',
            'equipement',
            'type_vehicule',
            'partner_latitude',
            'partner_longitude',
            'type_taxe',
            'chiffre_affaire_taxable',
            'regime_fiscale',
            'paiement_prec',
            'activity_birthday',
            'id_unique',
            'ca_taxable',
            'amout_achat_annee_precedante',
            'amout_ventes',
            'amout_salaire_annuel',
            'amout_loyer_annuel',
            'amout_stock_marchandise',
            'amout_autre_charge',
            'nombre_employe',
            'nombre_vehicule',
            'cga',
            'date_adhesion',
            'ref_cga',
          ],
          ''
              'domain': [
            ['active', '=', 'true'],
            ['id', '=', uid]
          ],
          'order': 'id Asc',
        },
      });
      String? ref = "";
      var res_Activites_List = List.from(res_Activites);

      printWrapped("ActiviteRef $res_Activites_List");

      if (res_Activites_List.length == 1) ref = res_Activites_List[0]["ref"];

      return ref;
    } on OdooException catch (e) {
      print("ERROR ");
      print(e);

      return "";
    }
  }

  //******************************************************
//******************************************************
//******************************************************

//***************************
//***************************
//***************************

  static Future<int?> Fournisseurs(int offset, int limit) async {
    //contribuable[1]: [{id: 37753, ref: C_SPY-041369/21, name: KASSY EHUI, telephone: 0707070707, adresse: abidjan, email: false, cni: false, image: false, contribuable_type_id: [1, PERSONNE PHYSIQUE], secteur_ids: [38514], state: valid, user_id: [2, Administrateur], date_ajout: 2021-11-17 14:36:56, date_confirm: 2021-11-17, date_valid: 2021-11-17, creat_year: 2021, creat_month: 11, activity_number: 1, transaction_ids: [], activity_ids: [], message_follower_ids: [491970], message_ids: [1432865, 1432844, 1432841, 1432840], message_main_attachment_id: false, website_message_ids: [], access_token: false, create_uid: [2, Administrateur], create_date: 2021-11-17 14:36:56, write_uid: [2, Administrateur], write_date: 2021-11-17 14:47:30, amount_total: 264000.0, amount_paye: 0.0, activity_state: false, activity_user_id: false, activity_type_id: false, activity_date_deadline: false, activity_summary: false, message_is_follower: false, message_partner_ids: [3], message_channel_ids: [], message

    try {
      res_Fournisseurs = await client.callKw({
        'model': 'colibri.fournisseur',
        'method': 'search_read',
        'args': [],
        'kwargs': {
          'context': {'bin_size': true},
          'fields': ['id', 'activite_id', 'code', 'name', 'ncc', 'nature_achat', 'amount'],
          'domain': [],
          'offset': offset,
          'limit': limit,
        },
      });

//      var target_list_2 = List.from(res_Contribuables);
      print('${DateTime.now()} > Fournisseurs[${res_Fournisseurs.length}');

      return res_Fournisseurs.length;
    } on OdooException catch (e) {
      print("ERROR ");
      print(e);

      return -1;
    }
  }

  static Future<int?> FournisseursIntegration() async {
    var res_Fournisseurs_List = List.from(res_Fournisseurs);

    print("Fournisseurs ${res_Fournisseurs_List.length}");

    final db = await DbTools.database;
    var dbb = db.batch();

    bool Dbg = false;

    int iid = 0;
    res_Fournisseurs_List.forEach((element) async {
      if (Dbg) print("element ${element}");
      var tactivite_id = "${element["activite_id"]}";

      if (tactivite_id != "false") {
        int? wactivite_id = 0;
        if (tactivite_id != "false") {
          wactivite_id = element["activite_id"][0];
        }

        int? wamount = 0;
        var tamount = "${element["amount"]}";
        if (tamount != "false") {
          double damount = double.parse("${element["amount"]}");
          wamount = damount.toInt();
        }

        var FournisseurData = Fournisseur(
          fournisseurid: element["id"],
          fournisseur_activiteId: wactivite_id,
          fournisseur_code: element["code"],
          fournisseur_name: element["name"],
          fournisseur_ncc: element["ncc"],
          fournisseur_nature: element["nature_achat"],
          fournisseur_mt1: wamount,
        );
        int? repid = await dbb.insert("Fournisseurs", FournisseurData.toMap());
      }
    });

    await dbb.commit(noResult: true);

/*
  List<Fournisseur> lfFournisseur;
  lfFournisseur = await DbTools.getFournisseursSansTri();

  for (int i = 0; i < lfFournisseur.length; ++i) {
      print(
          "======= $i ${lfFournisseur[i]
              .fournisseur_name} ***** ${res_Fournisseurs_List[i]["name"]}");
    }
*/

    return res_Fournisseurs.length;
  }

//***************************
  //***************************
  //***************************

  static Future<int?> Secteurs(int offset, int limit) async {
    //contribuable[1]: [{id: 37753, ref: C_SPY-041369/21, name: KASSY EHUI, telephone: 0707070707, adresse: abidjan, email: false, cni: false, image: false, contribuable_type_id: [1, PERSONNE PHYSIQUE], secteur_ids: [38514], state: valid, user_id: [2, Administrateur], date_ajout: 2021-11-17 14:36:56, date_confirm: 2021-11-17, date_valid: 2021-11-17, creat_year: 2021, creat_month: 11, activity_number: 1, transaction_ids: [], activity_ids: [], message_follower_ids: [491970], message_ids: [1432865, 1432844, 1432841, 1432840], message_main_attachment_id: false, website_message_ids: [], access_token: false, create_uid: [2, Administrateur], create_date: 2021-11-17 14:36:56, write_uid: [2, Administrateur], write_date: 2021-11-17 14:47:30, amount_total: 264000.0, amount_paye: 0.0, activity_state: false, activity_user_id: false, activity_type_id: false, activity_date_deadline: false, activity_summary: false, message_is_follower: false, message_partner_ids: [3], message_channel_ids: [], message

    try {
      res_Secteurs = await client.callKw({
        'model': 'innoving.secteur.activite',
        'method': 'search_read',
        'args': [],
        'kwargs': {
          'context': {'bin_size': true},
          'fields': ['id', 'name', 'forme_activite', 'type_activite'],
          'domain': [],
          'offset': offset,
          'limit': limit,
        },
      });

//      var target_list_2 = List.from(res_Contribuables);
      print('${DateTime.now()} > Secteurs[${res_Secteurs.length}');

      return res_Secteurs.length;
    } on OdooException catch (e) {
      print("ERROR ");
      print(e);

      return -1;
    }
  }

  static Future<int?> SecteursIntegration() async {
    var res_Secteurs_List = List.from(res_Secteurs);

    print("Secteurs ${res_Secteurs_List.length}");

    final db = await DbTools.database;
    var dbb = db.batch();

    bool Dbg = true;

    int iid = 0;
    res_Secteurs_List.forEach((element) async {
      // if (Dbg) print("res_Secteurs_List element ${element}");

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
      int? repid = await dbb.insert("Secteurs", SecteurData.toMap());
    });

    await dbb.commit(noResult: true);

    List<Secteur> lfSecteur;
    lfSecteur = await DbTools.getSecteursSansTri();

    /*  if (Dbg) {
      for (int i = 0; i < lfSecteur.length; ++i) {
        if (lfSecteur[i].secteur_name != res_Secteurs_List[i]["name"]) {
          print(">>>>>>> $i ${lfSecteur[i].secteur_name} ***** ${res_Secteurs_List[i]["name"]}");
        } else
          print("======= $i ${lfSecteur[i].secteur_name} ***** ${res_Secteurs_List[i]["name"]}");
      }
    }
*/
    return res_Secteurs.length;
  }

  //***************************
  //***************************
  //***************************

  static Future<int?> Zones(int offset, int limit) async {
    //contribuable[1]: [{id: 37753, ref: C_SPY-041369/21, name: KASSY EHUI, telephone: 0707070707, adresse: abidjan, email: false, cni: false, image: false, contribuable_type_id: [1, PERSONNE PHYSIQUE], zone_ids: [38514], state: valid, user_id: [2, Administrateur], date_ajout: 2021-11-17 14:36:56, date_confirm: 2021-11-17, date_valid: 2021-11-17, creat_year: 2021, creat_month: 11, activity_number: 1, transaction_ids: [], activity_ids: [], message_follower_ids: [491970], message_ids: [1432865, 1432844, 1432841, 1432840], message_main_attachment_id: false, website_message_ids: [], access_token: false, create_uid: [2, Administrateur], create_date: 2021-11-17 14:36:56, write_uid: [2, Administrateur], write_date: 2021-11-17 14:47:30, amount_total: 264000.0, amount_paye: 0.0, activity_state: false, activity_user_id: false, activity_type_id: false, activity_date_deadline: false, activity_summary: false, message_is_follower: false, message_partner_ids: [3], message_channel_ids: [], message

    try {
      res_Zones = await client.callKw({
        'model': 'colibri.zone',
        'method': 'search_read',
        'args': [],
        'kwargs': {
          'context': {'bin_size': true},
          'fields': ['id', 'name'],
          'domain': [],
          'offset': offset,
          'limit': limit,
        },
      });

//      var target_list_2 = List.from(res_Contribuables);
      print('${DateTime.now()} > Zones[${res_Zones.length}');

      return res_Zones.length;
    } on OdooException catch (e) {
      print("ERROR ");
      print(e);

      return -1;
    }
  }

  static Future<int?> ZonesIntegration() async {
    var res_Zones_List = List.from(res_Zones);

    print("Zones ${res_Zones_List.length}");

    final db = await DbTools.database;
    var dbb = db.batch();

    bool Dbg = false;

    int iid = 0;
    res_Zones_List.forEach((element) async {
      if (Dbg) print("element ${element}");
      var ZoneData = Zone(
        zoneid: element["id"],
        zone_name: "${element["name"]}",
      );
      int? repid = await dbb.insert("Zones", ZoneData.toMap());
    });

    await dbb.commit(noResult: true);

    List<Zone> lfZone;
    lfZone = await DbTools.getZonesSansTri();

    if (Dbg) {
      for (int i = 0; i < lfZone.length; ++i) {
        if (lfZone[i].zone_name != res_Zones_List[i]["name"]) {
          print(">>>>>>> $i ${lfZone[i].zone_name} ***** ${res_Zones_List[i]["name"]}");
        } else
          print("======= $i ${lfZone[i].zone_name} ***** ${res_Zones_List[i]["name"]}");
      }
    }

    return res_Zones.length;
  }

  //***************************
  //***************************
  //***************************

  static Future<int?> Svas(int offset, int limit) async {
    //contribuable[1]: [{id: 37753, ref: C_SPY-041369/21, name: KASSY EHUI, telephone: 0707070707, adresse: abidjan, email: false, cni: false, image: false, contribuable_type_id: [1, PERSONNE PHYSIQUE], sva_ids: [38514], state: valid, user_id: [2, Administrateur], date_ajout: 2021-11-17 14:36:56, date_confirm: 2021-11-17, date_valid: 2021-11-17, creat_year: 2021, creat_month: 11, activity_number: 1, transaction_ids: [], activity_ids: [], message_follower_ids: [491970], message_ids: [1432865, 1432844, 1432841, 1432840], message_main_attachment_id: false, website_message_ids: [], access_token: false, create_uid: [2, Administrateur], create_date: 2021-11-17 14:36:56, write_uid: [2, Administrateur], write_date: 2021-11-17 14:47:30, amount_total: 264000.0, amount_paye: 0.0, activity_state: false, activity_user_id: false, activity_type_id: false, activity_date_deadline: false, activity_summary: false, message_is_follower: false, message_partner_ids: [3], message_channel_ids: [], message

    try {
      res_Svas = await client.callKw({
        'model': 'colibri.sav',
        'method': 'search_read',
        'args': [],
        'kwargs': {
          'context': {'bin_size': true},
          'fields': ['id', 'name', 'code'],
          'domain': [],
          'offset': offset,
          'limit': limit,
        },
      });

//      var target_list_2 = List.from(res_Contribuables);
      print('${DateTime.now()} > Svas[${res_Svas.length}');

      return res_Svas.length;
    } on OdooException catch (e) {
      print("ERROR ");
      print(e);

      return -1;
    }
  }

  static Future<int?> SvasIntegration() async {
    var res_Svas_List = List.from(res_Svas);

    print("Svas ${res_Svas_List.length}");

    final db = await DbTools.database;
    var dbb = db.batch();

    bool Dbg = false;

    int iid = 0;
    res_Svas_List.forEach((element) async {
      if (Dbg) print("element ${element}");

      String wCode = "";
      if (element["code"] != "false") wCode = element["code"].toString();

      var SvaData = Sva(
        svaid: element["id"],
        sva_name: "${element["name"]}",
        sva_code: "${wCode}",
      );

      if (Dbg) print("SvaData ${SvaData.sva_name} ${SvaData.sva_code}");
      if (Dbg) print("SvaData ${SvaData.toMap().toString()}");

      int? repid = await dbb.insert("Svas", SvaData.toMap());
    });

    await dbb.commit(noResult: true);

    List<Sva> lfSva;
    lfSva = await DbTools.getSvasSansTri();

    if (Dbg) {
      for (int i = 0; i < lfSva.length; ++i) {
        if (lfSva[i].sva_name != res_Svas_List[i]["name"]) {
          print(">>>>>>> $i ${lfSva[i].sva_code} ***** ${res_Svas_List[i]["code"]}");
        } else
          print("======= $i ${lfSva[i].sva_code} ***** ${res_Svas_List[i]["code"]}");
      }
    }

    return res_Svas.length;
  }

//*****************************
//*****************************
//*****************************
//*****************************

  static Future<int?> Countrys(int offset, int limit) async {
    //contribuable[1]: [{id: 37753, ref: C_SPY-041369/21, name: KASSY EHUI, telephone: 0707070707, adresse: abidjan, email: false, cni: false, image: false, contribuable_type_id: [1, PERSONNE PHYSIQUE], Country_ids: [38514], state: valid, user_id: [2, Administrateur], date_ajout: 2021-11-17 14:36:56, date_confirm: 2021-11-17, date_valid: 2021-11-17, creat_year: 2021, creat_month: 11, activity_number: 1, transaction_ids: [], activity_ids: [], message_follower_ids: [491970], message_ids: [1432865, 1432844, 1432841, 1432840], message_main_attachment_id: false, website_message_ids: [], access_token: false, create_uid: [2, Administrateur], create_date: 2021-11-17 14:36:56, write_uid: [2, Administrateur], write_date: 2021-11-17 14:47:30, amount_total: 264000.0, amount_paye: 0.0, activity_state: false, activity_user_id: false, activity_type_id: false, activity_date_deadline: false, activity_summary: false, message_is_follower: false, message_partner_ids: [3], message_channel_ids: [], message

    try {
      res_Countrys = await client.callKw({
        'model': 'res.country',
        'method': 'search_read',
        'args': [],
        'kwargs': {
          'context': {'bin_size': true},
          'fields': ['id', 'name', 'code'],
          'domain': [],
          'offset': offset,
          'limit': limit,
        },
      });

//      var target_list_2 = List.from(res_Contribuables);
      print('${DateTime.now()} > Countrys[${res_Countrys.length}');

      return res_Countrys.length;
    } on OdooException catch (e) {
      print("ERROR ");
      print(e);

      return -1;
    }
  }

  static Future<int?> CountrysIntegration() async {
    var res_Countrys_List = List.from(res_Countrys);

    print("Countrys ${res_Countrys_List.length}");

    final db = await DbTools.database;
    var dbb = db.batch();

    bool Dbg = false;

    int iid = 0;
    res_Countrys_List.forEach((element) async {
      if (Dbg) print("element ${element}");
      var CountryData = Country(
        Countryid: element["id"],
        Country_name: "${element["name"]}",
        Country_code: "${element["code"]}",
      );
      int? repid = await dbb.insert("Countrys", CountryData.toMap());
    });

    await dbb.commit(noResult: true);

    List<Country> lfCountry;
    lfCountry = await DbTools.getCountrys();

    if (Dbg) {
      for (int i = 0; i < lfCountry.length; ++i) {
        if (lfCountry[i].Country_name != res_Countrys_List[i]["name"]) {
          print(">>>>>>> $i ${lfCountry[i].Country_name} ***** ${res_Countrys_List[i]["name"]}");
        } else
          print("======= $i ${lfCountry[i].Country_name} ***** ${res_Countrys_List[i]["name"]}");
      }
    }

    return res_Countrys.length;
  }
}
