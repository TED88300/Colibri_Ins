import "dart:async";
import 'dart:convert';

import "package:colibri/Tools/DbData.dart";
import 'package:colibri/Tools/DbOdoo.dart';
import 'package:colibri/Tools/Ilot.dart';
import 'package:colibri/Tools/Ins_Activite.dart';
import 'package:colibri/Tools/Ins_Entreprenant.dart';
import 'package:colibri/Tools/gColors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:package_info/package_info.dart';
import "package:path/path.dart";
import "package:sqflite/sqflite.dart";


class DbTools {
  DbTools();

  static bool EdtTicket = false;

  static bool gDev = false;
  static bool gTED = gDev;
  static bool gEMULATEUR =  false; //gDev;

  static bool gIsRememberLogin = true;
  static bool gIsRememberLoginOffLine = false;

  static int gCurrentIndex = 2;
  static int gCurrentIndexVP = 2;
  static var database;

  static bool gID3_OK = false;

  static bool isUpdate = false;
  static bool gLoadData = true;
  static var gVersion = "v1.1";
  static var gCurrentModeStr = "Collecte";
  static var gCollecteur = "KONAN YAO HUBERT";

  static var gUsername = "";
  static var gPassword = "";

  static late Entreprenant gEntreprenant;
  static late Activite_ins gActivite_ins;
  static late List<Taxe> lTaxe;
  static late List<TaxeHisto> lTaxeHisto;

  static int taxe_Annuelle = 176;
  static int taxe_2021 = 176;
  static int taxe_Du = 110;
  static int taxe_Paye = 42;
  static int taxe_Solde1 = 0;
  static int taxe_Solde2 = 0;
  static int taxe_Payement = 0;
  static int taxe_Solde1_Month = 0;
  static var gTaxeMonth = [];
  static var gTaxeMonthLabel = [];
  static var gTaxeMonthDet = [];
  static var gTaxeMonthDet2 = [];
  static late var gImageBase64_PHOTO_ACT = "";

  static var strEntr = "KYC";
  static var pagesEntr = 0;
  static var pageEntr = 0;

  static var strKYB = "KYB";
  static var pagesKYB = 0;
  static var pageKYB = 0;
  static bool isFORMEL = true;
  static bool allowWriteFile = false;

  static late Function gI_Liste_EntreprenantsState_callback;
  static late Function gI_Liste_BrouillonsState_callback;
  static late Function gI_Liste_RejeteesState_callback;
  static String TraceDbg  = "> TraceDbg";

  void printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  static PackageInfo packageInfo = PackageInfo(
    appName: '',
    packageName: '',
    version: '',
    buildNumber: '',
  );

  static String LibVehicule(String? VehSrv) {
    switch (VehSrv) {
      case ("flotte bache"):
        {
          return "Baché";
        }
      case ("flotte camion"):
        {
          return "Camion";
        }
      case ("flotte camionnette"):
        {
          return "Camionnete";
        }
      case ("flotte car"):
        {
          return "Car";
        }
      case ("flotte citerne"):
        {
          return "Citerne";
        }
      case ("flotte fourgonnette"):
        {
          return "Fougonnette";
        }
      case ("flotte kya"):
        {
          return "Kya";
        }
      case ("flotte mini car"):
        {
          return "Mini Car";
        }
      case ("flotte plateau"):
        {
          return "Plateau";
        }
      case ("flotte remorque"):
        {
          return "Remorque";
        }
      case ("flotte taxi"):
        {
          return "taxi";
        }
      case ("flotte tracteur"):
        {
          return "Tracteur";
        }
      default:
        return "Baché";
    }
  }

  static String GetVehicule(String? VehSrv) {
    switch (VehSrv) {
      case ("Baché"):
        {
          return "flotte bache";
        }
      case ("Camion"):
        {
          return "flotte camion";
        }
      case ("Camionnete"):
        {
          return "flotte camionnette";
        }
      case ("Car"):
        {
          return "flotte car";
        }
      case ("Citerne"):
        {
          return "flotte citerne";
        }
      case ("Fougonnette"):
        {
          return "flotte fourgonnette";
        }
      case ("Kya"):
        {
          return "flotte kya";
        }
      case ("Mini Car"):
        {
          return "flotte mini car";
        }
      case ("Plateau"):
        {
          return "flotte plateau";
        }
      case ("Remorque"):
        {
          return "flotte remorque";
        }
      case ("taxi"):
        {
          return "flotte taxi";
        }
      case ("Tracteur"):
        {
          return "flotte tracteur";
        }
      default:
        return "flotte bache";
    }
  }


  static Future initSqlite() async {
    var wgetDatabasesPath = await getDatabasesPath();
    print("getDatabasesPath() $wgetDatabasesPath");
    database = openDatabase(
      join(await getDatabasesPath(), "22chs34eameNS.db"),
      onCreate: (db, version) async{
        print("onCreate $version");

        await db.execute(
          "CREATE TABLE Ilot(ilotid INTEGER , ilotName TEXT,clusterName TEXT,regionName TEXT,departementName TEXT,sousPrefectureName TEXT,zoneRecensementName TEXT,communeName TEXT,localiteName TEXT,quartierName TEXT)"
        );


        String wTmp =  "CREATE TABLE IF NOT EXISTS "
            "Activites_Ins(id INTEGER PRIMARY KEY,name TEXT,company_id,create_date TEXT,display_name TEXT,date date,title INTEGER,ref TEXT,lang TEXT,tz TEXT,"
            "user_id INTEGER,vat TEXT,website TEXT,comment TEXT,barcode TEXT,active BOOL,street TEXT,"
            "street2 TEXT,zip TEXT,city TEXT,state_id INTEGER,country_id INTEGER,email TEXT,mobile TEXT,create_uid INTEGER,write_uid INTEGER,write_date TEXT,message_main_attachment_id INTEGER,"
            "entreprenant_id INTEGER,INTEGER,activity_birthday TEXT,regime_fiscale TEXT,chiffre_affaire_taxable TEXT,min_ca TEXT,max_ca TEXT,"
            "secteur_id INTEGER,type_taxe TEXT,cga TEXT,date_adhesion TEXT,ref_cga TEXT,periode_imposition TEXT,taux_imposition DOUBLE,taille_activite TEXT,"
            "ciap TEXT,longueur DOUBLE,largeur DOUBLE,odp DOUBLE,baux_loyer TEXT,pub_longueur DOUBLE,pub_largeur DOUBLE,pub_en_mettre_carre DOUBLE,pub_longueur_2 DOUBLE,pub_largeur_2 DOUBLE,surface_local_en_mettre_carre DOUBLE,"
            "pub_en_mettre_carre_2 DOUBLE,partner_latitude TEXT,partner_longitude TEXT,autre_type_activite TEXT,"
            "activicte_2 INTEGER,etat_activite TEXT,forme_juridique TEXT,autre_forme_juridique TEXT,capital_en_action TEXT,"
            "ca_ht_n_1 DOUBLE,ca_ht_n_2 DOUBLE,ca_ht_n_3 DOUBLE, manque_personnel_qualifie TEXT,"
            "cout_eleve_main_oeuvre TEXT,formalite_administrative_contraignante TEXT,taxe_impot_eleve TEXT,cout_tranport_eleve TEXT,mauvais_etat_infrastructure TEXT,difficulte_approvisionnement_matiere_premiere TEXT,"
            "procedure_contentieux TEXT,ecoulement_production TEXT,acces_au_technologie TEXT,manque_machine TEXT,manque_expertise_technique TEXT,"
            "manque_local_adapte TEXT,acces_commande_public TEXT,acces_structure_appui TEXT,acces_credit_bancaire TEXT,approvisionnement_energie TEXT,concurrence_deloyale TEXT,corruption TEXT,"
            "autre_contrainte TEXT,precise_contrainte TEXT,aucune_contrainte TEXT,autre_activte TEXT,autre_activite_precision TEXT,"
            "code_ciap TEXT,connexion_internet TEXT,declaration_cnps TEXT,designation_activite TEXT,"
            "doc_fin_exercice TEXT,effectif_nationaux_femme_permanent INTEGER,"
            "effectif_nationaux_femme_temporaire INTEGER,effectif_nationaux_homme_permanent INTEGER,effectif_nationaux_homme_temporaire INTEGER,"
            "effectif_non_nationaux_femme INTEGER,effectif_non_nationaux_femme_permanent INTEGER,effectif_non_nationaux_femme_temporaire INTEGER,"
            "effectif_non_nationaux_homme INTEGER,effectif_non_nationaux_homme_permanent INTEGER,effectif_non_nationaux_homme_temporaire INTEGER,effectif_total INTEGER,"
            "effectif_total_femme INTEGER,effectif_total_homme INTEGER,effectif_total_nationaux_femme INTEGER,effectif_total_nationaux_homme INTEGER,"
            "etat_fonctionnement_entreprise TEXT,"
            "name_activite_secondaire TEXT,nombre_etablissement TEXT,num_compte_contribuable TEXT,num_registre_commerce TEXT,"
            "numero_cnps INTEGER,numero_cnps_communicable TEXT,periodicite TEXT,"
            "statut_comptabilite_formel TEXT,statut_compte_contribuable TEXT,statut_entreprise TEXT,statut_registre_commerce TEXT,type_entreprise TEXT,"
            "zone_id INTEGER,localite_id INTEGER,quartier_id INTEGER,ilot_id INTEGER,zone TEXT,date_debut_exploitation date,"
            "activicte_principal TEXT,gps_precision TEXT,service_en_ligne TEXT,has_activicte_secondaire TEXT,"
            "raison_social TEXT,adresse_geographique_entreprise TEXT,observation TEXT,sigle_entreprise TEXT,telephone_fixe_1_entreprise TEXT,telephone_fixe_2_entreprise TEXT,"
            "telephone_portable_1_entreprise TEXT,telephone_portable_2_entreprise TEXT,email_entreprise TEXT,site_web_entreprise TEXT,"
            "boite_postale_entreprise TEXT,type_activite TEXT,cluster_id INTEGER,region_id INTEGER,departement_id INTEGER,sousprefecture_id INTEGER,"
            "commune_id INTEGER,addresse_geo_1 TEXT,addresse_geo_2 TEXT,activite_type_id integer,ACT_TRANSF_OK integer,Id_Tmp integer,  "
            "autre_activite_secondaire TEXT, type_activite_formel_informel TEXT, zone_implantation_entreprise TEXT,"
            " libelle_zone_implantation_entreprise TEXT, numero_batiment TEXT, numero_sequence_batiment_entreprise TEXT, ImageBase64_PHOTO_ACT TEXT , state TEXT "
            ", date_fin_entretien TEXT, resultat_entretien TEXT, nombre_visite TEXT, observation_enquete TEXT,  is_activity INTEGER ,  ACT_Id_Server INTEGER     )";


        await db.execute(
          wTmp,
        );


        print("CREATE");
        print("CREATE");
        print("CREATE");
        print("CREATE");
        print("CREATE");
        print("CREATE");
        print("CREATE");
        print("CREATE");
        print("CREATE");



        await db.execute("CREATE TABLE IF NOT EXISTS  Entreprenants(id INTEGER,ENT_Id_Server INTEGER, active BOOL,code TEXT,userId INTEGER,ref TEXT,"
            "email TEXT,naturePiece TEXT,cni TEXT,state TEXT,activityNumber INTEGER,amountTotal DOUBLE,amountPaye DOUBLE,sexe TEXT,birthday TEXT,"
            "lieu_naissance TEXT,countryId INTEGER,communeIdentification TEXT,profession TEXT,"
            "rccm TEXT,terminal TEXT,dateValiditePiece TEXT,milieuImplantation TEXT,districtId INTEGER,"
            "nomRepondant TEXT,fonctionRepondant TEXT,contact1Repondant TEXT,contact2Repondant TEXT,emailRepondant TEXT,nomPrenomDirigeant TEXT,"
            "emailDirigeant TEXT,name TEXT,telephoneDirigeant TEXT,adresseDirigeant TEXT,qualiteDirigeant TEXT, autreQualite TEXT,clusterId INTEGER,"
            "regionId INTEGER,departementId INTEGER,sousprefectureId INTEGER,communeId INTEGER,localiteId INTEGER,zonerecensementId INTEGER,"
            "quartierId INTEGER, base64Encode TEXT, templateBytes TEXT, ENT_TRANSF_OK INTEGER, Id_Tmp INTEGER, autre_fonction_repondant TEXT, "
            "telephone_dirigeant_whatsapp TEXT, ImageBase64_PHOTO_ENTR TEXT, ID3_templateBytes64 TEXT, ID3_croppedBytes64 TEXT)");

        await db.execute(
          "CREATE TABLE Taxes(taxeId INTEGER PRIMARY KEY, taxe_activiteId INTEGER,  taxe_name TEXT, taxe_mt INTEGER)",
        );
        await db.execute(
          "CREATE TABLE TaxeHistos(taxehistoId INTEGER PRIMARY KEY, taxehisto_activiteId INTEGER, taxehisto_month TEXT, taxe_month INTEGER,  taxehisto_mt1 INTEGER, taxehisto_mt2 INTEGER, taxehisto_mt3 INTEGER, taxehisto_mt4 INTEGER, taxehisto_mt5 INTEGER,  taxehisto_mt1s TEXT, taxehisto_mt2s TEXT, taxehisto_mt3s TEXT, taxehisto_mt4s TEXT, taxehisto_mt5s TEXT)",
        );
        await db.execute(
          "CREATE TABLE Fournisseurs(fournisseurid INTEGER PRIMARY KEY, "
          "fournisseur_activiteId INTEGER, "
          "fournisseur_code TEXT, "
          "fournisseur_name TEXT, "
          "fournisseur_ncc TEXT, "
          "fournisseur_nature TEXT, "
          "fournisseur_mt1 INTEGER "
          ")",
        );

        await db.execute(
          "CREATE TABLE Secteurs(secteurid INTEGER PRIMARY KEY, secteur_name TEXT, secteur_forme TEXT, type_activite TEXT)",
        );

        await db.execute(
          "CREATE TABLE Zones(zoneid INTEGER PRIMARY KEY, zone_name TEXT)",
        );
        await db.execute(
          "CREATE TABLE Svas(svaid INTEGER PRIMARY KEY, sva_name TEXT, sva_code TEXT)",
        );




        await db.execute(
          "CREATE TABLE Countrys(Countryid INTEGER PRIMARY KEY, Country_name TEXT, Country_code TEXT)",
        );



      },


      onUpgrade: (db, oldVersion, newVersion) {
        print("onUpgrade $oldVersion $newVersion");


        //       if (newVersion == 2) {db.execute("ALTER TABLE Activites ADD COLUMN activite_type_taxe TEXT");}
      },
      onOpen: (db) async {
/*
        final tables = await db.rawQuery('SELECT * FROM sqlite_master ORDER BY name;');
        print("-------------------> onOpen Liste des table ${tables.length}");
        tables.forEach((element) {
          print("-------------------> tables ${element}");
        });
*/
      },
      version: 1,
    );

    try
    {
      final db = await database;
      await db.execute(
        "CREATE TABLE Countrys(Countryid INTEGER PRIMARY KEY, Country_name TEXT, Country_code TEXT)",
      );
    }
    catch(err) {
    }






//    deleteContribuable(0);

    await initDownMennu();
  }


  static Future Truncate_param() async {
  final db = await database;
  print("getListTables");

  DbTools.deleteAll("Secteurs");
  DbTools.deleteAll("Countrys");

  }


  static Future getListTables() async {
    final db = await database;
    print("getListTables");

    (await db.query('sqlite_master', columns: ['type', 'name', 'sql'])).forEach((row) {
      print(row.values);
    });
  }



  static Future getIlot() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query("Ilot");

  print("DATABASE getIlot() length ${maps.length}");


    DbOdoo.Ilots = List.generate(maps.length, (i) {
      return Ilot(
        ilotid:          maps[i]["ilotid"],
        ilotName:          maps[i]["ilotName"],
        clusterName:          maps[i]["clusterName"],
        regionName:          maps[i]["regionName"],
        departementName:          maps[i]["departementName"],
        sousPrefectureName:          maps[i]["sousPrefectureName"],
        zoneRecensementName:          maps[i]["zoneRecensementName"],
        communeName:          maps[i]["communeName"],
        localiteName:          maps[i]["localiteName"],
        quartierName:          maps[i]["quartierName"],

      );
    });

    print("getIlot() length ${maps.length}");


  }

  //************************************************
  //************************ PARAM **************
  //************************************************

  static List<DropdownMenuItem<String>> TypeDownMenu = [];

  static Future initDownMennu() async {
    TypeDownMenu.add(
        new DropdownMenuItem(value: "0", child: new Text("Ordinaire")));
    TypeDownMenu.add(
        new DropdownMenuItem(value: "1", child: new Text("Stationnement")));
    TypeDownMenu.add(
        new DropdownMenuItem(value: "2", child: new Text("Taxi brousse")));
    TypeDownMenu.add(new DropdownMenuItem(value: "3", child: new Text("Taxi")));
    TypeDownMenu.add(
        new DropdownMenuItem(value: "4", child: new Text("Non Defini")));
  }

  //************************************************
  //******************** REST **************
  //************************************************



  static Future<void> insertTable(String table, var Data) async {
    final db = await database;
    await db.insert(table, Data.toMap(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }


  static Future<void> deleteAll(String table) async {
    final db = await database;
    await db.delete(
      table,
    );
  }


  //************************************************
  //******************** Entreprenant **************
  //************************************************

  static List<Entreprenant> glfEntreprenant = [];
  static List<Entreprenant> glfEntreprenantaTransf = [];
  static bool fEntreprenantaTransf = false;



  static Future getEntreprenantTransf() async {
    glfEntreprenantaTransf.clear();
    glfEntreprenant.forEach((element) async {
      if (element.ENT_TRANSF_OK! == 0)
        glfEntreprenantaTransf.add(element);
    });
    fEntreprenantaTransf = glfEntreprenantaTransf.length > 0;
    print(" glfEntreprenantaTransf.length ${glfEntreprenantaTransf.length}");
    print(" fEntreprenantaTransf ${fEntreprenantaTransf}");

  }


  static Future<void> gloadDataEntr() async {
    glfEntreprenant = await getEntreprenants();
  }


  static Future<List<Entreprenant>> getEntreprenants() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query("Entreprenants", orderBy: "name ASC");
    //gColors.printWrapped(" maps ${maps}");
    return List.generate(maps.length, (i) {
      return Entreprenant.fromMap(maps[i]);
    });
  }


  static Future<Entreprenant> getEntreprenantsID(int EntreprenantId) async {
    final db = await database;
    DbTools.gEntreprenant = Entreprenant();
    DbTools.gEntreprenant.init();

    Entreprenant wEntreprenant = Entreprenant();
    wEntreprenant.init();

    final List<Map<String, dynamic>> maps = await db.query("Entreprenants", where: "id = ?", whereArgs: [EntreprenantId],);
    //gColors.printWrapped(" maps ${maps}");
    var wRet =  List.generate(maps.length, (i) {
      wEntreprenant =  Entreprenant.fromMap(maps[0]);
    });

    return wEntreprenant;


  }



  static Future<List<Entreprenant>> getEntreprenantSansTri() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query("Entreprenants");

    return List.generate(maps.length, (i) {
      return Entreprenant.fromMap(maps[i]);
    });
  }

  static Future<List<Entreprenant>> getEntreprenantsFiltre(String wFiltre) async {
    final db = await database;

    print("getEntreprenantsFiltre gCurrentIndex  ${DbTools.gCurrentIndex}");


    String wState = "";
    String wStateall = "";
    if (DbTools.gCurrentIndex == 1)
      {
        wState = " state = 'draft' AND ";
        wStateall = " WHERE state = 'draft' ";
      }
    if (DbTools.gCurrentIndex == 3)
    {
      wState = " state = 'cancel' AND ";
      wStateall = " WHERE state = 'cancel' ";
    }
    if (DbTools.gCurrentIndex == 4)
    {
      wState = " state = 'cancel' AND ";
      wStateall = " WHERE state = 'confirm' ";
    }

    print("getEntreprenantsFiltre wState  ${wState}");

    String Limit = "";
    String wSql = "SELECT * FROM Entreprenants WHERE $wState nomPrenomDirigeant LIKE '%$wFiltre%' OR telephoneDirigeant LIKE '%$wFiltre%' ORDER BY nomPrenomDirigeant COLLATE NOCASE $Limit";
    if (wFiltre == "") {
       Limit = " Limit 30 ";
       wSql = "SELECT * FROM Entreprenants $wStateall ORDER BY nomPrenomDirigeant COLLATE NOCASE $Limit";
    }

    print("getEntreprenantsFiltre wSql  $wSql");

    final List<Map<String, dynamic>> maps = await db.rawQuery(wSql);
    print("getEntreprenantsFiltre() Entreprenant.length ${maps.length}");
    var wRet =  List.generate(maps.length, (i) {
      return Entreprenant.fromMap(maps[i]);
    });



  return wRet;

  }



  static Future<List<Entreprenant>> getEntreprenantDoublons() async {
    final db = await database;

    String wSql = "SELECT * FROM Entreprenants GROUP BY id HAVING   COUNT(id) > 1";
    final List<Map<String, dynamic>> maps = await db.rawQuery(wSql);


    print("getEntreprenantDoublons() Entreprenant.length ${maps.length}");
    return List.generate(maps.length, (i) {
      return Entreprenant.fromMap(maps[i]);
    });
  }

  static Future<void> deleteEntreprenant(int EntreprenantId) async {
    final db = await database;
    await db.delete("Entreprenants", where: "id = ?", whereArgs: [EntreprenantId],
    );
  }


  static Future<void> updateEntreprenant(Entreprenant Entreprenant) async {
    final db = await database;

    print(" updateEntreprenant Entreprenant.toJson() ${Entreprenant.toJsonIMG()}");
    await db.update(
      "Entreprenants",
      Entreprenant.toJsonIMG(),
      where: "id = ?",
      whereArgs: [Entreprenant.id],
    );
    print("updateEntreprenant");
  }



  //****************************************************
  //************************ Activité INS **************
  //****************************************************

  static List<Activite_ins> glfActivite_ins = [];
  static List<Activite_ins> glfActivite_insTransf = [];
  static bool fActivite_insTransf = false;

  static Future<List<Activite_ins>> getActivitesInsAll() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query("Activites_Ins");
    print("getActivites.length ${maps.length}");
    return List.generate(maps.length, (i) {
      return Activite_ins.fromJson(maps[i]);
    });
  }


  static Future getActivitesInsTransfEntID(int entreprenantId) async {
    glfActivite_insTransf.clear();

    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query("Activites_Ins");
    for (int i = 0; i < maps.length; ++i) {
      Activite_ins wActivite_ins = Activite_ins.fromJson(maps[i]);
      if (wActivite_ins.ACT_TRANSF_OK! == 0 && wActivite_ins.entreprenantId! == entreprenantId)
        glfActivite_insTransf.add(wActivite_ins);
    }
    fActivite_insTransf = glfActivite_insTransf.length > 0;
    print(" glfActivite_insTransf.length ${glfActivite_insTransf.length}");
    print(" fActivite_insTransf ${fActivite_insTransf}");

  }



  static Future getActivitesInsTransf() async {
    glfActivite_insTransf.clear();

    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query("Activites_Ins");
    for (int i = 0; i < maps.length; ++i) {
      Activite_ins wActivite_ins = Activite_ins.fromJson(maps[i]);
      if (wActivite_ins.ACT_TRANSF_OK! == 0)
        glfActivite_insTransf.add(wActivite_ins);

    }
    fActivite_insTransf = glfActivite_insTransf.length > 0;
    print(" glfActivite_insTransf.length ${glfActivite_insTransf.length}");
    print(" fActivite_insTransf ${fActivite_insTransf}");

  }




  static Future getActivitesInsAllTest() async {

    await DbTools.getActivitesInsTransf();


    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query("Activites_Ins");
    for (int i = 0; i < maps.length; ++i) {
      Activite_ins wActivite_ins = Activite_ins.fromJson(maps[i]);
    }
  }



  static Future<List<Activite_ins>> getActivitesIns(int entreprenantId, int Id_Tmp) async {
    final db = await database;
    print("getActivitesIns entreprenantId ${entreprenantId} ${Id_Tmp}");
    final List<Map<String, dynamic>> maps = await db.query(
      "Activites_Ins",
      orderBy: "name ASC",
      where: "entreprenant_id = ?",
     whereArgs: [entreprenantId],


//      where: "entreprenant_id = ? OR Id_Tmp = ?",
  //    whereArgs: [entreprenantId, Id_Tmp],


    );
    print("getActivites length ${maps.length}");


    return List.generate(maps.length, (i) {
      print("getActivites maps[i] ${maps[i]}");
      return Activite_ins.fromJson(maps[i]);
    });


  }


  static Future<void> updateActivite_ins(Activite_ins activite_ins) async {
    try {
      final db = await database;
      gColors.printWrapped(" updateActivite_ins activite_ins.toJson() ${activite_ins.toJson()}");
      int? repid = await db.update(
        "Activites_Ins",
        activite_ins.toJson(),
        where: "id = ?",
        whereArgs: [activite_ins.id],
      );
      gColors.printWrapped(" updateActivite_ins ${repid} id ${activite_ins.id} tmp ${activite_ins.Id_Tmp} TRANSF ${activite_ins.ACT_TRANSF_OK}");

    } catch (e) {
      print("ERROR db.update");
      gColors.printWrapped(e.toString());
    }



  }

  static Future<void> insertActivite_ins(Activite_ins activite_ins) async {

    try {
      final db = await DbTools.database;
      gColors.printWrapped(" insertActivite_ins toArr ${activite_ins.toArr()}");
      int? repid = await db.insert("Activites_Ins", activite_ins.toArr());
      print("insertActivite_ins ${repid}");
    } catch (e) {
      print("ERROR db.insert");
      gColors.printWrapped(e.toString());
    }


  }


  static bool gActivite_ins_Is_New = true;
  static Future<void> insertUpdateActivite_ins(Activite_ins activite) async {


    print("insertUpdateActivite_ins gActivite_ins_Is_New ${gActivite_ins_Is_New} ${activite.name}");

    if (gActivite_ins_Is_New)
    {
      print(" DBTOOLS insert Activite_ins");
      await insertActivite_ins( activite);
    }
    else
    {
      print(" DBTOOLS update Activite_ins");
      await updateActivite_ins( activite);
    }


  }

  static Future<void> deleteActivite(int ActiviteId) async {
    final db = await database;
    await db.delete("Activites_Ins", where: "id = ?", whereArgs: [ActiviteId],
    );
  }



  //************************************************
  //************************ TAXES **************
  //************************************************

  static Future<List<Taxe>> getTaxes(int activiteId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      "Taxes",
      where: "taxe_activiteId = ?",
      whereArgs: [activiteId],
    );

    print("getTaxes.length ${maps.length}");

    return List.generate(maps.length, (i) {
      return Taxe(
        taxeId: maps[i]["taxeId"],
        taxe_activiteId: maps[i]["taxe_activiteId"],
        taxe_name: maps[i]["taxe_name"],
        taxe_mt: maps[i]["taxe_mt"],
      );
    });
  }

  //************************************************
  //************************ TAXES HISTO **************
  //************************************************

  static Future<List<TaxeHisto>> getTaxeHistos(int taxehisto_activiteId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      "TaxeHistos",
      where: "taxehisto_activiteId = ?",
      whereArgs: [taxehisto_activiteId],
    );

    print("getTaxeHistos.length ${maps.length}");

    return List.generate(maps.length, (i) {
      return TaxeHisto(
        taxehistoId: maps[i]["taxehistoId"],
        taxehisto_activiteId: maps[i]["taxehisto_activiteId"],
        taxehisto_month: maps[i]["taxehisto_month"],
        taxehisto_mt1: maps[i]["taxehisto_mt1"],
        taxehisto_mt2: maps[i]["taxehisto_mt2"],
        taxehisto_mt3: maps[i]["taxehisto_mt3"],
        taxehisto_mt4: maps[i]["taxehisto_mt4"],
        taxehisto_mt5: maps[i]["taxehisto_mt5"],
        taxehisto_mt1s: maps[i]["taxehisto_mt1s"],
        taxehisto_mt2s: maps[i]["taxehisto_mt2s"],
        taxehisto_mt3s: maps[i]["taxehisto_mt3s"],
        taxehisto_mt4s: maps[i]["taxehisto_mt4s"],
        taxehisto_mt5s: maps[i]["taxehisto_mt5s"],
      );
    });
  }

  static String LibType(int Type) {
    switch (Type) {
      case (0):
        {
          return "PERSONNE PHYSIQUE";
        }
      case (1):
        {
          return "PERSONNE MORALE";
        }
      default:
        {
          return "";
        }
    }
  }

  //************************************************
  //************************ FOURNISSEUR ***************
  //************************************************

  static List<Fournisseur> lfFournisseur = [];

  static Future<void> deleteFournisseur(int aID) async {
    final db = await database;
    await db.delete(
      "Fournisseurs",
      where: "fournisseur_activiteId = ?",
      whereArgs: [aID],
    );
  }

  static Future initFournisseurDownMennu(int aID) async {
    lfFournisseur = await DbTools.getFournisseursSansTri(aID);
  }

  static Future initFournisseurDownMennuAll() async {
    lfFournisseur = await DbTools.getFournisseursSansTriAll();

  }

  static Future<List<Fournisseur>> getFournisseursSansTri(int aID) async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query("Fournisseurs", where: "fournisseur_activiteId = $aID");

    print("getFournisseursSansTri() Fournisseur.length ${maps.length}");

    return List.generate(maps.length, (i) {
      return Fournisseur(
        fournisseurid: maps[i]["fournisseurid"],
        fournisseur_activiteId: maps[i]["fournisseur_activiteId"],
        fournisseur_code: maps[i]["fournisseur_code"],
        fournisseur_name: maps[i]["fournisseur_name"],
        fournisseur_ncc: maps[i]["fournisseur_ncc"],
        fournisseur_nature: maps[i]["fournisseur_nature"],
        fournisseur_mt1: maps[i]["fournisseur_mt1"],
      );
    });
  }

  static Future<List<Fournisseur>> getFournisseursSansTriAll() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query("Fournisseurs");

    print("getFournisseursSansTri() Fournisseur.length ${maps.length}");

    return List.generate(maps.length, (i) {
      return Fournisseur(
        fournisseurid: maps[i]["fournisseurid"],
        fournisseur_activiteId: maps[i]["fournisseur_activiteId"],
        fournisseur_code: maps[i]["fournisseur_code"],
        fournisseur_name: maps[i]["fournisseur_name"],
        fournisseur_ncc: maps[i]["fournisseur_ncc"],
        fournisseur_nature: maps[i]["fournisseur_nature"],
        fournisseur_mt1: maps[i]["fournisseur_mt1"],
      );
    });
  }

  //************************************************
  //************************ SECTEUR ***************
  //************************************************

  static List<Secteur> lfSecteur = [];
  static List<Secteur> lfSecteurOrd = [];
  static List<Secteur> lfSecteurTaxi = [];
  static List<Secteur> lfSecteurStatio = [];
  static List<Secteur> lfSecteurTransp = [];
  static Secteur? selectedSecteur;



  static VoidCallback listEntrVoidCallback = (){};
  static VoidCallback Menu_screenVoidCallback = (){};





  static Future initSecteurDownMennu() async {
    lfSecteur = await DbTools.getSecteursSansTri();

    lfSecteurOrd.clear();
    lfSecteurTaxi.clear();
    lfSecteurStatio.clear();
    lfSecteurTransp.clear();


    lfSecteur.forEach((element) {
//print("${element.secteurid} ${element.secteur_name} ${element.type_activite}");
      if (element.type_activite == "ORDINAIRE")
        lfSecteurOrd.add(element);
      else if (element.type_activite == "STATIONNEMENT")
        lfSecteurStatio.add(element);
      else if (element.type_activite == "TAXI")
        lfSecteurTaxi.add(element);
      else if (element.type_activite == "TRANSPORT")
        lfSecteurTransp.add(element);
    });


  }

  static Future<List<Secteur>> getSecteursSansTri() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query("Secteurs", orderBy: "secteur_name ASC");

//    print("getSecteursSansTri() Secteur.length ${maps.length}");

    return List.generate(maps.length, (i) {
//      print("getSecteursSansTri() secteurid ${maps[i]["secteurid"]} ${maps[i]["secteur_name"]}");
      return Secteur(
        secteurid: maps[i]["secteurid"],
        secteur_name: maps[i]["secteur_name"],
        secteur_forme: maps[i]["secteur_forme"],
        type_activite: maps[i]["type_activite"],
      );
    });
  }

  //************************************************
  //************************ ZONE ***************
  //************************************************

  static List<Zone> lfZone = [];
  static Zone? selectedZone;

  static Future initZoneDownMennu() async {
    lfZone = await DbTools.getZonesSansTri();

/*
    lfZone.forEach((element) {
      print("Zone ${element.zoneid} ${element.zone_name}");

    });
*/
  }

  static Future<List<Zone>> getZonesSansTri() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query("Zones");

    print("getZonesSansTri() Zone.length ${maps.length}");

    return List.generate(maps.length, (i) {
      return Zone(
        zoneid: maps[i]["zoneid"],
        zone_name: maps[i]["zone_name"],
      );
    });
  }

  //************************************************
  //************************ SVA ***************
  //************************************************

  static List<Sva> lfSva = [];
  static Sva? selectedSva;

  static Future initSvaDownMennu() async {
    lfSva = await DbTools.getSvasSansTri();

    lfSva.forEach((element) {
//      print("Sva ${element.svaid} ${element.sva_name} ${element.sva_code}");
    });
  }

  static Future<List<Sva>> getSvasSansTri() async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query("Svas", where: "sva_code != 'false'");

    print("getSvasSansTri() Sva.length ${maps.length}");

    return List.generate(maps.length, (i) {
      return Sva(
        svaid: maps[i]["svaid"],
        sva_name: maps[i]["sva_name"],
        sva_code: maps[i]["sva_code"],
      );
    });
  }

  //************************************************
  //************************ Country ***************
  //************************************************

  static List<Country> lfCountry = [];
  static Country? selectedCountry;

  static Future initCountryDownMennu() async {
    lfCountry = await DbTools.getCountrys();
  }

  static Future<List<Country>> getCountrys() async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query("Countrys", orderBy: "Country_name ASC");

    print("getCountrys() Country.length ${maps.length}");

    return List.generate(maps.length, (i) {
      return Country(
        Countryid: maps[i]["Countryid"],
        Country_name: maps[i]["Country_name"],
        Country_code: maps[i]["Country_code"],
      );
    });
  }

  static var Alpha2_3 = [
    ["AF", "AFG"],
    ["AX", "ALA"],
    ["AL", "ALB"],
    ["DZ", "DZA"],
    ["AS", "ASM"],
    ["AD", "AND"],
    ["AO", "AGO"],
    ["AI", "AIA"],
    ["AQ", "ATA"],
    ["AG", "ATG"],
    ["AR", "ARG"],
    ["AM", "ARM"],
    ["AW", "ABW"],
    ["AU", "AUS"],
    ["AT", "AUT"],
    ["AZ", "AZE"],
    ["BS", "BHS"],
    ["BH", "BHR"],
    ["BD", "BGD"],
    ["BB", "BRB"],
    ["BY", "BLR"],
    ["BE", "BEL"],
    ["BZ", "BLZ"],
    ["BJ", "BEN"],
    ["BM", "BMU"],
    ["BT", "BTN"],
    ["BO", "BOL"],
    ["BQ", "BES"],
    ["BA", "BIH"],
    ["BW", "BWA"],
    ["BV", "BVT"],
    ["BR", "BRA"],
    ["IO", "IOT"],
    ["BN", "BRN"],
    ["BG", "BGR"],
    ["BF", "BFA"],
    ["BI", "BDI"],
    ["CV", "CPV"],
    ["KH", "KHM"],
    ["CM", "CMR"],
    ["CA", "CAN"],
    ["KY", "CYM"],
    ["CF", "CAF"],
    ["TD", "TCD"],
    ["CL", "CHL"],
    ["CN", "CHN"],
    ["CX", "CXR"],
    ["CC", "CCK"],
    ["CO", "COL"],
    ["KM", "COM"],
    ["CG", "COG"],
    ["CD", "COD"],
    ["CK", "COK"],
    ["CR", "CRI"],
    ["CI", "CIV"],
    ["HR", "HRV"],
    ["CU", "CUB"],
    ["CW", "CUW"],
    ["CY", "CYP"],
    ["CZ", "CZE"],
    ["DK", "DNK"],
    ["DJ", "DJI"],
    ["DM", "DMA"],
    ["DO", "DOM"],
    ["EC", "ECU"],
    ["EG", "EGY"],
    ["SV", "SLV"],
    ["GQ", "GNQ"],
    ["ER", "ERI"],
    ["EE", "EST"],
    ["SZ", "SWZ"],
    ["ET", "ETH"],
    ["FK", "FLK"],
    ["FO", "FRO"],
    ["FJ", "FJI"],
    ["FI", "FIN"],
    ["FR", "FRA"],
    ["GF", "GUF"],
    ["PF", "PYF"],
    ["TF", "ATF"],
    ["GA", "GAB"],
    ["GM", "GMB"],
    ["GE", "GEO"],
    ["DE", "DEU"],
    ["GH", "GHA"],
    ["GI", "GIB"],
    ["GR", "GRC"],
    ["GL", "GRL"],
    ["GD", "GRD"],
    ["GP", "GLP"],
    ["GU", "GUM"],
    ["GT", "GTM"],
    ["GG", "GGY"],
    ["GN", "GIN"],
    ["GW", "GNB"],
    ["GY", "GUY"],
    ["HT", "HTI"],
    ["HM", "HMD"],
    ["VA", "VAT"],
    ["HN", "HND"],
    ["HK", "HKG"],
    ["HU", "HUN"],
    ["IS", "ISL"],
    ["IN", "IND"],
    ["ID", "IDN"],
    ["IR", "IRN"],
    ["IQ", "IRQ"],
    ["IE", "IRL"],
    ["IM", "IMN"],
    ["IL", "ISR"],
    ["IT", "ITA"],
    ["JM", "JAM"],
    ["JP", "JPN"],
    ["JE", "JEY"],
    ["JO", "JOR"],
    ["KZ", "KAZ"],
    ["KE", "KEN"],
    ["KI", "KIR"],
    ["KP", "PRK"],
    ["KR", "KOR"],
    ["KW", "KWT"],
    ["KG", "KGZ"],
    ["LA", "LAO"],
    ["LV", "LVA"],
    ["LB", "LBN"],
    ["LS", "LSO"],
    ["LR", "LBR"],
    ["LY", "LBY"],
    ["LI", "LIE"],
    ["LT", "LTU"],
    ["LU", "LUX"],
    ["MO", "MAC"],
    ["MG", "MDG"],
    ["MW", "MWI"],
    ["MY", "MYS"],
    ["MV", "MDV"],
    ["ML", "MLI"],
    ["MT", "MLT"],
    ["MH", "MHL"],
    ["MQ", "MTQ"],
    ["MR", "MRT"],
    ["MU", "MUS"],
    ["YT", "MYT"],
    ["MX", "MEX"],
    ["FM", "FSM"],
    ["MD", "MDA"],
    ["MC", "MCO"],
    ["MN", "MNG"],
    ["ME", "MNE"],
    ["MS", "MSR"],
    ["MA", "MAR"],
    ["MZ", "MOZ"],
    ["MM", "MMR"],
    ["NA", "NAM"],
    ["NR", "NRU"],
    ["NP", "NPL"],
    ["NL", "NLD"],
    ["NC", "NCL"],
    ["NZ", "NZL"],
    ["NI", "NIC"],
    ["NE", "NER"],
    ["NG", "NGA"],
    ["NU", "NIU"],
    ["NF", "NFK"],
    ["MK", "MKD"],
    ["MP", "MNP"],
    ["NO", "NOR"],
    ["OM", "OMN"],
    ["PK", "PAK"],
    ["PW", "PLW"],
    ["PS", "PSE"],
    ["PA", "PAN"],
    ["PG", "PNG"],
    ["PY", "PRY"],
    ["PE", "PER"],
    ["PH", "PHL"],
    ["PN", "PCN"],
    ["PL", "POL"],
    ["PT", "PRT"],
    ["PR", "PRI"],
    ["QA", "QAT"],
    ["RE", "REU"],
    ["RO", "ROU"],
    ["RU", "RUS"],
    ["RW", "RWA"],
    ["BL", "BLM"],
    ["SH", "SHN"],
    ["KN", "KNA"],
    ["LC", "LCA"],
    ["MF", "MAF"],
    ["PM", "SPM"],
    ["VC", "VCT"],
    ["WS", "WSM"],
    ["SM", "SMR"],
    ["ST", "STP"],
    ["SA", "SAU"],
    ["SN", "SEN"],
    ["RS", "SRB"],
    ["SC", "SYC"],
    ["SL", "SLE"],
    ["SG", "SGP"],
    ["SX", "SXM"],
    ["SK", "SVK"],
    ["SI", "SVN"],
    ["SB", "SLB"],
    ["SO", "SOM"],
    ["ZA", "ZAF"],
    ["GS", "SGS"],
    ["SS", "SSD"],
    ["ES", "ESP"],
    ["LK", "LKA"],
    ["SD", "SDN"],
    ["SR", "SUR"],
    ["SJ", "SJM"],
    ["SE", "SWE"],
    ["CH", "CHE"],
    ["SY", "SYR"],
    ["TW", "TWN"],
    ["TJ", "TJK"],
    ["TZ", "TZA"],
    ["TH", "THA"],
    ["TL", "TLS"],
    ["TG", "TGO"],
    ["TK", "TKL"],
    ["TO", "TON"],
    ["TT", "TTO"],
    ["TN", "TUN"],
    ["TR", "TUR"],
    ["TM", "TKM"],
    ["TC", "TCA"],
    ["TV", "TUV"],
    ["UG", "UGA"],
    ["UA", "UKR"],
    ["AE", "ARE"],
    ["GB", "GBR"],
    ["US", "USA"],
    ["UM", "UMI"],
    ["UY", "URY"],
    ["UZ", "UZB"],
    ["VU", "VUT"],
    ["VE", "VEN"],
    ["VN", "VNM"],
    ["VG", "VGB"],
    ["VI", "VIR"],
    ["WF", "WLF"],
    ["EH", "ESH"],
    ["YE", "YEM"],
    ["ZM", "ZMB"],
    ["ZW", "ZWE"]
  ];

  //************************************************
  //************************ ImgMafa ***************
  //************************************************

  static String? ImgMafa_Token = "";
  static String ImgMafa_ImageUrl = "";

  static Future ImgMafa_getToken() async {
    ImgMafa_Token = "";

    var request = http.MultipartRequest(
        'POST', Uri.parse('https://colibri-test.herokuapp.com/token'));
    request.fields.addAll({'username': 'APP_ITC', 'password': 'TED88300'});

    print("ImgMafa_getToken request.send()");
    http.StreamedResponse response = await request.send();
    print("ImgMafa_getToken response ${response.statusCode}");
    if (response.statusCode == 200) {
      var parsedJson = json.decode(await response.stream.bytesToString());
      print("ImgMafa_getToken parsedJson ${parsedJson.toString()}");
      ImgMafa_Token = parsedJson['access_token'];
    } else {
      print(response.reasonPhrase);
    }
//    eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MywidXNlcm5hbWUiOiJBUFBfSVRDIiwicGFzc3dvcmRfaGFzaCI6IiQyYiQxMiQyYWgwcUJFZVBCQkhDNmxZSjVELzhlTi5meDIvOEpiSlUvTnRIZ2hkTllQYXUyL00wbTNGUyJ9.e9WMmCBDuwNjpI4gtby6ls3ri3FttgeXf4Obo7oFCx8
  }

  static void ImgMafa_getImage(int aID, String aType) async {
    await ImgMafa_getToken();

    var headers = {'Authorization': 'Bearer ${ImgMafa_Token}'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://colibri-test.herokuapp.com/api/download_taxpayer_info/?id=${aID}&type=${aType}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    print("ImgMafa_getImage response ${response.statusCode}");
    if (response.statusCode == 200) {
      var parsedJson = json.decode(await response.stream.bytesToString());
      print("ImgMafa_getImage parsedJson ${parsedJson.toString()}");
      ImgMafa_Token = parsedJson['access_token'];
    } else {
      print(response.reasonPhrase);
    }
  }

  static Future ImgMafa_setImage(
      int aID, String aType, List<int> aPhotoAsBytes) async {
    await ImgMafa_getToken();

    var headers = {'Authorization': 'Bearer ${ImgMafa_Token}'};

    var uri = Uri.parse(
        'https://colibri-test.herokuapp.com/api/upload_taxpayer_info/');
    var request = new http.MultipartRequest("POST", uri);
    request.fields.addAll({
      'id': aID.toString(),
      'type': aType,
    });
    request.headers.addAll(headers);

    var multipartFile = new http.MultipartFile.fromBytes('file', aPhotoAsBytes,
        filename: "Mafa_photo_id_${aID}.jpg");
    request.files.add(multipartFile);

    print("ImgMafa_setImage >>>>> request ${request.toString()}");
    print("ImgMafa_setImage >>>>> fields ${request.fields.toString()}");
    print("ImgMafa_setImage >>>>> headers ${request.headers.toString()}");

    http.StreamedResponse response = await request.send();

    print("ImgMafa_setImage response ${response.toString()}");

    print("ImgMafa_setImage statusCode ${response.statusCode}");

    if (response.statusCode == 200) {
      var parsedJson = json.decode(await response.stream.bytesToString());
      print("photo_id parsedJson ${parsedJson.toString()}");
      ImgMafa_Token = parsedJson['access_token'];
    } else {
      print(response.reasonPhrase);
    }
  }



}
