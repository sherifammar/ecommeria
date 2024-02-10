class WinadminModels {
  String? day;
  String? mounth;
  String? year;
  String? totalitemsprice;
  String? totalnumberorders;
  String? totalcountitems;
  String? totalpricedelivery;
  String? totaldiscountcoupon;
  String? totaldiscount;

  WinadminModels(
      {this.day,
      this.mounth,
      this.year,
      this.totalitemsprice,
      this.totalnumberorders,
      this.totalcountitems,
      this.totalpricedelivery,
      this.totaldiscountcoupon,
      this.totaldiscount});

  WinadminModels.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    mounth = json['mounth'];
    year = json['year'];
    totalitemsprice = json['totalitemsprice'];
    totalnumberorders = json['totalnumberorders'];
    totalcountitems = json['totalcountitems'];
    totalpricedelivery = json['totalpricedelivery'];
    totaldiscountcoupon = json['totaldiscountcoupon'];
    totaldiscount = json['totaldiscount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['mounth'] = this.mounth;
    data['year'] = this.year;
    data['totalitemsprice'] = this.totalitemsprice;
    data['totalnumberorders'] = this.totalnumberorders;
    data['totalcountitems'] = this.totalcountitems;
    data['totalpricedelivery'] = this.totalpricedelivery;
    data['totaldiscountcoupon'] = this.totaldiscountcoupon;
    data['totaldiscount'] = this.totaldiscount;
    return data;
  }
}