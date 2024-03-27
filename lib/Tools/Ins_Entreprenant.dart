import 'dart:ffi';

import 'package:colibri/Tools/DbOdoo.dart';
import 'package:colibri/Tools/DbTools.dart';

/*
ilot_id
superviseur_id
manager_id
equipe_id
chef_equipe_id
*/

class Entreprenant {
  int? id;
  int? ENT_TRANSF_OK = 1;
  int? Id_Tmp = 0;
  int? ENT_Id_Server = 0;
  String? ImageBase64_PHOTO_ENTR = "";
  String? ID3_templateBytes64 = "";
  String? ID3_croppedBytes64 = "";
  int? clusterId;
  int? regionId;
  int? departementId;
  int? sousprefectureId;
  int? communeId;
  int? localiteId;
  int? zonerecensementId;
  int? districtId;
  int? quartierId;
  String? milieuImplantation;
  String? nomRepondant;
  String? fonctionRepondant;
  String? autre_fonction_repondant;
  String? contact1Repondant;
  String? contact2Repondant;
  String? emailRepondant;
  String? nomPrenomDirigeant;
  String? emailDirigeant;
  String? name;
  String? telephoneDirigeant;
  String? telephone_dirigeant_whatsapp;
  String? adresseDirigeant;
  String? qualiteDirigeant;
  String? profession;
  String? autreQualite;
  String? terminal;
  String? sexe;
  String? birthday;
  int? countryId;
  String? lieu_naissance = "";
  String? naturePiece;
  String? cni;
  String? dateValiditePiece;
  int? userId;
  int? active;
  String? code;
  String? state;
  Entreprenant(
      {this.id,
      this.clusterId,
      this.regionId,
      this.departementId,
      this.sousprefectureId,
      this.communeId,
      this.localiteId,
      this.zonerecensementId,
      this.districtId,
      this.quartierId,
      this.active,
      this.code,
      this.userId,
      this.naturePiece,
      this.cni,
      this.state,
      this.sexe,
      this.birthday,
      this.countryId,
      this.lieu_naissance,
      this.profession,
      this.terminal,
      this.dateValiditePiece,
      this.milieuImplantation,
      this.nomRepondant,
      this.fonctionRepondant,
      this.autre_fonction_repondant,
      this.contact1Repondant,
      this.contact2Repondant,
      this.emailRepondant,
      this.nomPrenomDirigeant,
      this.emailDirigeant,
      this.name,
      this.telephoneDirigeant,
      this.adresseDirigeant,
      this.qualiteDirigeant,
      this.autreQualite,
      this.telephone_dirigeant_whatsapp,
      this.ImageBase64_PHOTO_ENTR,
      this.ID3_templateBytes64,
      this.ENT_TRANSF_OK,
      this.Id_Tmp}
      );

  Entreprenant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    active = json['active'] ? 1 : 0;
    code = json['code'];
    userId = json['user_id'];
    naturePiece = json['nature_piece'];
    cni = json['cni'];
    state = json['state'];
    sexe = json['sexe'];
    birthday = json['birthday'];
    countryId = json['country_id'];
    lieu_naissance = json['lieu_naissance'];
    if (json['profession'] == null)
      profession = "";
    else
      profession = json['profession'];
    terminal = json['terminal'];
    dateValiditePiece = json['date_validite_piece'];
    milieuImplantation = json['milieu_implantation'];
    if (json['districtId'] == null)
      districtId = 0;
    else
      districtId = json['district_id'];

    nomRepondant = json['nom_repondant'];
    fonctionRepondant = json['fonction_repondant'];
    autre_fonction_repondant = json['autre_fonction_repondant'];
    contact1Repondant = json['contact_1_repondant'];
    contact2Repondant = json['contact_2_repondant'];
    emailRepondant = json['email_repondant'];
    nomPrenomDirigeant = json['nom_prenom_dirigeant'];
    emailDirigeant = json['email_dirigeant'];
    name = json['name'];
    telephoneDirigeant = json['telephone_dirigeant'];
    adresseDirigeant = json['adresse_dirigeant'];
    qualiteDirigeant = json['qualite_dirigeant'];
    autreQualite = json['autre_qualite'];
    telephone_dirigeant_whatsapp = json['telephone_dirigeant_whatsapp'];
    clusterId = json['cluster_id'];
    regionId = json['region_id'];
    departementId = json['departement_id'];
    sousprefectureId = json['sousprefecture_id'];
    communeId = json['commune_id'];
    localiteId = json['localite_id'];
    zonerecensementId = json['zonerecensement_id'];
    quartierId = json['quartier_id'];
    ENT_Id_Server = json['ENT_Id_Server'];
  }

  Entreprenant.fromMap(Map<String, dynamic> map) {
    // Lecture SQLITE
    id = map['id'];
    Id_Tmp = map['Id_Tmp'];
    ENT_TRANSF_OK = map['ENT_TRANSF_OK'];
    ENT_Id_Server = map['ENT_Id_Server'];

    active = map['active'];
    code = map['code'];
    userId = map['userId'];
    naturePiece = map['naturePiece'];
    cni = map['cni'];
    state = map['state'];
    sexe = map['sexe'];
    birthday = map['birthday'];
    countryId = map['countryId'];
    lieu_naissance = map['lieu_naissance'];
    profession = map['profession'];

    terminal = map['terminal'];
    dateValiditePiece = map['dateValiditePiece'];

    milieuImplantation = map['milieuImplantation'];
    districtId = map['districtId'];
    nomRepondant = map['nomRepondant'];
    fonctionRepondant = map['fonctionRepondant'];
    autre_fonction_repondant = map['autre_fonction_repondant'];
    contact1Repondant = map['contact1Repondant'];
    contact2Repondant = map['contact2Repondant'];
    emailRepondant = map['emailRepondant'];
    nomPrenomDirigeant = map['nomPrenomDirigeant'];
    emailDirigeant = map['emailDirigeant'];
    name = map['name'];
    telephoneDirigeant = map['telephoneDirigeant'];
    adresseDirigeant = map['adresseDirigeant'];
    qualiteDirigeant = map['qualiteDirigeant'];
    autreQualite = map['autreQualite'];
    telephone_dirigeant_whatsapp = map['telephone_dirigeant_whatsapp'];
    clusterId = map['clusterId'];
    regionId = map['regionId'];
    departementId = map['departementId'];
    sousprefectureId = map['sousprefectureId'];
    communeId = map['communeId'];
    localiteId = map['localiteId'];
    zonerecensementId = map['zonerecensementId'];
    quartierId = map['quartierId'];

    ImageBase64_PHOTO_ENTR = map['ImageBase64_PHOTO_ENTR'];
    ID3_templateBytes64 = map['ID3_templateBytes64'];
    ID3_croppedBytes64 = map['ID3_croppedBytes64'];
  }

  Map<String, dynamic> toJson() {
    // Ecriture SQLITE
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Id_Tmp'] = this.Id_Tmp;
    data['ENT_TRANSF_OK'] = this.ENT_TRANSF_OK;
    data['ENT_Id_Server'] = this.ENT_Id_Server;

    data['active'] = this.active;
    data['code'] = this.code;
    data['userid'] = this.userId;

    data['naturepiece'] = this.naturePiece;
    data['cni'] = this.cni;
    data['state'] = this.state;

    data['sexe'] = this.sexe;
    data['birthday'] = this.birthday;
    data['countryid'] = this.countryId;
    data['lieu_naissance'] = this.lieu_naissance;
    data['profession'] = this.profession;
    data['terminal'] = this.terminal;
    data['datevaliditepiece'] = this.dateValiditePiece;

    data['milieuimplantation'] = this.milieuImplantation;
    data['districtid'] = this.districtId;
    data['nomrepondant'] = this.nomRepondant;
    data['fonctionrepondant'] = this.fonctionRepondant;
    data['autre_fonction_repondant'] = this.autre_fonction_repondant;
    data['contact1repondant'] = this.contact1Repondant;
    data['contact2repondant'] = this.contact2Repondant;
    data['emailrepondant'] = this.emailRepondant;
    data['nomprenomdirigeant'] = this.nomPrenomDirigeant;
    data['emaildirigeant'] = this.emailDirigeant;
    data['name'] = this.name;
    data['telephonedirigeant'] = this.telephoneDirigeant;
    data['adressedirigeant'] = this.adresseDirigeant;
    data['qualitedirigeant'] = this.qualiteDirigeant;
    data['autrequalite'] = this.autreQualite;
    data['telephone_dirigeant_whatsapp'] = this.telephone_dirigeant_whatsapp;
    data['clusterid'] = this.clusterId;
    data['regionid'] = this.regionId;
    data['departementid'] = this.departementId;
    data['sousprefectureid'] = this.sousprefectureId;
    data['communeid'] = this.communeId;
    data['localiteid'] = this.localiteId;
    data['zonerecensementid'] = this.zonerecensementId;
    data['quartierid'] = this.quartierId;

    data['ImageBase64_PHOTO_ENTR'] = "";
    data['ID3_templateBytes64'] = "";
    data['ID3_croppedBytes64'] = "";

    return data;
  }

  Map<String, dynamic> toJsonIMG() {
    // Ecriture SQLITE
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Id_Tmp'] = this.Id_Tmp;
    data['ENT_TRANSF_OK'] = this.ENT_TRANSF_OK;
    data['ENT_Id_Server'] = this.ENT_Id_Server;

    data['active'] = this.active;
    data['code'] = this.code;
    data['userid'] = this.userId;

    data['naturepiece'] = this.naturePiece;
    data['cni'] = this.cni;
    data['state'] = this.state;

    data['sexe'] = this.sexe;
    data['birthday'] = this.birthday;
    data['countryid'] = this.countryId;
    data['lieu_naissance'] = this.lieu_naissance;
    data['profession'] = this.profession;

    data['terminal'] = this.terminal;
    data['datevaliditepiece'] = this.dateValiditePiece;
    data['milieuimplantation'] = this.milieuImplantation;
    data['districtid'] = this.districtId;
    data['nomrepondant'] = this.nomRepondant;
    data['fonctionrepondant'] = this.fonctionRepondant;
    data['autre_fonction_repondant'] = this.autre_fonction_repondant;
    data['contact1repondant'] = this.contact1Repondant;
    data['contact2repondant'] = this.contact2Repondant;
    data['emailrepondant'] = this.emailRepondant;
    data['nomprenomdirigeant'] = this.nomPrenomDirigeant;
    data['emaildirigeant'] = this.emailDirigeant;
    data['name'] = this.name;
    data['telephonedirigeant'] = this.telephoneDirigeant;
    data['adressedirigeant'] = this.adresseDirigeant;
    data['qualitedirigeant'] = this.qualiteDirigeant;
    data['autrequalite'] = this.autreQualite;
    data['telephone_dirigeant_whatsapp'] = this.telephone_dirigeant_whatsapp;
    data['clusterid'] = this.clusterId;
    data['regionid'] = this.regionId;
    data['departementid'] = this.departementId;
    data['sousprefectureid'] = this.sousprefectureId;
    data['communeid'] = this.communeId;
    data['localiteid'] = this.localiteId;
    data['zonerecensementid'] = this.zonerecensementId;
    data['quartierid'] = this.quartierId;
    data['ImageBase64_PHOTO_ENTR'] = this.ImageBase64_PHOTO_ENTR;
    data['ID3_templateBytes64'] = this.ID3_templateBytes64;
    data['ID3_croppedBytes64'] = this.ID3_croppedBytes64;

    return data;
  }

  void init() {
    if (cni == null) cni = "";
    if (state == null) state = "";
    if (sexe == null) sexe = "";

    if (sexe == null) sexe = "";
    if (birthday == null) birthday = "";
    if (lieu_naissance == null) lieu_naissance = "";
    if (countryId == null) countryId = 44;
    if (profession == null) profession = "";

    if (terminal == null) terminal = "";
    if (dateValiditePiece == null) dateValiditePiece = "";

    if (nomRepondant == null) nomRepondant = "";
    if (fonctionRepondant == null) fonctionRepondant = "";
    if (autre_fonction_repondant == null) autre_fonction_repondant = "";
    if (contact1Repondant == null) contact1Repondant = "";
    if (contact2Repondant == null) contact2Repondant = "";
    if (emailRepondant == null) emailRepondant = "";
    if (nomPrenomDirigeant == null) nomPrenomDirigeant = "";
    if (emailDirigeant == null) emailDirigeant = "";

    if (telephoneDirigeant == null) telephoneDirigeant = "";
    if (adresseDirigeant == null) adresseDirigeant = "";
    if (qualiteDirigeant == null) qualiteDirigeant = "";
    if (autreQualite == null) autreQualite = "";
    if (telephone_dirigeant_whatsapp == null) telephone_dirigeant_whatsapp = "";

    if (milieuImplantation == null) milieuImplantation = "1";
    if (districtId == null) districtId = 0;
    if (naturePiece == null) naturePiece = "";

    Id_Tmp = 0;
    ENT_Id_Server = -1;
    districtId = 29;
    clusterId = DbOdoo.res_Usercluster_id;
    regionId = DbOdoo.res_Userregion_id;
    departementId = DbOdoo.res_Userdepartement_id;
    sousprefectureId = DbOdoo.res_Usersousprefecture_id;
    communeId = DbOdoo.res_Usercommune_id;
    localiteId = DbOdoo.res_Userlocalite_id;
    zonerecensementId = DbOdoo.res_Userzonerecensement_id;
    quartierId = DbOdoo.res_Userquartier_id;

    if (DbTools.gTED)
      {
        nomRepondant = "TED";
        contact1Repondant = "0712345678";
        nomPrenomDirigeant = "TED 1";
        lieu_naissance = "lieu_naissance Lieu";
        cni = "NCni";
        telephoneDirigeant = "0787654321";
        profession = "profession";
        birthday = "1964-04-02";
        dateValiditePiece = "2030-05-18";
        adresseDirigeant = "adresseDirigeant Adresse";
        state = "draft";
      }
    ImageBase64_PHOTO_ENTR = "";
    ID3_templateBytes64 = "";
    ID3_croppedBytes64 = "";

    id = 0;
  }

  Map<String, dynamic> toArrUpd() {
    // Ecriture ODOO
    if (cni == null) cni = "";
    if (state == null) state = "";
    if (sexe == null) sexe = "";

    if (sexe == null) sexe = "";
    if (birthday == null) birthday = "";
    if (lieu_naissance == null) lieu_naissance = "";
    if (countryId == null) countryId = 44;
    if (profession == null) profession = "";

    if (terminal == null) terminal = "";
    if (dateValiditePiece == null) dateValiditePiece = "";

    if (nomRepondant == null) nomRepondant = "";
    if (fonctionRepondant == null) fonctionRepondant = "";
    if (autre_fonction_repondant == null) autre_fonction_repondant = "";
    if (contact1Repondant == null) contact1Repondant = "";
    if (contact2Repondant == null) contact2Repondant = "";
    if (emailRepondant == null) emailRepondant = "";
    if (nomPrenomDirigeant == null) nomPrenomDirigeant = "";
    if (emailDirigeant == null) emailDirigeant = "";

    if (telephoneDirigeant == null) telephoneDirigeant = "";
    if (adresseDirigeant == null) adresseDirigeant = "";
    if (qualiteDirigeant == null) qualiteDirigeant = "";
    if (autreQualite == null) autreQualite = "";
    if (telephone_dirigeant_whatsapp == null) telephone_dirigeant_whatsapp = "";

    if (milieuImplantation == null) milieuImplantation = "1";
    if (districtId == null) districtId = 0;

    districtId = 29;
    clusterId = DbOdoo.res_Usercluster_id;
    regionId = DbOdoo.res_Userregion_id;
    departementId = DbOdoo.res_Userdepartement_id;
    sousprefectureId = DbOdoo.res_Usersousprefecture_id;
    communeId = DbOdoo.res_Usercommune_id;
    localiteId = DbOdoo.res_Userlocalite_id;
    zonerecensementId = DbOdoo.res_Userzonerecensement_id;
    quartierId = DbOdoo.res_Userquartier_id;

    var map = {
      'active': true,

      'user_id': '${DbOdoo.res_UserId}',
      'ref': '',

      'nature_piece': '${naturePiece}',
      'cni': '${cni}',
      'state': '${state}',

      'sexe': '${sexe}',
      'birthday': '${birthday}',
      'country_id': '${countryId}',
      'lieu_naissance': '${lieu_naissance}',
      'profession': '${profession}',

      'terminal': '${terminal}',
      'date_validite_piece': '${dateValiditePiece}',

      'milieu_implantation': '${milieuImplantation}',
//      'district_id': '${districtId}',
      'nom_repondant': '${nomRepondant}',
      'fonction_repondant': '${fonctionRepondant}',
      'autre_fonction_repondant': '${autre_fonction_repondant}',
      'contact_1_repondant': '${contact1Repondant}',
      'contact_2_repondant': '${contact2Repondant}',
      'email_repondant': '${emailRepondant}',
      'nom_prenom_dirigeant': '${nomPrenomDirigeant}',
      'email_dirigeant': '${emailDirigeant}',
      'name': '${name}',

      'telephone_dirigeant': '${telephoneDirigeant}',
      'adresse_dirigeant': '${adresseDirigeant}',
      'qualite_dirigeant': '${qualiteDirigeant}',
      'autre_qualite': '${autreQualite}',
      'telephone_dirigeant_whatsapp': '${telephone_dirigeant_whatsapp}',
      'cluster_id': '${clusterId}',
      'region_id': '${regionId}',
      'departement_id': '${departementId}',
      'sousprefecture_id': '${sousprefectureId}',
      'commune_id': '${communeId}',
      'localite_id': '${localiteId}',
      'zonerecensement_id': '${zonerecensementId}',
      'quartier_id': '${quartierId}',
      'ilot_creation': '${DbOdoo.res_Userilot_id}',
    };
    var wArgs = map;
    return wArgs;
  }

  Map<String, dynamic> toArrIlot() {
    // Ecriture ODOO
    var map = {
      'ilot_creation': '${DbOdoo.res_Userilot_id}',
    };
    var wArgs = map;
    return wArgs;
  }

  Map<String, dynamic> toArrInsert() {
    // INSERT ODOO
    if (cni == null) cni = "";
    if (state == null) state = "";
    if (sexe == null) sexe = "";

    if (sexe == null) sexe = "";
    if (birthday == null) birthday = "";
    if (countryId == null) countryId = 44;
    if (profession == null) profession = "";
    if (lieu_naissance == null) lieu_naissance = "";

    if (terminal == null) terminal = "";
    if (dateValiditePiece == null) dateValiditePiece = "";
    if (nomRepondant == null) nomRepondant = "";
    if (fonctionRepondant == null) fonctionRepondant = "";
    if (autre_fonction_repondant == null) autre_fonction_repondant = "";
    if (contact1Repondant == null) contact1Repondant = "";
    if (contact2Repondant == null) contact2Repondant = "";
    if (emailRepondant == null) emailRepondant = "";
    if (nomPrenomDirigeant == null) nomPrenomDirigeant = "";
    if (emailDirigeant == null) emailDirigeant = "";

    if (telephoneDirigeant == null) telephoneDirigeant = "";
    if (adresseDirigeant == null) adresseDirigeant = "";
    if (qualiteDirigeant == null) qualiteDirigeant = "";
    if (autreQualite == null) autreQualite = "";
    if (telephone_dirigeant_whatsapp == null) telephone_dirigeant_whatsapp = "";

    if (milieuImplantation == null) milieuImplantation = "";
    if (districtId == null) districtId = 0;
    if (naturePiece == null) naturePiece = "";

    districtId = 29;
    clusterId = DbOdoo.res_Usercluster_id;
    regionId = DbOdoo.res_Userregion_id;
    departementId = DbOdoo.res_Userdepartement_id;
    sousprefectureId = DbOdoo.res_Usersousprefecture_id;
    communeId = DbOdoo.res_Usercommune_id;
    localiteId = DbOdoo.res_Userlocalite_id;
    zonerecensementId = DbOdoo.res_Userzonerecensement_id;
    quartierId = DbOdoo.res_Userquartier_id;

    var wArgs = {
//      'name': '${name}',
      'active': true,
      'userId': '${DbOdoo.res_UserId}',
      'ref': '',
      'nature_piece': '${naturePiece}',
      'cni': '${cni}',
      'state': '${state}',

      'sexe': '${sexe}',
      'birthday': '${birthday}',
      'country_id': '${countryId}',
      'lieu_naissance': '${lieu_naissance}',
      'profession': '${profession}',

      'terminal': '${terminal}',
      'date_validite_piece': '${dateValiditePiece}',
      'milieu_implantation': '${milieuImplantation}',
//      'district_id': '${districtId}',
      'nom_repondant': '${nomRepondant}',
      'fonction_repondant': '${fonctionRepondant}',
      'autre_fonction_repondant': '${autre_fonction_repondant}',
      'contact_1_repondant': '${contact1Repondant}',
      'contact_2_repondant': '${contact2Repondant}',
      'email_repondant': '${emailRepondant}',
      'nom_prenom_dirigeant': '${nomPrenomDirigeant}',
      'email_dirigeant': '${emailDirigeant}',
      'name': '${name}',

      'telephone_dirigeant': '${telephoneDirigeant}',
      'adresse_dirigeant': '${adresseDirigeant}',
      'qualite_dirigeant': '${qualiteDirigeant}',
      'autre_qualite': '${autreQualite}',
      'telephone_dirigeant_whatsapp': '${telephone_dirigeant_whatsapp}',
      'cluster_id': '${clusterId}',
      'region_id': '${regionId}',
      'departement_id': '${departementId}',
      'sousprefecture_id': '${sousprefectureId}',
      'commune_id': '${communeId}',
      'localite_id': '${localiteId}',
      'zonerecensement_id': '${zonerecensementId}',
      'quartier_id': '${quartierId}',
      'ilot_creation': '-1',
//      'ImageBase64_PHOTO_ENTR': '${ImageBase64_PHOTO_ENTR}',
//      'ID3_templateBytes64': '${ID3_templateBytes64}',
//      'ID3_croppedBytes64': '${ID3_croppedBytes64}',
    };
    return wArgs;
  }

  Map<String, dynamic> toArr() {
    if (cni == null) cni = "";
    if (state == null) state = "";
    if (sexe == null) sexe = "";

    if (sexe == null) sexe = "";
    if (birthday == null) birthday = "";
    if (countryId == null) countryId = 44;
    if (profession == null) profession = "";

    if (terminal == null) terminal = "";
    if (dateValiditePiece == null) dateValiditePiece = "";
    if (nomRepondant == null) nomRepondant = "";
    if (fonctionRepondant == null) fonctionRepondant = "";
    if (autre_fonction_repondant == null) autre_fonction_repondant = "";
    if (contact1Repondant == null) contact1Repondant = "";
    if (contact2Repondant == null) contact2Repondant = "";
    if (emailRepondant == null) emailRepondant = "";
    if (nomPrenomDirigeant == null) nomPrenomDirigeant = "";
    if (emailDirigeant == null) emailDirigeant = "";

    if (telephoneDirigeant == null) telephoneDirigeant = "";
    if (adresseDirigeant == null) adresseDirigeant = "";
    if (qualiteDirigeant == null) qualiteDirigeant = "";
    if (autreQualite == null) autreQualite = "";
    if (telephone_dirigeant_whatsapp == null) telephone_dirigeant_whatsapp = "";

    if (milieuImplantation == null) milieuImplantation = "";
    if (districtId == null) districtId = 0;
    if (naturePiece == null) naturePiece = "";

    districtId = 29;
    clusterId = DbOdoo.res_Usercluster_id;
    regionId = DbOdoo.res_Userregion_id;
    departementId = DbOdoo.res_Userdepartement_id;
    sousprefectureId = DbOdoo.res_Usersousprefecture_id;
    communeId = DbOdoo.res_Usercommune_id;
    localiteId = DbOdoo.res_Userlocalite_id;
    zonerecensementId = DbOdoo.res_Userzonerecensement_id;
    quartierId = DbOdoo.res_Userquartier_id;

    var wArgs = {
//      'name': '${name}',
      'active': true,

      'userId': '${DbOdoo.res_UserId}',
      'ref': '',

      'nature_piece': '${naturePiece}',
      'cni': '${cni}',
      'state': '${state}',

      'sexe': '${sexe}',
      'birthday': '${birthday}',
      'country_id': '${countryId}',
      'profession': '${profession}',

      'terminal': '${terminal}',
      'date_validite_piece': '${dateValiditePiece}',
      'milieu_implantation': '${milieuImplantation}',
//      'district_id': '${districtId}',
      'nom_repondant': '${nomRepondant}',
      'fonction_repondant': '${fonctionRepondant}',
      'autre_fonction_repondant': '${autre_fonction_repondant}',
      'contact_1_repondant': '${contact1Repondant}',
      'contact_2_repondant': '${contact2Repondant}',
      'email_repondant': '${emailRepondant}',
      'nom_prenom_dirigeant': '${nomPrenomDirigeant}',
      'email_dirigeant': '${emailDirigeant}',
      'name': '${name}',

      'telephone_dirigeant': '${telephoneDirigeant}',
      'adresse_dirigeant': '${adresseDirigeant}',
      'qualite_dirigeant': '${qualiteDirigeant}',
      'autre_qualite': '${autreQualite}',
      'telephone_dirigeant_whatsapp': '${telephone_dirigeant_whatsapp}',
      'cluster_id': '${clusterId}',
      'region_id': '${regionId}',
      'departement_id': '${departementId}',
      'sousprefecture_id': '${sousprefectureId}',
      'commune_id': '${communeId}',
      'localite_id': '${localiteId}',
      'zonerecensement_id': '${zonerecensementId}',
      'quartier_id': '${quartierId}',
      'ilot_creation': '${DbOdoo.res_Userilot_id}',
      'ImageBase64_PHOTO_ENTR': '${ImageBase64_PHOTO_ENTR}',
      'ID3_templateBytes64': '${ID3_templateBytes64}',
      'ID3_croppedBytes64': '${ID3_croppedBytes64}',
    };
    return wArgs;
  }

  String desc() {
    if (cni == null) cni = "";
    if (state == null) state = "";
    if (sexe == null) sexe = "";
    if (sexe == null) sexe = "";
    if (birthday == null) birthday = "";
    if (lieu_naissance == null) lieu_naissance = "";
    if (countryId == null) countryId = 44;
    if (profession == null) profession = "";
    if (terminal == null) terminal = "";
    if (dateValiditePiece == null) dateValiditePiece = "";
    if (nomRepondant == null) nomRepondant = "";
    if (fonctionRepondant == null) fonctionRepondant = "";
    if (autre_fonction_repondant == null) autre_fonction_repondant = "";
    if (contact1Repondant == null) contact1Repondant = "";
    if (contact2Repondant == null) contact2Repondant = "";
    if (emailRepondant == null) emailRepondant = "";
    if (nomPrenomDirigeant == null) nomPrenomDirigeant = "";
    if (emailDirigeant == null) emailDirigeant = "";

    if (telephoneDirigeant == null) telephoneDirigeant = "";
    if (adresseDirigeant == null) adresseDirigeant = "";
    if (qualiteDirigeant == null) qualiteDirigeant = "";
    if (autreQualite == null) autreQualite = "";
    if (telephone_dirigeant_whatsapp == null) telephone_dirigeant_whatsapp = "";

    if (milieuImplantation == null) milieuImplantation = "";
    if (districtId == null) districtId = 0;

    clusterId = DbOdoo.res_Usercluster_id;
    regionId = DbOdoo.res_Userregion_id;
    departementId = DbOdoo.res_Userdepartement_id;
    sousprefectureId = DbOdoo.res_Usersousprefecture_id;
    communeId = DbOdoo.res_Usercommune_id;
    localiteId = DbOdoo.res_Userlocalite_id;
    zonerecensementId = DbOdoo.res_Userzonerecensement_id;
    quartierId = DbOdoo.res_Userquartier_id;

    String wArgs = '\n' +
        '     id = ${id} \n' +
        '     active =  true  \n' +
        '     userId = ${DbOdoo.res_UserId} \n' +
        'ref =  \n' +
        '     naturepiece = ${naturePiece} \n' +
        '     cni = ${cni} \n' +
        '     state = ${state} \n' +
        '     sexe = ${sexe} \n' +
        '     birthday = ${birthday} \n' +
        '     countryId = ${countryId} \n' +
        '     lieu_naissance = ${lieu_naissance} \n' +
        '@profession = ${profession} \n' +
        '     terminal = ${terminal} \n' +
        '     dateValiditePiece = ${dateValiditePiece} \n' +
        '@milieuImplantation = ${milieuImplantation} \n' +
        '@districtId = ${districtId} \n\n' +
        '     nomRepondant = ${nomRepondant} \n' +
        '     fonctionRepondant = ${fonctionRepondant} \n' +
        '     autre_fonction_repondant = ${autre_fonction_repondant} \n' +
        '     contact1Repondant = ${contact1Repondant} \n' +
        '     contact2Repondant = ${contact2Repondant} \n' +
        '     emailRepondant = ${emailRepondant} \n\n' +
        '     name = ${name} \n\n' +
        '     nomprenomdirigeant = ${nomPrenomDirigeant} \n' +
        '     emaildirigeant = ${emailDirigeant} \n' +
        '     telephonedirigeant = ${telephoneDirigeant} \n' +
        '     adressedirigeant = ${adresseDirigeant} \n' +
        '     qualiteDirigeant = ${qualiteDirigeant} \n' +
        '     autreQualite = ${autreQualite} \n\n' +
        '     telephone_dirigeant_whatsapp = ${telephone_dirigeant_whatsapp} \n\n' +
        '     clusterid = ${clusterId} \n' +
        '     regionId = ${regionId} \n' +
        '     departementId = ${departementId} \n' +
        '     sousprefectureId = ${sousprefectureId} \n' +
        '     communeId = ${communeId} \n' +
        '     localiteId = ${localiteId} \n' +
        '     zonerecensementId = ${zonerecensementId} \n' +
        '     quartierId = ${quartierId} ';

    return wArgs;
  }
}
