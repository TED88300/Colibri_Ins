class Ilot {
  int?    ilotid;
  String? ilotName;
  String? clusterName;
  String? regionName;
  String? departementName;
  String? sousPrefectureName;
  String? zoneRecensementName;
  String? communeName;
  String? localiteName;
  String? quartierName;

  Ilot(
      {this.ilotid,
        this.ilotName,
        this.clusterName,
        this.regionName,
        this.departementName,
        this.sousPrefectureName,
        this.zoneRecensementName,
        this.communeName,
        this.localiteName,
        this.quartierName});

  Map<String, dynamic> toMap() {
    return {
      'ilotid': ilotid,
      'ilotName': ilotName,
      'clusterName': clusterName,
      'regionName': regionName,
      'departementName': departementName,
      'sousPrefectureName': sousPrefectureName,
      'zoneRecensementName': zoneRecensementName,
      'communeName': communeName,
      'localiteName': localiteName,
      'quartierName': quartierName,
    };
  }


  Ilot.fromJson(Map<String, dynamic> json) {
    ilotName = json['ilot_name'];
    clusterName = json['cluster_name'];
    regionName = json['region_name'];
    departementName = json['departement_name'];
    sousPrefectureName = json['sous_prefecture_name'];
    zoneRecensementName = json['zone_recensement_name'];
    communeName = json['commune_name'];
    localiteName = json['localite_name'];
    quartierName = json['quartier_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ilot_name'] = this.ilotName;
    data['cluster_name'] = this.clusterName;
    data['region_name'] = this.regionName;
    data['departement_name'] = this.departementName;
    data['sous_prefecture_name'] = this.sousPrefectureName;
    data['zone_recensement_name'] = this.zoneRecensementName;
    data['commune_name'] = this.communeName;
    data['localite_name'] = this.localiteName;
    data['quartier_name'] = this.quartierName;
    return data;
  }
}
