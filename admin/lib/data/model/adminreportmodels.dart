class AdminReportModels {
  String? totalwin;
  String? totalitemsprice;
  String? totalnumberorders;
  String? totalcountitems;
  String? totalpricedelivery;
  String? id;
  String? itemsprice;
  String? countitems;
  String? cartId;
  String? cartUsersid;
  String? cartItemsid;
  String? cartOrders;
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
  String? ordersId;
  String? ordersUsersid;
  String? ordersAddress;
  String? ordersType;
  String? ordersPricedelivery;
  String? ordersPrice;
  String? ordersTotalprice;
  String? ordersCoupon;
  String? ordersDate;
  String? ordersPaymentmethod;
  String? ordersStatus;
  String? ordersRating;
  String? ordersNotrating;
  String? ordersDelivery;

  AdminReportModels(
      {this.totalwin,
      this.totalitemsprice,
      this.totalnumberorders,
      this.totalcountitems,
      this.totalpricedelivery,
      this.id,
      this.itemsprice,
      this.countitems,
      this.cartId,
      this.cartUsersid,
      this.cartItemsid,
      this.cartOrders,
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
      this.ordersId,
      this.ordersUsersid,
      this.ordersAddress,
      this.ordersType,
      this.ordersPricedelivery,
      this.ordersPrice,
      this.ordersTotalprice,
      this.ordersCoupon,
      this.ordersDate,
      this.ordersPaymentmethod,
      this.ordersStatus,
      this.ordersRating,
      this.ordersNotrating,
      this.ordersDelivery});

  AdminReportModels.fromJson(Map<String, dynamic> json) {
    totalwin = json['totalwin'];
    totalitemsprice = json['totalitemsprice'];
    totalnumberorders = json['totalnumberorders'];
    totalcountitems = json['totalcountitems'];
    totalpricedelivery = json['totalpricedelivery'];
    id = json['id'];
    itemsprice = json['itemsprice'];
    countitems = json['countitems'];
    cartId = json['cart_id'];
    cartUsersid = json['cart_usersid'];
    cartItemsid = json['cart_itemsid'];
    cartOrders = json['cart_orders'];
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
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_usersid'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersPricedelivery = json['orders_pricedelivery'];
    ordersPrice = json['orders_price'];
    ordersTotalprice = json['orders_totalprice'];
    ordersCoupon = json['orders_coupon'];
    ordersDate = json['orders_date'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersStatus = json['orders_status'];
    ordersRating = json['orders_rating'];
    ordersNotrating = json['orders_notrating'];
    ordersDelivery = json['orders_delivery'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalwin'] = this.totalwin;
    data['totalitemsprice'] = this.totalitemsprice;
    data['totalnumberorders'] = this.totalnumberorders;
    data['totalcountitems'] = this.totalcountitems;
    data['totalpricedelivery'] = this.totalpricedelivery;
    data['id'] = this.id;
    data['itemsprice'] = this.itemsprice;
    data['countitems'] = this.countitems;
    data['cart_id'] = this.cartId;
    data['cart_usersid'] = this.cartUsersid;
    data['cart_itemsid'] = this.cartItemsid;
    data['cart_orders'] = this.cartOrders;
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
    data['orders_id'] = this.ordersId;
    data['orders_usersid'] = this.ordersUsersid;
    data['orders_address'] = this.ordersAddress;
    data['orders_type'] = this.ordersType;
    data['orders_pricedelivery'] = this.ordersPricedelivery;
    data['orders_price'] = this.ordersPrice;
    data['orders_totalprice'] = this.ordersTotalprice;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_date'] = this.ordersDate;
    data['orders_paymentmethod'] = this.ordersPaymentmethod;
    data['orders_status'] = this.ordersStatus;
    data['orders_rating'] = this.ordersRating;
    data['orders_notrating'] = this.ordersNotrating;
    data['orders_delivery'] = this.ordersDelivery;
    return data;
  }
}