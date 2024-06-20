class PointsModels {
  String? pointsId;
  String? pointsDiscount;
  String? pointsExpiredate;
  String? pointsScore;
  String? pointsOwnerItemsId;

  PointsModels(
      {this.pointsId,
      this.pointsDiscount,
      this.pointsExpiredate,
      this.pointsScore,
      this.pointsOwnerItemsId});

  PointsModels.fromJson(Map<String, dynamic> json) {
    pointsId = json['points_id'];
    pointsDiscount = json['points_discount'];
    pointsExpiredate = json['points_expiredate'];
    pointsScore = json['points_score'];
    pointsOwnerItemsId = json['points_owner_items_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['points_id'] = this.pointsId;
    data['points_discount'] = this.pointsDiscount;
    data['points_expiredate'] = this.pointsExpiredate;
    data['points_score'] = this.pointsScore;
    data['points_owner_items_id'] = this.pointsOwnerItemsId;
    return data;
  }
}