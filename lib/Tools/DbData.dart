



class Fournisseur {
  int? fournisseurid;
  int? fournisseur_activiteId;
  String? fournisseur_code;
  String? fournisseur_name;
  String? fournisseur_ncc;
  String? fournisseur_nature;
  int? fournisseur_mt1;

  Fournisseur({
    this.fournisseurid,
    this.fournisseur_activiteId,
    this.fournisseur_code,
    this.fournisseur_name,
    this.fournisseur_ncc,
    this.fournisseur_nature,
    this.fournisseur_mt1,
  });

  Map<String, dynamic> toMap() {
    return {
      'fournisseurid': fournisseurid,
      'fournisseur_activiteId': fournisseur_activiteId,
      'fournisseur_code': fournisseur_code,
      'fournisseur_name': fournisseur_name,
      'fournisseur_ncc': fournisseur_ncc,
      'fournisseur_nature': fournisseur_nature,
      'fournisseur_mt1': fournisseur_mt1,
    };
  }

  @override
  String toString() {
    return 'Fournisseur{fournisseurid: $fournisseurid, fournisseur_activiteId: $fournisseur_activiteId, fournisseur_code: $fournisseur_code}';
  }
}

class Secteur {
  int? secteurid;
  String? secteur_name;
  String? secteur_forme;
  String? type_activite;

  Secteur({
    this.secteurid,
    this.secteur_name,
    this.secteur_forme,
    this.type_activite,
  });

  Map<String, dynamic> toMap() {
    return {
      'secteurid': secteurid,
      'secteur_name': secteur_name,
      'secteur_forme': secteur_forme,
      'type_activite': type_activite,
    };
  }

  @override
  String toString() {
    return 'Secteur{secteurid: $secteurid, secteur_name: $secteur_name, secteur_forme: $secteur_forme}';
  }
}

class Zone {
  int? zoneid;
  String? zone_name;

  Zone({
    this.zoneid,
    this.zone_name,
  });

  Map<String, dynamic> toMap() {
    return {
      'zoneid': zoneid,
      'zone_name': zone_name,
    };
  }

  @override
  String toString() {
    return 'Zone{zoneid: $zoneid, zone_name: $zone_name}';
  }
}

class Sva {
  int? svaid;
  String? sva_name;
  String? sva_code;

  Sva({
    this.svaid,
    this.sva_name,
    this.sva_code,
  });

  Map<String, dynamic> toMap() {
    return {
      'svaid': svaid,
      'sva_name': sva_name,
      'sva_code': sva_code,
    };
  }

  @override
  String toString() {
    return 'Sva{svaid: $svaid, sva_name: $sva_name}';
  }
}

class Country {
  int? Countryid;
  String? Country_name;
  String? Country_code;

  Country({
    this.Countryid,
    this.Country_name,
    this.Country_code,
  });

  Map<String, dynamic> toMap() {
    return {
      'Countryid': Countryid,
      'Country_name': Country_name,
      'Country_code': Country_code,
    };
  }

  @override
  String toString() {
    return 'Country{Countryid: $Countryid, Country_name: $Country_name, Country_code: $Country_code}';
  }
}
