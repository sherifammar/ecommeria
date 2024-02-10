class UsersadminModels {
  String? count;
  String? cartUsersid;
  String? totalmoney;
  String? usersId;
  String? usersName;
  String? usersPassword;
  String? usersEmail;
  String? usersPhone;
  String? usersVerfiycode;
  String? usersApprove;
  String? usersCreate;

  UsersadminModels(
      {this.count,
      this.cartUsersid,
      this.totalmoney,
      this.usersId,
      this.usersName,
      this.usersPassword,
      this.usersEmail,
      this.usersPhone,
      this.usersVerfiycode,
      this.usersApprove,
      this.usersCreate});

  UsersadminModels.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    cartUsersid = json['cart_usersid'];
    totalmoney = json['totalmoney'];
    usersId = json['users_id'];
    usersName = json['users_name'];
    usersPassword = json['users_password'];
    usersEmail = json['users_email'];
    usersPhone = json['users_phone'];
    usersVerfiycode = json['users_verfiycode'];
    usersApprove = json['users_approve'];
    usersCreate = json['users_create'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['cart_usersid'] = this.cartUsersid;
    data['totalmoney'] = this.totalmoney;
    data['users_id'] = this.usersId;
    data['users_name'] = this.usersName;
    data['users_password'] = this.usersPassword;
    data['users_email'] = this.usersEmail;
    data['users_phone'] = this.usersPhone;
    data['users_verfiycode'] = this.usersVerfiycode;
    data['users_approve'] = this.usersApprove;
    data['users_create'] = this.usersCreate;
    return data;
  }
}