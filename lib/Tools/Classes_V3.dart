class User_Login {
  Status? status;
  User_Login({this.status});
  User_Login.fromJson(Map<String, dynamic> json) {
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    return data;
  }
}

class Status {
  int? code;
  String? message;
  Data? data;

  Status({this.code, this.message, this.data});

  Status.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;

  Data({this.user});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? email;
  String? role;
  String? serial;
  Sector? sector;
  Team? team;

  User({this.id, this.email, this.role, this.serial, this.sector, this.team});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    role = json['role'];
    serial = json['serial'];
    sector =
    json['sector'] != null ? new Sector.fromJson(json['sector']) : null;
    team = json['team'] != null ? new Team.fromJson(json['team']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['role'] = this.role;
    data['serial'] = this.serial;
    if (this.sector != null) {
      data['sector'] = this.sector!.toJson();
    }
    if (this.team != null) {
      data['team'] = this.team!.toJson();
    }
    return data;
  }
}

class Sector {
  int? id;
  int? ilotId;
  String? ilotName;
  String? clusterName;
  String? regionName;
  String? departementName;
  String? sousPrefectureName;
  String? zoneRecensementName;
  String? communeName;
  String? localiteName;
  String? quartierName;

  Sector(
      {this.id,
        this.ilotId,
        this.ilotName,
        this.clusterName,
        this.regionName,
        this.departementName,
        this.sousPrefectureName,
        this.zoneRecensementName,
        this.communeName,
        this.localiteName,
        this.quartierName});

  Sector.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ilotId = json['ilot_id'];
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
    data['id'] = this.id;
    data['ilot_id'] = this.ilotId;
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

class Team {
  int? id;
  String? name;
  int? chiefId;
  String? createdAt;
  String? updatedAt;

  Team({this.id, this.name, this.chiefId, this.createdAt, this.updatedAt});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    chiefId = json['chief_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['chief_id'] = this.chiefId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
