import 'package:ecommeria/core/constant/nameroutes.dart';
import 'package:ecommeria/core/middleware/mymiddleware.dart';


import 'package:ecommeria/view/screen/OnBoarding.dart';
import 'package:ecommeria/view/screen/address/addaddress.dart';
import 'package:ecommeria/view/screen/address/addressview.dart';
import 'package:ecommeria/view/screen/address/detailaddress.dart';
import 'package:ecommeria/view/screen/address/editaddress.dart';
import 'package:ecommeria/view/screen/orders/archive.dart';

import 'package:ecommeria/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommeria/view/screen/auth/forgetpassword/scucess_resetpassword.dart';
import 'package:ecommeria/view/screen/auth/login.dart';
import 'package:ecommeria/view/screen/auth/forgetpassword/resetpassword.dart';

import 'package:ecommeria/view/screen/auth/scucess_signup.dart';
import 'package:ecommeria/view/screen/auth/sginup.dart';
import 'package:ecommeria/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommeria/view/screen/auth/verifycode_signup.dart';
import 'package:ecommeria/view/screen/cart.dart';
import 'package:ecommeria/view/screen/checkout.dart';
import 'package:ecommeria/view/screen/home.dart';
import 'package:ecommeria/view/screen/homescreen.dart';
import 'package:ecommeria/view/screen/itemsscreen.dart';
import 'package:ecommeria/view/screen/langauge.dart';
import 'package:ecommeria/view/screen/myfavorite.dart';
import 'package:ecommeria/view/screen/orders/ordersdetail.dart';
import 'package:ecommeria/view/screen/orders/orderspending.dart';
import 'package:ecommeria/view/screen/orders/tracking.dart';
import 'package:ecommeria/view/screen/productdetail.dart';
import 'package:ecommeria/view/screen/ratingitemsdetail.dart';
import 'package:ecommeria/view/widget/productdetail/augment.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';



List<GetPage<dynamic>>? routes= [
// GetPage(name:  "/", page: ()=>const Language()),
GetPage(name:  "/", page: ()=>const Language() ,middlewares: [MyMiddleWare()]),

// ,middlewares: [MyMiddleWare()]

/////////////////////////////////////////////////
//for testing:
// GetPage(name:  "/", page: ()=>const Language() ),
// GetPage(name:  "/", page: ()=>const Cart()),
//  GetPage(name:  "/", page: ()=>const Testview()),
 ////////////////////////////////////////////////////////

GetPage(name:  AppRoutes.login, page: ()=>const Login()),
GetPage(name:  AppRoutes.OnBoarding, page: ()=>const OnBoarding()),
GetPage(name:  AppRoutes.sginup, page: ()=>const Sginup()),
GetPage(name:  AppRoutes.forgetpassword, page: ()=>ForgetPasswprd()),
GetPage(name:   AppRoutes.resetPassword, page: ()=>Resetpassword()),
GetPage(name:   AppRoutes.verifycode, page: ()=>const Verifycode()),
GetPage(name:    AppRoutes.scucess_resetpassword, page: ()=>const ScusessResetpassword()),
GetPage(name:    AppRoutes.scucess_sginup, page: ()=>const Scusesssginup()),


GetPage(name:    AppRoutes.verifycode_sginup, page: ()=>const Verifycode_sginup()),
GetPage(name:    AppRoutes.home, page: ()=>const HomeScreen()),
GetPage(name:    AppRoutes.items, page: ()=>const ItemsScreen()),
GetPage(name:    AppRoutes.productdetail, page: ()=>const ProductDetail()),
GetPage(name:    AppRoutes.myfavorite, page: ()=>const Myfavorite()),
GetPage(name:    AppRoutes.cart, page: ()=>const Cart()),
//=================== addresss ====
GetPage(name:    AppRoutes.addressview, page: ()=>const AddressView()),
GetPage(name:    AppRoutes.addaddress, page: ()=>const AddAddress()),
GetPage(name:    AppRoutes.detailaddress, page: ()=>const DetailAddress()),
GetPage(name:    AppRoutes.editeaddress, page: ()=>const EditAddress()),

// ===== augment ======
GetPage(name:    AppRoutes.augment, page: ()=>const Augement()),
//=========== checkout =============
GetPage(name:    AppRoutes.checkout, page: ()=>const Checkout()),

// ================ orders ===========

GetPage(name:    AppRoutes.orderspending, page: ()=>const Orderspending()),
GetPage(name:    AppRoutes.archive, page: ()=>const OrdersArchiveView()),
GetPage(name:    AppRoutes.ordersdetail, page: ()=>const OrdersDetail()),
 GetPage(name: AppRoutes.orderstracking, page: () => const Tracking()),

// ================= rating ==========
GetPage(name:    AppRoutes.ratingdetail, page: ()=>const Ratingitemsdetail()),

];




// Map<String, Widget Function(BuildContext)> routes = {
//   // AppRoutes.login: (context) => const Login(),
//   // AppRoutes.OnBoarding: (context) => const OnBoarding(),
//   // AppRoutes.sginup: (Context) => const Sginup(),
//   // AppRoutes.forgetpassword: (Context) => ForgetPasswprd(),
//   // AppRoutes.resetPassword: (Context) => Resetpassword(),
//   // AppRoutes.verifycode: (Context) => const Verifycode(),
//   // AppRoutes.scucess_resetpassword:(Context) => ScusessResetpassword(),
//   // AppRoutes.scucess_sginup:(Context) => Scusesssginup(),
 
//   AppRoutes.verifycode_sginup:(Context) => Verifycode_sginup(),
// };
