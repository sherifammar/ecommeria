
import 'package:ecommeria/core/constant/nameroutes.dart';

import '../../core/class/StatusRequest.dart';

import 'package:get/get.dart';


import '../../core/function/handlingdatacontroller.dart';
import '../../core/services/servives.dart';
import '../../data/datasourse/remote/address_data.dart';
import '../../data/datasourse/remote/orders/checkout_data.dart';
import '../../data/model/addressmodel.dart';

import '../../stripe_payment/payment_manager.dart';
import '../home_controller.dart';

class ChechoutController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
 HomeControllerImp homecintroller = Get.put(HomeControllerImp());


  CheckoutData checkoutdata = CheckoutData(Get.find());
  AddressData addressdata = AddressData(Get.find());
  Myservices myservices = Get.find();
  List<AddressModel> dataaddress = [];
  late String couponid;
  late String orderprice;

  String? discountcoupon;

  String? checkPayment;
  String? checkDelivery;
  String checkAddress = "0";
  String? priceshiping;
    String? couponnamedata;

  choosePaymentmethod(String val) {
    checkPayment = val;
    update();
  }

  chooseDeliverymethod(String val) {
    checkDelivery = val;
    update();
  }

  chooseAddressmethod(String val) {
    checkAddress = val;
    update();
  }

  getAddressview() async {
    statusRequest = StatusRequest.loading;

    var response = await addressdata
        .viewaddress(myservices.sharedPreferences.getString("id")!);

    print("**************** $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response["data"];

        dataaddress.addAll(responsedata.map((e) => AddressModel.fromJson(e)));
         checkAddress = dataaddress[0].addressId.toString(); // if forget => add addresss automatic
        print(dataaddress);
        print("address ");
       
      } else {
        if (dataaddress.isEmpty) {
          Get.snackbar("warm", "please check add adress and make check");
          Get.toNamed(AppRoutes.addaddress);
          // ====================== sherif 
          // fetchNameAndMaplocation() ;
          // =======================
          
        }
        // statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  getCheckout() async {
    if (checkPayment == null) {
      return Get.snackbar("warm", "please check payment method");
    }
    if (checkDelivery == null) {
      return Get.snackbar("warm", "please check delivery method");
    }

    statusRequest = StatusRequest.loading;
    update();

    
      Map data = {// ahh data is string
        "usersid": myservices.sharedPreferences.getString("id"),
        "ordersaddress": checkAddress.toString(),// convert addressid to string
        "orderstype": checkDelivery.toString(),
        "orderspricedelivery": priceshiping,// myservices.sharedPreferences.getString('priceofdelivery'),
        "ordersprice": orderprice,
        "orderscoupon": couponid,
        "coupondiscount": discountcoupon.toString(),
        "orderspaymentmethod": checkPayment.toString(),
         "couponrecordercouponname":couponnamedata.toString()
      };
      var response = await checkoutdata.checkout(data);

      print("**************** $response");
      statusRequest = handdlingData(
          response); // it give statusrequest error or statusrequest sucess

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
           
          // 
          Get.offAllNamed(AppRoutes.home);

          print("ok done");
          print(data);
          print("address ");
        } else {
          statusRequest = StatusRequest.none;
          Get.snackbar("warm", "you have error");
        
      }
      update();
    } else {
      Get.snackbar("warm", "please complet form");
    }
  }
payCard(){
  choosePaymentmethod("1");
  PaymentManager.makePayment(double.parse(orderprice).toInt(), "EGP");
}
  @override
  void onInit() {
    orderprice = Get.arguments["priceorder"]; // it is string from cart page
    couponid = Get.arguments["couponid"];
    discountcoupon = Get.arguments["discountcoupon"].toString();
    priceshiping= Get.arguments["shiping"];
     couponnamedata=Get.arguments["couponnamecart"];
    print("couponnamecart =====================>>>>${couponnamedata}");
    getAddressview();
    super.onInit();
  }
}
