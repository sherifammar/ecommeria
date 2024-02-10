class RatingitemsViewModel {
  String? ratingitemsId;
  String? ratingitemsUsersid;
  String? ratingitemsUsersname;
  String? ratingitemsItemsid;
  String? ratingitemsRate;
  String? ratingitemsComment;
  String? ratingitemsTime;
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

  RatingitemsViewModel(
      {this.ratingitemsId,
      this.ratingitemsUsersid,
      this.ratingitemsUsersname,
      this.ratingitemsItemsid,
      this.ratingitemsRate,
      this.ratingitemsComment,
      this.ratingitemsTime,
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
      this.stars});

  RatingitemsViewModel.fromJson(Map<String, dynamic> json) {
    ratingitemsId = json['ratingitems_id'];
    ratingitemsUsersid = json['ratingitems_usersid'];
    ratingitemsUsersname = json['ratingitems_usersname'];
    ratingitemsItemsid = json['ratingitems_itemsid'];
    ratingitemsRate = json['ratingitems_rate'];
    ratingitemsComment = json['ratingitems_comment'];
    ratingitemsTime = json['ratingitems_time'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ratingitems_id'] = this.ratingitemsId;
    data['ratingitems_usersid'] = this.ratingitemsUsersid;
    data['ratingitems_usersname'] = this.ratingitemsUsersname;
    data['ratingitems_itemsid'] = this.ratingitemsItemsid;
    data['ratingitems_rate'] = this.ratingitemsRate;
    data['ratingitems_comment'] = this.ratingitemsComment;
    data['ratingitems_time'] = this.ratingitemsTime;
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
    return data;
  }
}