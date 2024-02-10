class DeliveryadminModels {
  String? count;
  String? ordersDelivery;
  String? totalpricedelivery;
  String? deliveryId;
  String? deliveryName;
  String? deliveryPassword;
  String? deliveryEmail;
  String? deliveryPhone;
  String? deliveryVerfiycode;
  String? deliveryApprove;
  String? deliveryCreate;

  DeliveryadminModels(
      {this.count,
      this.ordersDelivery,
      this.totalpricedelivery,
      this.deliveryId,
      this.deliveryName,
      this.deliveryPassword,
      this.deliveryEmail,
      this.deliveryPhone,
      this.deliveryVerfiycode,
      this.deliveryApprove,
      this.deliveryCreate});

  DeliveryadminModels.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    ordersDelivery = json['orders_delivery'];
    totalpricedelivery = json['totalpricedelivery'];
    deliveryId = json['delivery_id'];
    deliveryName = json['delivery_name'];
    deliveryPassword = json['delivery_password'];
    deliveryEmail = json['delivery_email'];
    deliveryPhone = json['delivery_phone'];
    deliveryVerfiycode = json['delivery_verfiycode'];
    deliveryApprove = json['delivery_approve'];
    deliveryCreate = json['delivery_create'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['orders_delivery'] = this.ordersDelivery;
    data['totalpricedelivery'] = this.totalpricedelivery;
    data['delivery_id'] = this.deliveryId;
    data['delivery_name'] = this.deliveryName;
    data['delivery_password'] = this.deliveryPassword;
    data['delivery_email'] = this.deliveryEmail;
    data['delivery_phone'] = this.deliveryPhone;
    data['delivery_verfiycode'] = this.deliveryVerfiycode;
    data['delivery_approve'] = this.deliveryApprove;
    data['delivery_create'] = this.deliveryCreate;
    return data;
  }
}