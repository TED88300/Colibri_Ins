class identifier_stats {
  int? id;
  int? entrepreneursCount;
  int? approvedEntrepreneursCount;
  int? confirmedEntrepreneursCount;
  int? draftEntrepreneursCount;
  int? pendingEntrepreneursCount;
  int? rejectedEntrepreneursCount;
  int? activitiesCount;
  int? approvedActivitiesCount;
  int? confirmedActivitiesCount;
  int? draftActivitiesCount;
  int? pendingActivitiesCount;
  int? rejectedActivitiesCount;
  int? consolidatedCount;
  int? draftConsolidatedCount;
  User? user;

  identifier_stats(
      {this.id,
        this.entrepreneursCount,
        this.approvedEntrepreneursCount,
        this.confirmedEntrepreneursCount,
        this.draftEntrepreneursCount,
        this.pendingEntrepreneursCount,
        this.rejectedEntrepreneursCount,
        this.activitiesCount,
        this.approvedActivitiesCount,
        this.confirmedActivitiesCount,
        this.draftActivitiesCount,
        this.pendingActivitiesCount,
        this.rejectedActivitiesCount,
        this.consolidatedCount,
        this.draftConsolidatedCount,
        this.user});

  identifier_stats.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    entrepreneursCount = json['entrepreneurs_count'];
    approvedEntrepreneursCount = json['approved_entrepreneurs_count'];
    confirmedEntrepreneursCount = json['confirmed_entrepreneurs_count'];
    draftEntrepreneursCount = json['draft_entrepreneurs_count'];
    pendingEntrepreneursCount = json['pending_entrepreneurs_count'];
    rejectedEntrepreneursCount = json['rejected_entrepreneurs_count'];
    activitiesCount = json['activities_count'];
    approvedActivitiesCount = json['approved_activities_count'];
    confirmedActivitiesCount = json['confirmed_activities_count'];
    draftActivitiesCount = json['draft_activities_count'];
    pendingActivitiesCount = json['pending_activities_count'];
    rejectedActivitiesCount = json['rejected_activities_count'];
    consolidatedCount = json['consolidated_count'];
    draftConsolidatedCount = json['draft_consolidated_count'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['entrepreneurs_count'] = this.entrepreneursCount;
    data['approved_entrepreneurs_count'] = this.approvedEntrepreneursCount;
    data['confirmed_entrepreneurs_count'] = this.confirmedEntrepreneursCount;
    data['draft_entrepreneurs_count'] = this.draftEntrepreneursCount;
    data['pending_entrepreneurs_count'] = this.pendingEntrepreneursCount;
    data['rejected_entrepreneurs_count'] = this.rejectedEntrepreneursCount;
    data['activities_count'] = this.activitiesCount;
    data['approved_activities_count'] = this.approvedActivitiesCount;
    data['confirmed_activities_count'] = this.confirmedActivitiesCount;
    data['draft_activities_count'] = this.draftActivitiesCount;
    data['pending_activities_count'] = this.pendingActivitiesCount;
    data['rejected_activities_count'] = this.rejectedActivitiesCount;
    data['consolidated_count'] = this.consolidatedCount;
    data['draft_consolidated_count'] = this.draftConsolidatedCount;
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

  User({this.id, this.email, this.role, this.serial});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    role = json['role'];
    serial = json['serial'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['role'] = this.role;
    data['serial'] = this.serial;
    return data;
  }
}

