class MyratingitemsModel {
  String? ratingitemsId;
  String? ratingitemsUsersid;
  String? ratingitemsItemsid;
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDecsAr;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsDate;
  String? itemsCat;
  String? itempricediscount;
  String? stars;
  String? ratingitemsRate;
  String? ratingitemsComment;

  MyratingitemsModel(
      {this.ratingitemsId,
      this.ratingitemsUsersid,
      this.ratingitemsItemsid,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDesc,
      this.itemsDecsAr,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDate,
      this.itemsCat,
      this.itempricediscount,
      this.stars,
      this.ratingitemsRate,
      this.ratingitemsComment});

  MyratingitemsModel.fromJson(Map<String, dynamic> json) {
    ratingitemsId = json['ratingitems_id'];
    ratingitemsUsersid = json['ratingitems_usersid'];
    ratingitemsItemsid = json['ratingitems_itemsid'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDecsAr = json['items_decs_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
    itempricediscount = json['itempricediscount'];
    stars = json['stars'];
    ratingitemsRate = json['ratingitemsRate'];
    ratingitemsComment = json['ratingitemsComment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ratingitems_id'] = this.ratingitemsId;
    data['ratingitems_usersid'] = this.ratingitemsUsersid;
    data['ratingitems_itemsid'] = this.ratingitemsItemsid;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc'] = this.itemsDesc;
    data['items_decs_ar'] = this.itemsDecsAr;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_date'] = this.itemsDate;
    data['items_cat'] = this.itemsCat;
    data['itempricediscount'] = this.itempricediscount;
    data['stars'] = this.stars;
    data['ratingitemsRate'] = this.ratingitemsRate;
    data['ratingitemsComment'] = this.ratingitemsComment;

    return data;
  }
}
