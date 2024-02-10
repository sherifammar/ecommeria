class AllratingitemsviewModel {
    String ratingitemsId;
    String ratingitemsUsersid;
    String ratingitemsUsersname;
    String ratingitemsItemsid;
    String ratingitemsRate;
    String ratingitemsComment;
    DateTime ratingitemsTime;

    AllratingitemsviewModel({
        required this.ratingitemsId,
        required this.ratingitemsUsersid,
        required this.ratingitemsUsersname,
        required this.ratingitemsItemsid,
        required this.ratingitemsRate,
        required this.ratingitemsComment,
        required this.ratingitemsTime,
    });

    factory AllratingitemsviewModel.fromJson(Map<String, dynamic> json) => AllratingitemsviewModel(
        ratingitemsId: json["ratingitems_id"],
        ratingitemsUsersid: json["ratingitems_usersid"],
        ratingitemsUsersname: json["ratingitems_usersname"],
        ratingitemsItemsid: json["ratingitems_itemsid"],
        ratingitemsRate: json["ratingitems_rate"],
        ratingitemsComment: json["ratingitems_comment"],
        ratingitemsTime: DateTime.parse(json["ratingitems_time"]),
    );

    Map<String, dynamic> toJson() => {
        "ratingitems_id": ratingitemsId,
        "ratingitems_usersid": ratingitemsUsersid,
        "ratingitems_usersname": ratingitemsUsersname,
        "ratingitems_itemsid": ratingitemsItemsid,
        "ratingitems_rate": ratingitemsRate,
        "ratingitems_comment": ratingitemsComment,
        "ratingitems_time": ratingitemsTime.toIso8601String(),
    };
}
