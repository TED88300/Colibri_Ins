import 'package:colibri/Tools/DbOdoo.dart';
import 'package:colibri/Tools/DbTools.dart';

class Activite_ins {
  int? id;
  int? ACT_TRANSF_OK = 0;
  int? Id_Tmp = 0;
  int? ACT_Id_Server = 0;

  String? name = "";
  String? createDate;
  String? displayName;
  String? date;


  String? ref;
  String? lang;
  String? tz;
  int? userId;
  String? vat;
  String? website;
  String? state;
  String? comment;

  String? barcode;
  bool? active;
  String? street;
  String? street2;
  String? zip;
  String? city;
  int? stateId;
  int? countryId;
  String? email;
  String? telephoneFixe1Entreprise;
  String? mobile;

  int? createUid;
  int? writeUid;
  String? writeDate;
  int? messageMainAttachmentId;
  int? entreprenantId;

  String? activityBirthday; // Date
  String? regimeFiscale;
  String? chiffreAffaireTaxable;
  double? minCa;
  double? maxCa;
  int? secteurId;
  String? typeTaxe;
  String? cga;
  String? dateAdhesion;
  String? refCga;
  String? periodeImposition;
  double? tauxImposition;
  String? tailleActivite;
  String? ciap;
  double? longueur;
  double? largeur;
  int? odp;
  String? bauxLoyer;
  double? pubLongueur;
  double? pubLargeur;
  double? pubEnMettreCarre;
  double? pubLongueur2;
  double? pubLargeur2;
  double? surface_local_en_mettre_carre;
  int? pubEnMettreCarre2 = 0;
  String? partnerLatitude;
  String? partnerLongitude;
  String? autreTypeActivite = "";
  int? activicte2;
  String? etatActivite;
  String? formeJuridique;
  String? autreFormeJuridique;
  String? capitalEnAction;
  String? manquePersonnelQualifie;
  String? coutEleveMainOeuvre;
  String? formaliteAdministrativeContraignante;
  String? taxeImpotEleve;
  String? coutTranportEleve;
  String? mauvaisEtatInfrastructure;
  String? difficulteApprovisionnementMatierePremiere;
  String? procedureContentieux;
  String? ecoulementProduction;
  String? accesAuTechnologie;
  String? manqueMachine;
  String? manqueExpertiseTechnique;
  String? manqueLocalAdapte;
  String? accesCommandePublic;
  String? accesStructureAppui;
  String? accesCreditBancaire;
  String? approvisionnementEnergie;
  String? concurrenceDeloyale;
  String? corruption;
  String? contrainteRencontre;
  String? autreContrainte;
  String? preciseContrainte;
  String? aucuneContrainte;

  String? autreActivte;
  String? autre_activite_secondaire;
  String? autreActivitePrecision;

  String? codeCiap;
  String? connexionInternet;

  String? declarationCnps;
  String? designationActivite;
  String? docFinExercice;
  int? effectifTotal;


  String? etatFonctionnementEntreprise;
  String? nameActiviteSecondaire;
  String? nombreEtablissement;
  String? numCompteContribuable;
  String? numRegistreCommerce;
  int? numeroCnps;
  String? numeroCnpsCommunicable;
  String? periodicite;
  String? statutComptabiliteFormel;
  String? statutCompteContribuable;
  String? statutEntreprise;
  String? statutRegistreCommerce;

  String? typeEntreprise;
  int? zoneId;
  int? localiteId;
  int? quartierId;
  int? ilotId;
  String? zone;
  String? dateDebutExploitation;
  String? activictePrincipal;
  String? gpsPrecision;
  String? serviceEnLigne;
  String? hasActivicteSecondaire;
  String? raisonSocial;
  String? adresseGeographiqueEntreprise;
  String? observation;
  String? sigleEntreprise;
  String? telephoneFixe2Entreprise;
  String? telephonePortable1Entreprise;
  String? telephonePortable2Entreprise;
  String? emailEntreprise;
  String? siteWebEntreprise;
  String? boitePostaleEntreprise;
  String? typeActivite;
  String? type_activite_formel_informel;
  int? clusterId;
  int? regionId;
  int? departementId;
  int? sousprefectureId;
  int? communeId;
  String? addresseGeo1;
  String? addresseGeo2;
  int? activiteTypeId;

  String? dateFinEntretien;
  String? resultatEntretien;
  String? nombreVisite;
  String? observationEnquete;

  String? zone_implantation_entreprise;
  String? libelle_zone_implantation_entreprise;
  String? numero_batiment;
  String? numero_sequence_batiment_entreprise;

  String? ImageBase64_PHOTO_ACT;

  Activite_ins(
      {this.id,
      this.name,
      this.createDate,
      this.displayName,
      this.date,
      this.ref,
      this.lang,
      this.tz,
      this.userId,
      this.vat,
      this.website,
        this.state,
      this.comment,

      this.barcode,
      this.active,
      this.street,
      this.street2,
      this.zip,
      this.city,
      this.stateId,
      this.countryId,
      this.email,
      this.telephoneFixe1Entreprise,
      this.mobile,
      this.createUid,
      this.writeUid,
      this.writeDate,
      this.messageMainAttachmentId,
      this.entreprenantId,
      this.activityBirthday,
      this.regimeFiscale,
      this.chiffreAffaireTaxable,
      this.minCa,
      this.maxCa,
      this.secteurId,
      this.typeTaxe,
      this.cga,
      this.dateAdhesion,
      this.refCga,
      this.periodeImposition,
      this.tauxImposition,
      this.tailleActivite,
      this.ciap,
      this.longueur,
      this.largeur,
      this.odp,
      this.bauxLoyer,
      this.pubLongueur,
      this.pubLargeur,
      this.pubEnMettreCarre,
      this.pubLongueur2,
      this.pubLargeur2,
        this.surface_local_en_mettre_carre,
      this.pubEnMettreCarre2,
      this.partnerLatitude,
      this.partnerLongitude,
      this.autreTypeActivite,
      this.activicte2,
      this.etatActivite,
      this.formeJuridique,
      this.autreFormeJuridique,
      this.capitalEnAction,

      this.manquePersonnelQualifie,
      this.coutEleveMainOeuvre,
      this.formaliteAdministrativeContraignante,
      this.taxeImpotEleve,
      this.coutTranportEleve,
      this.mauvaisEtatInfrastructure,
      this.difficulteApprovisionnementMatierePremiere,
      this.procedureContentieux,
      this.ecoulementProduction,
      this.accesAuTechnologie,
      this.manqueMachine,
      this.manqueExpertiseTechnique,
      this.manqueLocalAdapte,
      this.accesCommandePublic,
      this.accesStructureAppui,
      this.accesCreditBancaire,
      this.approvisionnementEnergie,
      this.concurrenceDeloyale,
      this.corruption,
      this.autreContrainte,
      this.preciseContrainte,
      this.aucuneContrainte,
      this.autreActivte,
      this.autre_activite_secondaire,
      this.autreActivitePrecision,

      this.codeCiap,
      this.connexionInternet,
      this.declarationCnps,
      this.designationActivite,

      this.docFinExercice,
      this.effectifTotal,
      this.etatFonctionnementEntreprise,

      this.nameActiviteSecondaire,
      this.nombreEtablissement,
      this.numCompteContribuable,
      this.numRegistreCommerce,
      this.numeroCnps,
      this.numeroCnpsCommunicable,
      this.periodicite,
      this.statutComptabiliteFormel,
      this.statutCompteContribuable,
      this.statutEntreprise,
      this.statutRegistreCommerce,
      this.typeEntreprise,
      this.zoneId,
      this.localiteId,
      this.quartierId,
      this.ilotId,
      this.zone,
      this.dateDebutExploitation,
      this.activictePrincipal,
      this.gpsPrecision,
      this.serviceEnLigne,
      this.hasActivicteSecondaire,
      this.raisonSocial,
      this.adresseGeographiqueEntreprise,
      this.observation,
      this.sigleEntreprise,
      this.telephoneFixe2Entreprise,
      this.telephonePortable1Entreprise,
      this.telephonePortable2Entreprise,
      this.emailEntreprise,
      this.siteWebEntreprise,
      this.boitePostaleEntreprise,
      this.typeActivite,
      this.clusterId,
      this.regionId,
      this.departementId,
      this.sousprefectureId,
      this.communeId,
      this.addresseGeo1,
      this.addresseGeo2,
      this.activiteTypeId,
      zone_implantation_entreprise,
      libelle_zone_implantation_entreprise,
      numero_batiment,
      numero_sequence_batiment_entreprise


      });

  void init() {
    zoneId = DbOdoo.res_Userzonerecensement_id;
    localiteId = DbOdoo.res_Userlocalite_id;
    quartierId = DbOdoo.res_Userquartier_id;
    ilotId = DbOdoo.res_Userilot_id;
    clusterId = DbOdoo.res_Usercluster_id;
    regionId = DbOdoo.res_Userregion_id;
    departementId = DbOdoo.res_Userdepartement_id;
    sousprefectureId = DbOdoo.res_Usersousprefecture_id;
    communeId = DbOdoo.res_Usercommune_id;




    if (id == null) id = 0;
    if (ACT_Id_Server == null) ACT_Id_Server = -1;
    if (name == null) name = "";
    if (createDate == null) createDate = "";
    if (displayName == null) displayName = "";
    if (date == null) date = "";

    if (ref == null) ref = "";
    if (lang == null) lang = "";
    if (tz == null) tz = "";
    if (userId == null) userId = 0;
    if (vat == null) vat = "";
    if (website == null) website = "";
    if (state == null) state = "";
    if (comment == null) comment = "";

    if (barcode == null) barcode = "";
    if (active == null) active = false;
    if (street == null) street = "";
    if (street2 == null) street2 = "";
    if (zip == null) zip = "";
    if (city == null) city = "";
    if (stateId == null) stateId = 0;
    if (countryId == null) countryId = 0;
    if (email == null) email = "";
    if (telephoneFixe1Entreprise == null) telephoneFixe1Entreprise = "";
    if (mobile == null) mobile = "";
    if (createUid == null) createUid = 0;
    if (writeUid == null) writeUid = 0;
    if (writeDate == null) writeDate = "";
    if (messageMainAttachmentId == null) messageMainAttachmentId = 0;
    if (entreprenantId == null) entreprenantId = 0;
    if (activityBirthday == null) activityBirthday = "";
    if (regimeFiscale == null) regimeFiscale = "";
    if (chiffreAffaireTaxable == null) chiffreAffaireTaxable = "";
    if (minCa == null) minCa = 0.0;
    if (maxCa == null) maxCa = 0.0;
    if (secteurId == null) secteurId = 0;
    if (typeTaxe == null) typeTaxe = "";
    if (cga == null) cga = "";
    if (dateAdhesion == null) dateAdhesion = "";
    if (refCga == null) refCga = "";
    if (periodeImposition == null) periodeImposition = "";
    if (tauxImposition == null) tauxImposition = 0;
    if (tailleActivite == null) tailleActivite = "";
    if (ciap == null) ciap = "";
    if (longueur == null) longueur = 0;
    if (largeur == null) largeur = 0;
    if (odp == null) odp = 0;
    if (bauxLoyer == null) bauxLoyer = "";
    if (pubLongueur == null) pubLongueur = 0;
    if (pubLargeur == null) pubLargeur = 0;
    if (pubEnMettreCarre == null) pubEnMettreCarre = 0;
    if (pubLongueur2 == null) pubLongueur2 = 0;
    if (pubLargeur2 == null) pubLargeur2 = 0;
    if (surface_local_en_mettre_carre == null) surface_local_en_mettre_carre = 0;
    if (pubEnMettreCarre2 == null) pubEnMettreCarre2 = 0;
    if (partnerLatitude == null) partnerLatitude = "";
    if (partnerLongitude == null) partnerLongitude = "";
    if (autreTypeActivite == null) autreTypeActivite = "";
    if (activicte2 == null) activicte2 = 0;
    if (etatActivite == null) etatActivite = "";
    if (formeJuridique == null) formeJuridique = "";
    if (autreFormeJuridique == null) autreFormeJuridique = "";
    if (capitalEnAction == null) capitalEnAction = "";

    if (manquePersonnelQualifie == null) manquePersonnelQualifie = "";
    if (coutEleveMainOeuvre == null) coutEleveMainOeuvre = "";
    if (formaliteAdministrativeContraignante == null) formaliteAdministrativeContraignante = "";
    if (taxeImpotEleve == null) taxeImpotEleve = "";
    if (coutTranportEleve == null) coutTranportEleve = "";
    if (mauvaisEtatInfrastructure == null) mauvaisEtatInfrastructure = "";
    if (difficulteApprovisionnementMatierePremiere == null) difficulteApprovisionnementMatierePremiere = "";
    if (procedureContentieux == null) procedureContentieux = "";
    if (ecoulementProduction == null) ecoulementProduction = "";
    if (accesAuTechnologie == null) accesAuTechnologie = "";
    if (manqueMachine == null) manqueMachine = "";
    if (manqueExpertiseTechnique == null) manqueExpertiseTechnique = "";
    if (manqueLocalAdapte == null) manqueLocalAdapte = "";
    if (accesCommandePublic == null) accesCommandePublic = "";
    if (accesStructureAppui == null) accesStructureAppui = "";
    if (accesCreditBancaire == null) accesCreditBancaire = "";
    if (approvisionnementEnergie == null) approvisionnementEnergie = "";
    if (concurrenceDeloyale == null) concurrenceDeloyale = "";
    if (corruption == null) corruption = "";

    if (contrainteRencontre == null) contrainteRencontre = "";
    if (autreContrainte == null) autreContrainte = "";
    if (preciseContrainte == null) preciseContrainte = "";
    if (aucuneContrainte == null) aucuneContrainte = "";
    if (autreActivte == null) autreActivte = "";

    if (autre_activite_secondaire == null) autre_activite_secondaire = "";
    if (autreActivitePrecision == null) autreActivitePrecision = "";
    if (codeCiap == null) codeCiap = "";
    if (connexionInternet == null) connexionInternet = "";
    if (declarationCnps == null) declarationCnps = "";
    if (designationActivite == null) designationActivite = "";
    if (docFinExercice == null) docFinExercice = "";
    if (effectifTotal == null) effectifTotal = 0;
    if (etatFonctionnementEntreprise == null) etatFonctionnementEntreprise = "";
    if (nameActiviteSecondaire == null) nameActiviteSecondaire = "";
    if (nombreEtablissement == null) nombreEtablissement = "";
    if (numCompteContribuable == null) numCompteContribuable = "";
    if (numRegistreCommerce == null) numRegistreCommerce = "";
    if (numeroCnps == null) numeroCnps = 0;
    if (numeroCnpsCommunicable == null) numeroCnpsCommunicable = "";
    if (periodicite == null) periodicite = "";
    if (statutComptabiliteFormel == null) statutComptabiliteFormel = "";
    if (statutCompteContribuable == null) statutCompteContribuable = "";
    if (statutEntreprise == null) statutEntreprise = "";
    if (statutRegistreCommerce == null) statutRegistreCommerce = "";
    if (typeEntreprise == null) typeEntreprise = "";
    if (zone == null) zone = "";

    if (dateDebutExploitation == null) dateDebutExploitation = "";
    if (activictePrincipal == null) activictePrincipal = "";
    if (gpsPrecision == null) gpsPrecision = "";
    if (serviceEnLigne == null) serviceEnLigne = "";
    if (hasActivicteSecondaire == null) hasActivicteSecondaire = "";
    if (raisonSocial == null) raisonSocial = "";
    if (adresseGeographiqueEntreprise == null) adresseGeographiqueEntreprise = "";
    if (observation == null) observation = "";
    if (sigleEntreprise == null) sigleEntreprise = "";
    if (telephoneFixe2Entreprise == null) telephoneFixe2Entreprise = "";
    if (telephonePortable1Entreprise == null) telephonePortable1Entreprise = "";
    if (telephonePortable2Entreprise == null) telephonePortable2Entreprise = "";
    if (emailEntreprise == null) emailEntreprise = "";
    if (siteWebEntreprise == null) siteWebEntreprise = "";
    if (boitePostaleEntreprise == null) boitePostaleEntreprise = "";
    if (typeActivite == null) typeActivite = "";
    if (addresseGeo1 == null) addresseGeo1 = "";
    if (addresseGeo2 == null) addresseGeo2 = "";
    if (activiteTypeId == null) activiteTypeId = 0;
    if (dateFinEntretien == null) dateFinEntretien = "";
    if (resultatEntretien == null) resultatEntretien = "";
    if (nombreVisite == null) nombreVisite = "";
    if (observationEnquete == null) observationEnquete = "";
  }

  Activite_ins.fromJson(Map<String, dynamic> json) {
    int wuser_id = 0;
    if (json['user_id'].toString().compareTo("null") != 0) wuser_id = json['user_id'];


    int wcountry_id = 0;
    if (json['country_id'].toString().compareTo("null") != 0) wcountry_id = json['country_id'];
    int wcolor = 0;
    if (json['color'].toString().compareTo("null") != 0) wcolor = json['color'];
    int wcreate_uid = 0;
    if (json['create_uid'].toString().compareTo("null") != 0) wcreate_uid = json['create_uid'];
    int wwrite_uid = 0;
    if (json['write_uid'].toString().compareTo("null") != 0) wwrite_uid = json['write_uid'];
    int wmessage_bounce = 0;
    if (json['message_bounce'].toString().compareTo("null") != 0) wmessage_bounce = json['message_bounce'];



    int wentreprenant_id = 0;
    if (json['entreprenant_id'].toString().compareTo("null") != 0) wentreprenant_id = json['entreprenant_id'];
    int wfiscal_year_id = 0;
    if (json['fiscal_year_id'].toString().compareTo("null") != 0) wfiscal_year_id = json['fiscal_year_id'];
    int wsecteur_id = 0;
    if (json['secteur_id'].toString().compareTo("null") != 0) wsecteur_id = json['secteur_id'];

    double wtaux_imposition = 0;
    if (json['taux_imposition'].toString().compareTo("null") != 0) wtaux_imposition = double.parse(json['taux_imposition'].toString());

    double wlongueur = 0;
    if (json['longueur'].toString().compareTo("null") != 0) wlongueur = double.parse(json['longueur'].toString());
    double wlargeur = 0;
    if (json['largeur'].toString().compareTo("null") != 0) wlargeur = double.parse(json['largeur'].toString());
    double wpub_longueur = 0;
    if (json['pub_longueur_2'].toString().compareTo("null") != 0) wpub_longueur = double.parse(json['pub_longueur_2'].toString());
    double wpub_largeur = 0;
    if (json['pub_largeur_2'].toString().compareTo("null") != 0) wpub_largeur = double.parse(json['pub_largeur_2'].toString());

    double wpub_longueur_2 = 0;
    if (json['pub_longueur_2'].toString().compareTo("null") != 0) wpub_longueur_2 = double.parse(json['pub_longueur_2'].toString());
    double wpub_largeur_2 = 0;
    if (json['pub_largeur_2'].toString().compareTo("null") != 0) wpub_largeur_2 = double.parse(json['pub_largeur_2'].toString());


    double wsurface_local_en_mettre_carre = 0;
    if (json['surface_local_en_mettre_carre'].toString().compareTo("null") != 0)
      {
        if (json['surface_local_en_mettre_carre'].toString().isNotEmpty)
        {
          wsurface_local_en_mettre_carre = double.parse(json['surface_local_en_mettre_carre'].toString());
        }
      }


    int wchiffre_idu = 0; //    if (json['chiffre_idu'].toString().compareTo("null") != 0) wchiffre_idu = json['chiffre_idu'];
    int wactivicte_2 = 0;
    if (json['activicte_2'].toString().compareTo("null") != 0) wactivicte_2 = json['activicte_2'];
    double wmontant_action = 0;
    if (json['montant_action'].toString().compareTo("null") != 0) wmontant_action = double.parse(json['montant_action'].toString());
    double wpart_sociale_actionnaire = 0;
    if (json['part_sociale_actionnaire'].toString().compareTo("null") != 0) wpart_sociale_actionnaire = double.parse(json['part_sociale_actionnaire'].toString());
    double wca_ht_n_1 = 0;
    if (json['ca_ht_n_1'].toString().compareTo("null") != 0) wca_ht_n_1 = double.parse(json['ca_ht_n_1'].toString());
    double wca_ht_n_2 = 0;
    if (json['ca_ht_n_2'].toString().compareTo("null") != 0) wca_ht_n_2 = double.parse(json['ca_ht_n_2'].toString());
    double wca_ht_n_3 = 0;
    if (json['ca_ht_n_3'].toString().compareTo("null") != 0) wca_ht_n_3 = double.parse(json['ca_ht_n_3'].toString());

    double wcapital_social_n_1 = 0;
    if (json['capital_social_n_1'].toString().compareTo("null") != 0) wcapital_social_n_1 = double.parse(json['capital_social_n_1'].toString());
    double wcapital_social_n_2 = 0;
    if (json['capital_social_n_2'].toString().compareTo("null") != 0) wcapital_social_n_2 = double.parse(json['capital_social_n_2'].toString());
    double wcapital_social_n_3 = 0;
    if (json['capital_social_n_3'].toString().compareTo("null") != 0) wcapital_social_n_3 = double.parse(json['capital_social_n_3'].toString());
    double wcapital_social_n_4 = 0;
    if (json['capital_social_n_4'].toString().compareTo("null") != 0) wcapital_social_n_4 = double.parse(json['capital_social_n_4'].toString());

    double wvaleur_ajoute_brute_n_1 = 0;
    if (json['valeur_ajoute_brute_n_1'].toString().compareTo("null") != 0) wvaleur_ajoute_brute_n_1 = double.parse(json['valeur_ajoute_brute_n_1'].toString());
    double wvaleur_ajoute_brute_n_2 = 0;
    if (json['valeur_ajoute_brute_n_2'].toString().compareTo("null") != 0) wvaleur_ajoute_brute_n_2 = double.parse(json['valeur_ajoute_brute_n_2'].toString());
    double wvaleur_ajoute_brute_n_3 = 0;
    if (json['valeur_ajoute_brute_n_3'].toString().compareTo("null") != 0) wvaleur_ajoute_brute_n_3 = double.parse(json['valeur_ajoute_brute_n_3'].toString());
    double wvaleur_export_n_1 = 0;
    if (json['valeur_export_n_1'].toString().compareTo("null") != 0) wvaleur_export_n_1 = double.parse(json['valeur_export_n_1'].toString());
    double wvaleur_export_n_2 = 0;
    if (json['valeur_export_n_2'].toString().compareTo("null") != 0) wvaleur_export_n_2 = double.parse(json['valeur_export_n_2'].toString());
    double wvaleur_export_n_3 = 0;
    if (json['valeur_export_n_3'].toString().compareTo("null") != 0) wvaleur_export_n_3 = double.parse(json['valeur_export_n_3'].toString());

    int wdeux_1er_chiffre_rm = 0; //   if (json['deux_1er_chiffre_rm'].toString().compareTo("null") != 0) wdeux_1er_chiffre_rm = json['deux_1er_chiffre_rm'];
    int weffectif_total = 0;
    if (json['effectif_total'].toString().compareTo("null") != 0) weffectif_total = json['effectif_total'];
    double wmontant = 0;
    if (json['montant'].toString().compareTo("null") != 0) wmontant = double.parse(json['montant'].toString());
    double wmontant_charge_mensuelle = 0;
    if (json['montant_charge_mensuelle'].toString().compareTo("null") != 0) wmontant_charge_mensuelle = double.parse(json['montant_charge_mensuelle'].toString());
    double wmontant_total_actif = 0;
    if (json['montant_total_actif'].toString().compareTo("null") != 0) wmontant_total_actif = double.parse(json['montant_total_actif'].toString());
    double wmontant_total_actif_immobiliser = 0;
    if (json['montant_total_actif_immobiliser'].toString().compareTo("null") != 0) wmontant_total_actif_immobiliser = double.parse(json['montant_total_actif_immobiliser'].toString());
    double wmontant_total_capiteaux_propre = 0;
    if (json['montant_total_capiteaux_propre'].toString().compareTo("null") != 0) wmontant_total_capiteaux_propre = double.parse(json['montant_total_capiteaux_propre'].toString());
    double wmontant_total_charge_ordinaire = 0;
    if (json['montant_total_charge_ordinaire'].toString().compareTo("null") != 0) wmontant_total_charge_ordinaire = double.parse(json['montant_total_charge_ordinaire'].toString());
    double wmontant_total_impot_taxe = 0;
    if (json['montant_total_impot_taxe'].toString().compareTo("null") != 0) wmontant_total_impot_taxe = double.parse(json['montant_total_impot_taxe'].toString());
    double wmontant_total_ressource_stable = 0;
    if (json['montant_total_ressource_stable'].toString().compareTo("null") != 0) wmontant_total_ressource_stable = double.parse(json['montant_total_ressource_stable'].toString());
    double wmontant_vente_maximum_realiser = 0;
    if (json['montant_vente_maximum_realiser'].toString().compareTo("null") != 0) wmontant_vente_maximum_realiser = double.parse(json['montant_vente_maximum_realiser'].toString());
    double wmontant_vente_minimum_realiser = 0;
    if (json['montant_vente_minimum_realiser'].toString().compareTo("null") != 0) wmontant_vente_minimum_realiser = double.parse(json['montant_vente_minimum_realiser'].toString());

    int wnumero_cnps = 0;
    if (json['numero_cnps'].toString().compareTo("null") != 0) wnumero_cnps = json['numero_cnps'];
    double wquatre_chiffre_rm = 0;
    if (json['quatre_chiffre_rm'].toString().compareTo("null") != 0) wquatre_chiffre_rm = double.parse(json['quatre_chiffre_rm'].toString());
    int wsept_chiffre_rm = 0;
    if (json['sept_chiffre_rm'].toString().compareTo("null") != 0) wsept_chiffre_rm = json['sept_chiffre_rm'];
    int wzone_id = 0;
    if (json['zone_id'].toString().compareTo("null") != 0) wzone_id = json['zone_id'];
    int wlocalite_id = 0;
    if (json['localite_id'].toString().compareTo("null") != 0) wlocalite_id = json['localite_id'];
    int wquartier_id = 0;
    if (json['quartier_id'].toString().compareTo("null") != 0) wquartier_id = json['quartier_id'];
    int wilot_id = 0;
    if (json['ilot_id'].toString().compareTo("null") != 0) wilot_id = json['ilot_id'];
    int wcluster_id = 0;
    if (json['cluster_id'].toString().compareTo("null") != 0) wcluster_id = json['cluster_id'];
    int wregion_id = 0;
    if (json['region_id'].toString().compareTo("null") != 0) wregion_id = json['region_id'];
    int wdepartement_id = 0;
    if (json['departement_id'].toString().compareTo("null") != 0) wdepartement_id = json['departement_id'];
    int wsousprefecture_id = 0;
    if (json['sousprefecture_id'].toString().compareTo("null") != 0) wsousprefecture_id = json['sousprefecture_id'];
    int wcommune_id = 0;
    if (json['commune_id'].toString().compareTo("null") != 0) wcommune_id = json['commune_id'];

    String wzone_implantation_entreprise = "0";
    if (json['zone_implantation_entreprise'].toString().compareTo("null") != 0) wzone_implantation_entreprise = json['zone_implantation_entreprise'];
    String wlibelle_zone_implantation_entreprise = "";
    if (json['libelle_zone_implantation_entreprise'].toString().compareTo("null") != 0) wlibelle_zone_implantation_entreprise = json['libelle_zone_implantation_entreprise'];
    String wnumero_batiment = json['numero_batiment'].toString();
    String wnumero_sequence_batiment_entreprise = json['numero_sequence_batiment_entreprise'].toString();


    int wACT_Id_Server = 0;
    if (json['ACT_Id_Server'].toString().compareTo("null") != 0) wACT_Id_Server = json['ACT_Id_Server'];


    id = json['id'];
    name = json['name'];
    createDate = json['create_date'];
    displayName = json['display_name'];
    date = json['date'];
    ref = json['ref'];
    lang = json['lang'];
    tz = json['tz'];
    userId = wuser_id;
    vat = json['vat'];
    website = json['website'];
    state = json['state'];
    comment = json['comment'];

    barcode = json['barcode'];
    active = json['active'];
    street = json['street'];
    street2 = json['street2'];
    zip = json['zip'];
    city = json['city'];
//    stateId = wstate_id;
    countryId = wcountry_id;
    email = json['email_entreprise'];
    telephoneFixe1Entreprise = json['telephone_fixe_1_entreprise'];
    mobile = json['telephone_portable_1_entreprise'];

    createUid = wcreate_uid;
    writeUid = wwrite_uid;
    writeDate = json['write_date'];
    entreprenantId = wentreprenant_id;
    activityBirthday = json['activity_birthday'];
    regimeFiscale = json['regime_fiscale'];
    chiffreAffaireTaxable = json['chiffre_affaire_taxable'];
    minCa = double.parse(json['min_ca'].toString());
    maxCa = double.parse(json['max_ca'].toString());
    secteurId = wsecteur_id;
    typeTaxe = json['type_taxe'];
    cga = json['cga'];
    dateAdhesion = json['date_adhesion'];
    refCga = json['ref_cga'];
    periodeImposition = json['periode_imposition'];
    tauxImposition = wtaux_imposition;
    tailleActivite = json['taille_activite'];
    ciap = json['ciap'];
    longueur = wlongueur;
    largeur = wlargeur;
    bauxLoyer = json['baux_loyer'];
    pubLongueur = wpub_longueur;
    pubLargeur = wpub_largeur;
    pubLongueur2 = wpub_longueur_2;
    pubLargeur2 = wpub_largeur_2;
    surface_local_en_mettre_carre = wsurface_local_en_mettre_carre;
    partnerLatitude = "${json['partner_latitude']}";
    partnerLongitude = "${json['partner_longitude']}";

    autreTypeActivite = json['autre_type_activite'].toString();
    activicte2 = wactivicte_2;
    etatActivite = json['etat_activite'];
    formeJuridique = json['forme_juridique'];
    autreFormeJuridique = json['autre_forme_juridique'];
    capitalEnAction = json['capital_en_action'];


    manquePersonnelQualifie = json['manque_personnel_qualifie'];
    coutEleveMainOeuvre = json['cout_eleve_main_oeuvre'];
    formaliteAdministrativeContraignante = json['formalite_administrative_contraignante'];
    taxeImpotEleve = json['taxe_impot_eleve'];
    coutTranportEleve = json['cout_tranport_eleve'];
    mauvaisEtatInfrastructure = json['mauvais_etat_infrastructure'];
    difficulteApprovisionnementMatierePremiere = json['difficulte_approvisionnement_matiere_premiere'];
    procedureContentieux = json['procedure_contentieux'];
    ecoulementProduction = json['ecoulement_production'];
    accesAuTechnologie = json['acces_au_technologie'];
    manqueMachine = json['manque_machine'];
    manqueExpertiseTechnique = json['manque_expertise_technique'];
    manqueLocalAdapte = json['manque_local_adapte'];
    accesCommandePublic = json['acces_commande_public'];
    accesStructureAppui = json['acces_structure_appui'];
    accesCreditBancaire = json['acces_credit_bancaire'];
    approvisionnementEnergie = json['approvisionnement_energie'];
    concurrenceDeloyale = json['concurrence_deloyale'];
    corruption = json['corruption'];
    autreContrainte = json['autre_contrainte'];
    preciseContrainte = json['precise_contrainte'];
    aucuneContrainte = json['aucune_contrainte'];
    autreActivte = json['autre_activte'];
    autre_activite_secondaire = json['autre_activite_secondaire'];
    autreActivitePrecision = json['autre_activite_precision'];
    codeCiap = json['code_ciap'];
    connexionInternet = json['connexion_internet'];
    declarationCnps = json['declaration_cnps'];
    designationActivite = json['designation_activite'];
    docFinExercice = json['doc_fin_exercice'];
    effectifTotal = weffectif_total;
    etatFonctionnementEntreprise = json['etat_fonctionnement_entreprise'];
    nameActiviteSecondaire = json['name_activite_secondaire'];
    nombreEtablissement = json['nombre_etablissement'];
    numCompteContribuable = json['num_compte_contribuable'];
    numRegistreCommerce = json['num_registre_commerce'];
    numeroCnps = wnumero_cnps;
    numeroCnpsCommunicable = json['numero_cnps_communicable'];
    periodicite = json['periodicite'];
    statutComptabiliteFormel = json['statut_comptabilite_formel'];
    statutCompteContribuable = json['statut_compte_contribuable'];
    statutEntreprise = json['statut_entreprise'];
    statutRegistreCommerce = json['statut_registre_commerce'];
    typeEntreprise = json['type_entreprise'];
    zoneId = wzone_id;
    localiteId = wlocalite_id;
    quartierId = wquartier_id;
    ilotId = wilot_id;
    zone = json['zone'];
    dateDebutExploitation = json['date_debut_exploitation'];
    activictePrincipal = json['activicte_principal'];
    gpsPrecision = "${json['gps_precision']}";
    serviceEnLigne = json['service_en_ligne'];
    hasActivicteSecondaire = json['has_activicte_secondaire'];
    raisonSocial = json['raison_social'];
    adresseGeographiqueEntreprise = json['adresse_geographique_entreprise'];
    observation = json['observation'];
    sigleEntreprise = json['sigle_entreprise'];
    telephoneFixe2Entreprise = json['telephone_fixe_2_entreprise'];
    telephonePortable1Entreprise = json['telephone_portable_1_entreprise'];
    telephonePortable2Entreprise = json['telephone_portable_2_entreprise'];
    emailEntreprise = json['email_entreprise'];
    siteWebEntreprise = json['site_web_entreprise'];
    boitePostaleEntreprise = json['boite_postale_entreprise'];
    typeActivite = json['type_activite'];
    clusterId = wcluster_id;
    regionId = wregion_id;
    departementId = wdepartement_id;
    sousprefectureId = wsousprefecture_id;
    communeId = wcommune_id;
    addresseGeo1 = json['addresse_geo_1'];
    addresseGeo2 = json['addresse_geo_2'];
    resultatEntretien = json['resultat_entretien'].toString();
    dateFinEntretien = json['date_fin_entretien'];
    nombreVisite = json['nombre_visite'].toString();
    observationEnquete = json['observation_enquete'];

    zone_implantation_entreprise = wzone_implantation_entreprise;
    libelle_zone_implantation_entreprise = wlibelle_zone_implantation_entreprise;
    numero_batiment = wnumero_batiment;
    numero_sequence_batiment_entreprise = wnumero_sequence_batiment_entreprise;
    ACT_TRANSF_OK = json['ACT_TRANSF_OK'];
    Id_Tmp = json['Id_Tmp'];
    ACT_Id_Server = wACT_Id_Server;

    ImageBase64_PHOTO_ACT = json['ImageBase64_PHOTO_ACT'];


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.active == null) this.active = false;
    if (this.userId == null) this.userId = 0;

    if (this.stateId == null) this.stateId = 0;
    if (this.countryId == null) this.countryId = 0;
    if (this.createUid == null) this.createUid = 0;
    if (this.writeUid == null) this.writeUid = 0;
    if (this.messageMainAttachmentId == null) this.messageMainAttachmentId = 0;
    if (this.entreprenantId == null) this.entreprenantId = 0;
    if (this.tauxImposition == null) this.tauxImposition = 0;
    if (this.longueur == null) this.longueur = 0;
    if (this.largeur == null) this.largeur = 0;
    if (this.odp == null) this.odp = 0;
    if (this.pubEnMettreCarre == null) this.pubEnMettreCarre = 0;
    if (this.pubLongueur2 == null) this.pubLongueur2 = 0;
    if (this.pubLargeur2 == null) this.pubLargeur2 = 0;
    if (this.surface_local_en_mettre_carre == null) this.surface_local_en_mettre_carre = 0;
    if (this.pubEnMettreCarre2 == null) this.pubEnMettreCarre2 = 0;
    if (this.activicte2 == null) this.activicte2 = 0;
    if (this.effectifTotal == null) this.effectifTotal = 0;
    if (this.numeroCnps == null) this.numeroCnps = 0;
    if (this.zoneId == null) this.zoneId = 0;
    if (this.localiteId == null) this.localiteId = 0;
    if (this.quartierId == null) this.quartierId = 0;
    if (this.ilotId == null) this.ilotId = 0;
    if (this.clusterId == null) this.clusterId = 0;
    if (this.regionId == null) this.regionId = 0;
    if (this.departementId == null) this.departementId = 0;
    if (this.sousprefectureId == null) this.sousprefectureId = 0;
    if (this.communeId == null) this.communeId = 0;
    if (this.activiteTypeId == null) this.activiteTypeId = 0;
    if (this.ACT_TRANSF_OK == null) this.ACT_TRANSF_OK = 0;
    if (this.Id_Tmp == null) this.Id_Tmp = 0;
    data['id'] = this.id;
    data['name'] = this.name;
    data['create_date'] = this.createDate;
    data['display_name'] = this.displayName;
    data['date'] = this.date;
    data['ref'] = this.ref;
    data['lang'] = this.lang;
    data['tz'] = this.tz;
    data['user_id'] = this.userId;

    data['vat'] = this.vat;
    data['website'] = this.website;
    data['state'] = this.state;
    data['comment'] = this.comment;
    data['barcode'] = this.barcode;

    data['street'] = this.street;
    data['street2'] = this.street2;
    data['zip'] = this.zip;
    data['city'] = this.city;
    data['state_id'] = this.stateId;
    data['country_id'] = this.countryId;
    data['email'] = this.email;
    data['telephone_fixe_1_entreprise'] = this.telephoneFixe1Entreprise;
    data['mobile'] = this.mobile;
    data['create_uid'] = this.createUid;
    data['write_uid'] = this.writeUid;
    data['write_date'] = this.writeDate;
    data['message_main_attachment_id'] = this.messageMainAttachmentId;
    data['entreprenant_id'] = this.entreprenantId;


    data['activity_birthday'] = this.activityBirthday;
    data['regime_fiscale'] = this.regimeFiscale;
    data['chiffre_affaire_taxable'] = this.chiffreAffaireTaxable;
    data['min_ca'] = this.minCa;
    data['max_ca'] = this.maxCa;
    data['secteur_id'] = this.secteurId;
    data['type_taxe'] = this.typeTaxe;
    data['cga'] = this.cga;
    data['date_adhesion'] = this.dateAdhesion;
    data['ref_cga'] = this.refCga;
    data['periode_imposition'] = this.periodeImposition;
    data['taux_imposition'] = this.tauxImposition;
    data['taille_activite'] = this.tailleActivite;
    data['ciap'] = this.ciap;
    data['longueur'] = this.longueur;
    data['largeur'] = this.largeur;
    data['odp'] = this.odp;
    data['baux_loyer'] = this.bauxLoyer;
    data['pub_longueur'] = this.pubLongueur;
    data['pub_largeur'] = this.pubLargeur;
    data['pub_en_mettre_carre'] = this.pubEnMettreCarre;
    data['pub_longueur_2'] = this.pubLongueur2;
    data['pub_largeur_2'] = this.pubLargeur2;
    data['surface_local_en_mettre_carre'] = this.surface_local_en_mettre_carre;
    data['pub_en_mettre_carre_2'] = this.pubEnMettreCarre2;
    data['partner_latitude'] = this.partnerLatitude;
    data['partner_longitude'] = this.partnerLongitude;
    data['autre_type_activite'] = this.autreTypeActivite;
    data['activicte_2'] = this.activicte2;
    data['etat_activite'] = this.etatActivite;
    data['forme_juridique'] = this.formeJuridique;
    data['autre_forme_juridique'] = this.autreFormeJuridique;
    data['capital_en_action'] = this.capitalEnAction;

    data['manque_personnel_qualifie'] = this.manquePersonnelQualifie;
    data['cout_eleve_main_oeuvre'] = this.coutEleveMainOeuvre;
    data['formalite_administrative_contraignante'] = this.formaliteAdministrativeContraignante;
    data['taxe_impot_eleve'] = this.taxeImpotEleve;
    data['cout_tranport_eleve'] = this.coutTranportEleve;
    data['mauvais_etat_infrastructure'] = this.mauvaisEtatInfrastructure;
    data['difficulte_approvisionnement_matiere_premiere'] = this.difficulteApprovisionnementMatierePremiere;
    data['procedure_contentieux'] = this.procedureContentieux;
    data['ecoulement_production'] = this.ecoulementProduction;
    data['acces_au_technologie'] = this.accesAuTechnologie;
    data['manque_machine'] = this.manqueMachine;
    data['manque_expertise_technique'] = this.manqueExpertiseTechnique;
    data['manque_local_adapte'] = this.manqueLocalAdapte;
    data['acces_commande_public'] = this.accesCommandePublic;
    data['acces_structure_appui'] = this.accesStructureAppui;
    data['acces_credit_bancaire'] = this.accesCreditBancaire;
    data['approvisionnement_energie'] = this.approvisionnementEnergie;
    data['concurrence_deloyale'] = this.concurrenceDeloyale;
    data['corruption'] = this.corruption;
    data['autre_contrainte'] = this.autreContrainte;
    data['precise_contrainte'] = this.preciseContrainte;
    data['aucune_contrainte'] = this.aucuneContrainte;
    data['autre_activte'] = this.autreActivte;

    data['autre_activite_secondaire'] = this.autre_activite_secondaire;
    data['autre_activite_precision'] = this.autreActivitePrecision;
    data['code_ciap'] = this.codeCiap;
    data['connexion_internet'] = this.connexionInternet;
    data['declaration_cnps'] = this.declarationCnps;
    data['designation_activite'] = this.designationActivite;
    data['doc_fin_exercice'] = this.docFinExercice;
    data['effectif_total'] = this.effectifTotal;
    data['etat_fonctionnement_entreprise'] = this.etatFonctionnementEntreprise;
    data['name_activite_secondaire'] = this.nameActiviteSecondaire;
    data['nombre_etablissement'] = this.nombreEtablissement;
    data['num_compte_contribuable'] = this.numCompteContribuable;
    data['num_registre_commerce'] = this.numRegistreCommerce;
    data['numero_cnps'] = this.numeroCnps;
    data['numero_cnps_communicable'] = this.numeroCnpsCommunicable;
    data['periodicite'] = this.periodicite;
    data['statut_comptabilite_formel'] = this.statutComptabiliteFormel;
    data['statut_compte_contribuable'] = this.statutCompteContribuable;
    data['statut_entreprise'] = this.statutEntreprise;
    data['statut_registre_commerce'] = this.statutRegistreCommerce;
    data['type_entreprise'] = this.typeEntreprise;
    data['zone_id'] = this.zoneId;
    data['localite_id'] = this.localiteId;
    data['quartier_id'] = this.quartierId;
    data['ilot_id'] = this.ilotId;
    data['zone'] = this.zone;
    data['date_debut_exploitation'] = this.dateDebutExploitation;
    data['activicte_principal'] = this.activictePrincipal;
    data['gps_precision'] = this.gpsPrecision;
    data['service_en_ligne'] = this.serviceEnLigne;
    data['has_activicte_secondaire'] = this.hasActivicteSecondaire;
    data['raison_social'] = this.raisonSocial;
    data['adresse_geographique_entreprise'] = this.adresseGeographiqueEntreprise;
    data['observation'] = this.observation;
    data['sigle_entreprise'] = this.sigleEntreprise;
    data['telephone_fixe_2_entreprise'] = this.telephoneFixe2Entreprise;
    data['telephone_portable_1_entreprise'] = this.telephonePortable1Entreprise;
    data['telephone_portable_2_entreprise'] = this.telephonePortable2Entreprise;
    data['email_entreprise'] = this.emailEntreprise;
    data['site_web_entreprise'] = this.siteWebEntreprise;
    data['boite_postale_entreprise'] = this.boitePostaleEntreprise;
    data['type_activite'] = this.typeActivite;
    data['type_activite_formel_informel'] = this.type_activite_formel_informel;
    data['type_activite_formel_informel'] = this.type_activite_formel_informel;
    data['cluster_id'] = this.clusterId;
    data['region_id'] = this.regionId;
    data['departement_id'] = this.departementId;
    data['sousprefecture_id'] = this.sousprefectureId;
    data['commune_id'] = this.communeId;
    data['addresse_geo_1'] = this.addresseGeo1;
    data['addresse_geo_2'] = this.addresseGeo2;
    data['activite_type_id'] = this.activiteTypeId;
    data['zone_implantation_entreprise'] = this.zone_implantation_entreprise;
    data['libelle_zone_implantation_entreprise'] = this.libelle_zone_implantation_entreprise;
    data['numero_batiment'] = this.numero_batiment;
    data['numero_sequence_batiment_entreprise'] = this.numero_sequence_batiment_entreprise;
    data['numero_sequence_batiment_entreprise'] = this.numero_sequence_batiment_entreprise;
    data['ACT_TRANSF_OK'] = this.ACT_TRANSF_OK;
    data['Id_Tmp'] = this.Id_Tmp;
    data['ACT_Id_Server'] = this.id;


    data['ImageBase64_PHOTO_ACT'] = this.ImageBase64_PHOTO_ACT;


    data['date_fin_entretien'] = this.dateFinEntretien;
    data['resultat_entretien'] = this.resultatEntretien;
    data['nombre_visite'] = this.nombreVisite;
    data['observation_enquete'] = this.observationEnquete;



    return data;
  }

  //*****************

  Map<String, dynamic> toArr() {
    if (this.active == null) this.active = false;

    if (this.userId == null) this.userId = 0;
    if (this.stateId == null) this.stateId = 0;
    if (this.countryId == null) this.countryId = 0;
    if (this.createUid == null) this.createUid = 0;
    if (this.writeUid == null) this.writeUid = 0;
    if (this.messageMainAttachmentId == null) this.messageMainAttachmentId = 0;
    if (this.entreprenantId == null) this.entreprenantId = 0;
    if (this.tauxImposition == null) this.tauxImposition = 0;
    if (this.longueur == null) this.longueur = 0;
    if (this.largeur == null) this.largeur = 0;
    if (this.odp == null) this.odp = 0;
    if (this.pubEnMettreCarre == null) this.pubEnMettreCarre = 0;
    if (this.pubLongueur2 == null) this.pubLongueur2 = 0;
    if (this.pubLargeur2 == null) this.pubLargeur2 = 0;
    if (this.surface_local_en_mettre_carre == null) this.surface_local_en_mettre_carre = 0;
    if (this.pubEnMettreCarre2 == null) this.pubEnMettreCarre2 = 0;
    if (this.activicte2 == null) this.activicte2 = 0;
    if (this.effectifTotal == null) this.effectifTotal = 0;
    if (this.numeroCnps == null) this.numeroCnps = 0;
    if (this.zoneId == null) this.zoneId = 0;
    if (this.localiteId == null) this.localiteId = 0;
    if (this.quartierId == null) this.quartierId = 0;
    if (this.ilotId == null) this.ilotId = 0;
    if (this.clusterId == null) this.clusterId = 0;
    if (this.regionId == null) this.regionId = 0;
    if (this.departementId == null) this.departementId = 0;
    if (this.sousprefectureId == null) this.sousprefectureId = 0;
    if (this.communeId == null) this.communeId = 0;
    if (this.activiteTypeId == null) this.activiteTypeId = 0;

    this.type_activite_formel_informel = "Informel";
    if (DbTools.isFORMEL) this.type_activite_formel_informel = "Formel";

//    //print("ididididididi  ${this.id}");
    var wArgs = {
      'is_activity': true,
      'name': this.name,
      'create_date': this.createDate,
      'display_name': this.displayName,
      'date': this.date,
      'ref': this.ref,
      'lang': this.lang,
      'tz': this.tz,
      'user_id': '${DbOdoo.res_UserId}',

      'vat': this.vat,
      'website': this.website,
      'state': this.state,
      'comment': this.comment,

      'barcode': this.barcode,
      'street': this.street,
      'street2': this.street2,
      'zip': this.zip,
      'city': this.city,
      'state_id' : this.stateId,
     'country_id' : this.countryId,
      'email_entreprise': this.email,
      'telephone_fixe_1_entreprise': this.telephoneFixe1Entreprise,
      'telephone_portable_1_entreprise': this.mobile,
      'create_uid': this.createUid,
      'write_uid': this.writeUid,
       'write_date' : this.writeDate,
      'message_main_attachment_id' : this.messageMainAttachmentId,

      'entreprenant_id': this.entreprenantId,
      'activity_birthday': this.activityBirthday,
      'regime_fiscale': this.regimeFiscale,
      'chiffre_affaire_taxable': this.chiffreAffaireTaxable,
      'min_ca': this.minCa,
      'max_ca': this.maxCa,
      'secteur_id': this.secteurId,
      'type_taxe': this.typeTaxe,
      'cga': this.cga,
      'date_adhesion': this.dateAdhesion,
      'ref_cga': this.refCga,
      'taux_imposition': this.tauxImposition,
      'taille_activite': this.tailleActivite,
      'ciap': this.ciap,
      'longueur': this.longueur,
      'largeur': this.largeur,
      'odp': this.odp,
      'baux_loyer': this.bauxLoyer,
      'pub_longueur': this.pubLongueur,
      'pub_largeur': this.pubLargeur,
      'pub_longueur_2': this.pubLongueur2,
      'pub_largeur_2': this.pubLargeur2,
      'surface_local_en_mettre_carre': this.surface_local_en_mettre_carre,
      'partner_latitude': this.partnerLatitude,
      'partner_longitude': this.partnerLongitude,
      'autre_type_activite': this.autreTypeActivite,
      'activicte_2': this.activicte2,
      'etat_activite': this.etatActivite,
      'forme_juridique': this.formeJuridique,
      'autre_forme_juridique': this.autreFormeJuridique,
      'capital_en_action': this.capitalEnAction,

      'manque_personnel_qualifie': this.manquePersonnelQualifie,
      'cout_eleve_main_oeuvre': this.coutEleveMainOeuvre,
      'formalite_administrative_contraignante': this.formaliteAdministrativeContraignante,

      'taxe_impot_eleve': this.taxeImpotEleve,
      'cout_tranport_eleve': this.coutTranportEleve,
      'mauvais_etat_infrastructure': this.mauvaisEtatInfrastructure,
      'difficulte_approvisionnement_matiere_premiere': this.difficulteApprovisionnementMatierePremiere,
      'procedure_contentieux': this.procedureContentieux,
      'ecoulement_production': this.ecoulementProduction,
      'acces_au_technologie': this.accesAuTechnologie,
      'manque_machine': this.manqueMachine,
      'manque_expertise_technique': this.manqueExpertiseTechnique,
      'manque_local_adapte': this.manqueLocalAdapte,
      'acces_commande_public': this.accesCommandePublic,
      'acces_structure_appui': this.accesStructureAppui,
      'acces_credit_bancaire': this.accesCreditBancaire,
      'approvisionnement_energie': this.approvisionnementEnergie,
      'concurrence_deloyale': this.concurrenceDeloyale,
      'corruption': this.corruption,
      'autre_contrainte': this.autreContrainte,
      'precise_contrainte': this.preciseContrainte,
      'aucune_contrainte': this.aucuneContrainte,
      'autre_activte': this.autreActivte,
      'autre_activite_secondaire': this.autre_activite_secondaire,
      'autre_activite_precision': this.autreActivitePrecision,
      'code_ciap': this.codeCiap,
      'connexion_internet': this.connexionInternet,
      'declaration_cnps': this.declarationCnps,
      'designation_activite': this.designationActivite,
      'doc_fin_exercice': this.docFinExercice,
      'effectif_total': this.effectifTotal,
      'etat_fonctionnement_entreprise': this.etatFonctionnementEntreprise,
      'name_activite_secondaire': this.nameActiviteSecondaire,
      'nombre_etablissement': this.nombreEtablissement,
      'num_compte_contribuable': this.numCompteContribuable,
      'num_registre_commerce': this.numRegistreCommerce,
      'numero_cnps': this.numeroCnps,
      'numero_cnps_communicable': this.numeroCnpsCommunicable,
      'periodicite': this.periodicite,
      'statut_comptabilite_formel': this.statutComptabiliteFormel,
      'statut_compte_contribuable': this.statutCompteContribuable,
      'statut_entreprise': this.statutEntreprise,

      'statut_registre_commerce': this.statutRegistreCommerce,
      'type_entreprise': this.typeEntreprise,
      'zone_id': this.zoneId,
      'localite_id': this.localiteId,
      'quartier_id': this.quartierId,
      'ilot_id': this.ilotId,
      'zone': this.zone,
      'date_debut_exploitation': this.dateDebutExploitation,
      'activicte_principal': this.activictePrincipal,
      'gps_precision': this.gpsPrecision,
      'service_en_ligne': this.serviceEnLigne,
      'has_activicte_secondaire': this.hasActivicteSecondaire,
      'raison_social': this.raisonSocial,
      'adresse_geographique_entreprise': this.adresseGeographiqueEntreprise,
      'observation': this.observation,
      'sigle_entreprise': this.sigleEntreprise,
      'telephone_fixe_2_entreprise': this.telephoneFixe2Entreprise,
      'telephone_portable_1_entreprise': this.telephonePortable1Entreprise,
      'telephone_portable_2_entreprise': this.telephonePortable2Entreprise,
      'email_entreprise': this.emailEntreprise,
      'site_web_entreprise': this.siteWebEntreprise,
      'boite_postale_entreprise': this.boitePostaleEntreprise,
      'type_activite': this.typeActivite,
      'type_activite_formel_informel': this.type_activite_formel_informel,

      'cluster_id': this.clusterId,
      'region_id': this.regionId,
      'departement_id': this.departementId,
      'sousprefecture_id': this.sousprefectureId,
      'commune_id': this.communeId,
      'addresse_geo_1': this.addresseGeo1,
      'addresse_geo_2': this.addresseGeo2,
//    'activite_type_id' : this.activiteTypeId,

      'date_fin_entretien': this.dateFinEntretien,
      'resultat_entretien': this.resultatEntretien,
      'nombre_visite': this.nombreVisite,
      'observation_enquete': this.observationEnquete,

      'zone_implantation_entreprise': this.zone_implantation_entreprise,
      'libelle_zone_implantation_entreprise': this.libelle_zone_implantation_entreprise,
      'numero_batiment': this.numero_batiment,
      'numero_sequence_batiment_entreprise': this.numero_sequence_batiment_entreprise,

      'numero_sequence_batiment_entreprise': this.numero_sequence_batiment_entreprise,


      'Id_Tmp': this.Id_Tmp,
      'ACT_TRANSF_OK': this.ACT_TRANSF_OK,
      'ACT_Id_Server': this.ACT_Id_Server,
    };
    return wArgs;
  }

  Map<String, dynamic> toArrLocal() {
    if (this.active == null) this.active = false;

    if (this.userId == null) this.userId = 0;
    if (this.stateId == null) this.stateId = 0;
    if (this.countryId == null) this.countryId = 0;
    if (this.createUid == null) this.createUid = 0;
    if (this.writeUid == null) this.writeUid = 0;
    if (this.messageMainAttachmentId == null) this.messageMainAttachmentId = 0;
    if (this.entreprenantId == null) this.entreprenantId = 0;
    if (this.tauxImposition == null) this.tauxImposition = 0;
    if (this.longueur == null) this.longueur = 0;
    if (this.largeur == null) this.largeur = 0;
    if (this.odp == null) this.odp = 0;
    if (this.pubEnMettreCarre == null) this.pubEnMettreCarre = 0;
    if (this.pubLongueur2 == null) this.pubLongueur2 = 0;
    if (this.pubLargeur2 == null) this.pubLargeur2 = 0;
    if (this.surface_local_en_mettre_carre == null) this.surface_local_en_mettre_carre = 0;
    if (this.pubEnMettreCarre2 == null) this.pubEnMettreCarre2 = 0;
    if (this.activicte2 == null) this.activicte2 = 0;
    if (this.effectifTotal == null) this.effectifTotal = 0;
    if (this.numeroCnps == null) this.numeroCnps = 0;
    if (this.zoneId == null) this.zoneId = 0;
    if (this.localiteId == null) this.localiteId = 0;
    if (this.quartierId == null) this.quartierId = 0;
    if (this.ilotId == null) this.ilotId = 0;
    if (this.clusterId == null) this.clusterId = 0;
    if (this.regionId == null) this.regionId = 0;
    if (this.departementId == null) this.departementId = 0;
    if (this.sousprefectureId == null) this.sousprefectureId = 0;
    if (this.communeId == null) this.communeId = 0;
    if (this.activiteTypeId == null) this.activiteTypeId = 0;

    this.type_activite_formel_informel = "Informel";
    if (DbTools.isFORMEL) this.type_activite_formel_informel = "Formel";

//    //print("ididididididi  ${this.id}");
    var wArgs = {
      'is_activity': true,
      'name': this.name,
      'create_date': this.createDate,
      'display_name': this.displayName,
      'date': this.date,
      'ref': this.ref,
      'lang': this.lang,
      'tz': this.tz,
      'user_id': '${DbOdoo.res_UserId}',

      'vat': this.vat,
      'website': this.website,
      'state': this.state,
      'comment': this.comment,

      'barcode': this.barcode,
      'street': this.street,
      'street2': this.street2,
      'zip': this.zip,
      'city': this.city,
      'state_id' : this.stateId,
      'country_id' : this.countryId,
      'email_entreprise': this.email,
      'telephone_fixe_1_entreprise': this.telephoneFixe1Entreprise,
      'telephone_portable_1_entreprise': this.mobile,
      'create_uid': this.createUid,
      'write_uid': this.writeUid,
      'write_date' : this.writeDate,
      'message_main_attachment_id' : this.messageMainAttachmentId,

      'entreprenant_id': this.entreprenantId,
      'activity_birthday': this.activityBirthday,
      'regime_fiscale': this.regimeFiscale,
      'chiffre_affaire_taxable': this.chiffreAffaireTaxable,
      'min_ca': this.minCa,
      'max_ca': this.maxCa,
      'secteur_id': this.secteurId,
      'type_taxe': this.typeTaxe,
      'cga': this.cga,
      'date_adhesion': this.dateAdhesion,
      'ref_cga': this.refCga,
      'taux_imposition': this.tauxImposition,
      'taille_activite': this.tailleActivite,
      'ciap': this.ciap,
      'longueur': this.longueur,
      'largeur': this.largeur,
      'odp': this.odp,
      'baux_loyer': this.bauxLoyer,
      'pub_longueur': this.pubLongueur,
      'pub_largeur': this.pubLargeur,
      'pub_longueur_2': this.pubLongueur2,
      'pub_largeur_2': this.pubLargeur2,
      'surface_local_en_mettre_carre': this.surface_local_en_mettre_carre,
      'partner_latitude': this.partnerLatitude,
      'partner_longitude': this.partnerLongitude,
      'autre_type_activite': this.autreTypeActivite,
      'activicte_2': this.activicte2,
      'etat_activite': this.etatActivite,
      'forme_juridique': this.formeJuridique,
      'autre_forme_juridique': this.autreFormeJuridique,
      'capital_en_action': this.capitalEnAction,

      'manque_personnel_qualifie': this.manquePersonnelQualifie,
      'cout_eleve_main_oeuvre': this.coutEleveMainOeuvre,
      'formalite_administrative_contraignante': this.formaliteAdministrativeContraignante,

      'taxe_impot_eleve': this.taxeImpotEleve,
      'cout_tranport_eleve': this.coutTranportEleve,
      'mauvais_etat_infrastructure': this.mauvaisEtatInfrastructure,
      'difficulte_approvisionnement_matiere_premiere': this.difficulteApprovisionnementMatierePremiere,
      'procedure_contentieux': this.procedureContentieux,
      'ecoulement_production': this.ecoulementProduction,
      'acces_au_technologie': this.accesAuTechnologie,
      'manque_machine': this.manqueMachine,
      'manque_expertise_technique': this.manqueExpertiseTechnique,
      'manque_local_adapte': this.manqueLocalAdapte,
      'acces_commande_public': this.accesCommandePublic,
      'acces_structure_appui': this.accesStructureAppui,
      'acces_credit_bancaire': this.accesCreditBancaire,
      'approvisionnement_energie': this.approvisionnementEnergie,
      'concurrence_deloyale': this.concurrenceDeloyale,
      'corruption': this.corruption,
      'autre_contrainte': this.autreContrainte,
      'precise_contrainte': this.preciseContrainte,
      'aucune_contrainte': this.aucuneContrainte,
      'autre_activte': this.autreActivte,
      'autre_activite_secondaire': this.autre_activite_secondaire,
      'autre_activite_precision': this.autreActivitePrecision,
      'code_ciap': this.codeCiap,
      'connexion_internet': this.connexionInternet,
      'declaration_cnps': this.declarationCnps,
      'designation_activite': this.designationActivite,
      'doc_fin_exercice': this.docFinExercice,
      'effectif_total': this.effectifTotal,
      'etat_fonctionnement_entreprise': this.etatFonctionnementEntreprise,
      'name_activite_secondaire': this.nameActiviteSecondaire,
      'nombre_etablissement': this.nombreEtablissement,
      'num_compte_contribuable': this.numCompteContribuable,
      'num_registre_commerce': this.numRegistreCommerce,
      'numero_cnps': this.numeroCnps,
      'numero_cnps_communicable': this.numeroCnpsCommunicable,
      'periodicite': this.periodicite,
      'statut_comptabilite_formel': this.statutComptabiliteFormel,
      'statut_compte_contribuable': this.statutCompteContribuable,
      'statut_entreprise': this.statutEntreprise,

      'statut_registre_commerce': this.statutRegistreCommerce,
      'type_entreprise': this.typeEntreprise,
      'zone_id': this.zoneId,
      'localite_id': this.localiteId,
      'quartier_id': this.quartierId,
      'ilot_id': this.ilotId,
      'zone': this.zone,
      'date_debut_exploitation': this.dateDebutExploitation,
      'activicte_principal': this.activictePrincipal,
      'gps_precision': this.gpsPrecision,
      'service_en_ligne': this.serviceEnLigne,
      'has_activicte_secondaire': this.hasActivicteSecondaire,
      'raison_social': this.raisonSocial,
      'adresse_geographique_entreprise': this.adresseGeographiqueEntreprise,
      'observation': this.observation,
      'sigle_entreprise': this.sigleEntreprise,
      'telephone_fixe_2_entreprise': this.telephoneFixe2Entreprise,
      'telephone_portable_1_entreprise': this.telephonePortable1Entreprise,
      'telephone_portable_2_entreprise': this.telephonePortable2Entreprise,
      'email_entreprise': this.emailEntreprise,
      'site_web_entreprise': this.siteWebEntreprise,
      'boite_postale_entreprise': this.boitePostaleEntreprise,
      'type_activite': this.typeActivite,
      'type_activite_formel_informel': this.type_activite_formel_informel,

      'cluster_id': this.clusterId,
      'region_id': this.regionId,
      'departement_id': this.departementId,
      'sousprefecture_id': this.sousprefectureId,
      'commune_id': this.communeId,
      'addresse_geo_1': this.addresseGeo1,
      'addresse_geo_2': this.addresseGeo2,
//    'activite_type_id' : this.activiteTypeId,

      'date_fin_entretien': this.dateFinEntretien,
      'resultat_entretien': this.resultatEntretien,
      'nombre_visite': this.nombreVisite,
      'observation_enquete': this.observationEnquete,

      'zone_implantation_entreprise': this.zone_implantation_entreprise,
      'libelle_zone_implantation_entreprise': this.libelle_zone_implantation_entreprise,
      'numero_batiment': this.numero_batiment,
      'numero_sequence_batiment_entreprise': this.numero_sequence_batiment_entreprise,

      'ImageBase64_PHOTO_ACT': this.ImageBase64_PHOTO_ACT,

      'Id_Tmp': this.Id_Tmp,
      'ACT_TRANSF_OK': this.ACT_TRANSF_OK,
      'ACT_Id_Server': this.ACT_Id_Server,
    };
    return wArgs;
  }


  Map<String, dynamic> toArrUpd() {
    if (this.active == null) this.active = false;
    if (this.userId == null) this.userId = 0;

    if (this.stateId == null) this.stateId = 0;
    if (this.countryId == null) this.countryId = 0;
    if (this.createUid == null) this.createUid = 0;
    if (this.writeUid == null) this.writeUid = 0;
    if (this.messageMainAttachmentId == null) this.messageMainAttachmentId = 0;
    if (this.entreprenantId == null) this.entreprenantId = 0;
    if (this.tauxImposition == null) this.tauxImposition = 0;
    if (this.longueur == null) this.longueur = 0;
    if (this.largeur == null) this.largeur = 0;
    if (this.odp == null) this.odp = 0;
    if (this.pubEnMettreCarre == null) this.pubEnMettreCarre = 0;
    if (this.pubLongueur2 == null) this.pubLongueur2 = 0;
    if (this.pubLargeur2 == null) this.pubLargeur2 = 0;
    if (this.surface_local_en_mettre_carre == null) this.surface_local_en_mettre_carre = 0;
    if (this.pubEnMettreCarre2 == null) this.pubEnMettreCarre2 = 0;
    if (this.activicte2 == null) this.activicte2 = 0;
    if (this.effectifTotal == null) this.effectifTotal = 0;
    if (this.numeroCnps == null) this.numeroCnps = 0;
    if (this.zoneId == null) this.zoneId = 0;
    if (this.localiteId == null) this.localiteId = 0;
    if (this.quartierId == null) this.quartierId = 0;
    if (this.ilotId == null) this.ilotId = 0;
    if (this.clusterId == null) this.clusterId = 0;
    if (this.regionId == null) this.regionId = 0;
    if (this.departementId == null) this.departementId = 0;
    if (this.sousprefectureId == null) this.sousprefectureId = 0;
    if (this.communeId == null) this.communeId = 0;
    if (this.activiteTypeId == null) this.activiteTypeId = 0;

    this.type_activite_formel_informel = "Informel";
    if (DbTools.isFORMEL) this.type_activite_formel_informel = "Formel";

    String wsignup_expiration = "2023-11-09 08:26:14.204072";
//    //print("ididididididi  ${this.id}");
    var wArgs = {
      'id': this.id,
      'is_activity': true,
      'name': this.name,
      'create_date': this.createDate,
      'display_name': this.displayName,
      'date': this.date,

      'ref': this.ref,
      'lang': this.lang,
      'tz': this.tz,
      'user_id': '${DbOdoo.res_UserId}',

      'vat': this.vat,
      'website': this.website,
      'state': this.state,
      'comment': this.comment,
      'barcode': this.barcode,
      'street': this.street,
      'street2': this.street2,
      'zip': this.zip,
      'city': this.city,
      'email_entreprise': this.email,
      'telephone_fixe_1_entreprise': this.telephoneFixe1Entreprise,
      'telephone_portable_1_entreprise': this.mobile,
      'create_uid': this.createUid,
      'write_uid': this.writeUid,
      'write_date': this.writeDate,
      'entreprenant_id': this.entreprenantId,
      'activity_birthday': this.activityBirthday,
      'regime_fiscale': this.regimeFiscale,
      'chiffre_affaire_taxable': this.chiffreAffaireTaxable,
      'min_ca': this.minCa,
      'max_ca': this.maxCa,
      'secteur_id': this.secteurId,
      'type_taxe': this.typeTaxe,
      'cga': this.cga,
      'date_adhesion': this.dateAdhesion,
      'ref_cga': this.refCga,
      'taux_imposition': this.tauxImposition,
      'taille_activite': this.tailleActivite,
      'ciap': this.ciap,
      'longueur': this.longueur,
      'largeur': this.largeur,
      'odp': this.odp,
      'baux_loyer': this.bauxLoyer,
      'pub_longueur': this.pubLongueur,
      'pub_largeur': this.pubLargeur,
      'pub_longueur_2': this.pubLongueur2,
      'pub_largeur_2': this.pubLargeur2,
      'surface_local_en_mettre_carre': this.surface_local_en_mettre_carre,
      'partner_latitude': this.partnerLatitude,
      'partner_longitude': this.partnerLongitude,
      'autre_type_activite': this.autreTypeActivite,
      'activicte_2': this.activicte2,
      'etat_activite': this.etatActivite,
      'forme_juridique': this.formeJuridique,
      'autre_forme_juridique': this.autreFormeJuridique,
      'capital_en_action': this.capitalEnAction,
      'manque_personnel_qualifie': this.manquePersonnelQualifie,
      'cout_eleve_main_oeuvre': this.coutEleveMainOeuvre,
      'formalite_administrative_contraignante': this.formaliteAdministrativeContraignante,

      'taxe_impot_eleve': this.taxeImpotEleve,
      'cout_tranport_eleve': this.coutTranportEleve,
      'mauvais_etat_infrastructure': this.mauvaisEtatInfrastructure,
      'difficulte_approvisionnement_matiere_premiere': this.difficulteApprovisionnementMatierePremiere,
      'procedure_contentieux': this.procedureContentieux,
      'ecoulement_production': this.ecoulementProduction,
      'acces_au_technologie': this.accesAuTechnologie,
      'manque_machine': this.manqueMachine,
      'manque_expertise_technique': this.manqueExpertiseTechnique,
      'manque_local_adapte': this.manqueLocalAdapte,
      'acces_commande_public': this.accesCommandePublic,
      'acces_structure_appui': this.accesStructureAppui,
      'acces_credit_bancaire': this.accesCreditBancaire,
      'approvisionnement_energie': this.approvisionnementEnergie,
      'concurrence_deloyale': this.concurrenceDeloyale,
      'corruption': this.corruption,
      'autre_contrainte': this.autreContrainte,
      'precise_contrainte': this.preciseContrainte,
      'aucune_contrainte': this.aucuneContrainte,
      'autre_activte': this.autreActivte,
      'autre_activite_secondaire': this.autre_activite_secondaire,
      'autre_activite_precision': this.autreActivitePrecision,
      'code_ciap': this.codeCiap,
      'connexion_internet': this.connexionInternet,
      'declaration_cnps': this.declarationCnps,
      'designation_activite': this.designationActivite,
      'doc_fin_exercice': this.docFinExercice,
      'effectif_total': this.effectifTotal,
      'etat_fonctionnement_entreprise': this.etatFonctionnementEntreprise,
      'name_activite_secondaire': this.nameActiviteSecondaire,
      'nombre_etablissement': this.nombreEtablissement,
      'num_compte_contribuable': this.numCompteContribuable,
      'num_registre_commerce': this.numRegistreCommerce,
      'numero_cnps': this.numeroCnps,
      'numero_cnps_communicable': this.numeroCnpsCommunicable,
      'periodicite': this.periodicite,
      'statut_comptabilite_formel': this.statutComptabiliteFormel,
      'statut_compte_contribuable': this.statutCompteContribuable,
      'statut_entreprise': this.statutEntreprise,
      'statut_registre_commerce': this.statutRegistreCommerce,
      'type_entreprise': this.typeEntreprise,
      'zone_id': this.zoneId,
      'localite_id': this.localiteId,
      'quartier_id': this.quartierId,
      'ilot_id': this.ilotId,
      'zone': this.zone,
      'date_debut_exploitation': this.dateDebutExploitation,
      'activicte_principal': this.activictePrincipal,
      'gps_precision': this.gpsPrecision,
      'service_en_ligne': this.serviceEnLigne,
      'has_activicte_secondaire': this.hasActivicteSecondaire,
      'raison_social': this.raisonSocial,
      'adresse_geographique_entreprise': this.adresseGeographiqueEntreprise,
      'observation': this.observation,
      'sigle_entreprise': this.sigleEntreprise,
      'telephone_fixe_2_entreprise': this.telephoneFixe2Entreprise,
      'telephone_portable_1_entreprise': this.telephonePortable1Entreprise,
      'telephone_portable_2_entreprise': this.telephonePortable2Entreprise,
      'email_entreprise': this.emailEntreprise,
      'site_web_entreprise': this.siteWebEntreprise,
      'boite_postale_entreprise': this.boitePostaleEntreprise,
      'type_activite': this.typeActivite,
      'type_activite_formel_informel': this.type_activite_formel_informel,
      'cluster_id': this.clusterId,
      'region_id': this.regionId,
      'departement_id': this.departementId,
      'sousprefecture_id': this.sousprefectureId,
      'commune_id': this.communeId,
      'addresse_geo_1': this.addresseGeo1,
      'addresse_geo_2': this.addresseGeo2,
      'zone_implantation_entreprise': this.zone_implantation_entreprise,
      'libelle_zone_implantation_entreprise': this.libelle_zone_implantation_entreprise,
      'numero_batiment': this.numero_batiment,
      'numero_sequence_batiment_entreprise': this.numero_sequence_batiment_entreprise,
      'ImageBase64_PHOTO_ACT': this.ImageBase64_PHOTO_ACT,

    };
    return wArgs;
  }

  Map<String, dynamic> toArrUpdSimple() {
    if (this.active == null) this.active = false;
    if (this.userId == null) this.userId = 0;
    if (this.stateId == null) this.stateId = 0;
    if (this.countryId == null) this.countryId = 0;
    if (this.createUid == null) this.createUid = 0;
    if (this.writeUid == null) this.writeUid = 0;
    if (this.messageMainAttachmentId == null) this.messageMainAttachmentId = 0;
    if (this.entreprenantId == null) this.entreprenantId = 0;
    if (this.tauxImposition == null) this.tauxImposition = 0;
    if (this.longueur == null) this.longueur = 0;
    if (this.largeur == null) this.largeur = 0;
    if (this.odp == null) this.odp = 0;
    if (this.pubEnMettreCarre == null) this.pubEnMettreCarre = 0;
    if (this.pubLongueur2 == null) this.pubLongueur2 = 0;
    if (this.pubLargeur2 == null) this.pubLargeur2 = 0;
    if (this.surface_local_en_mettre_carre == null) this.surface_local_en_mettre_carre = 0;
    if (this.pubEnMettreCarre2 == null) this.pubEnMettreCarre2 = 0;
    if (this.activicte2 == null) this.activicte2 = 0;
    if (this.effectifTotal == null) this.effectifTotal = 0;
    if (this.numeroCnps == null) this.numeroCnps = 0;
    if (this.zoneId == null) this.zoneId = 0;
    if (this.localiteId == null) this.localiteId = 0;
    if (this.quartierId == null) this.quartierId = 0;
    if (this.ilotId == null) this.ilotId = 0;
    if (this.clusterId == null) this.clusterId = 0;
    if (this.regionId == null) this.regionId = 0;
    if (this.departementId == null) this.departementId = 0;
    if (this.sousprefectureId == null) this.sousprefectureId = 0;
    if (this.communeId == null) this.communeId = 0;
    if (this.activiteTypeId == null) this.activiteTypeId = 0;

//    //print("ididididididi  ${this.id}");
    var wArgs = {
      'id': this.id,
      'is_activity': true,
      'name': this.name,
    };
    return wArgs;
  }
}


