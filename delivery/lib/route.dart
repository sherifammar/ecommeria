import 'package:delivery/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:delivery/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:delivery/view/screen/auth/forgetpassword/scucess_resetpassword.dart';
import 'package:delivery/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:delivery/view/screen/auth/login.dart';
import 'package:delivery/view/screen/auth/scucess_signup.dart';
import 'package:delivery/view/screen/auth/sginup.dart';
import 'package:delivery/view/screen/auth/verifycode_signup.dart';
import 'package:delivery/view/screen/homescreen.dart';
import 'package:delivery/view/screen/langauge.dart';
import 'package:delivery/view/screen/orders/archive.dart';
import 'package:delivery/view/screen/orders/ordersdetail.dart';
import 'package:delivery/view/screen/orders/orderspending.dart';
import 'package:delivery/view/screen/orders/tracking.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'core/constant/nameroutes.dart';
import 'core/middleware/mymiddleware.dart';
import 'data/datasourse/remote/orders/archive_data.dart';

List<GetPage<dynamic>>? routes = [
// GetPage(name:  "/", page: ()=>const Language()),
  GetPage(
      name: "/", page: () => const Login(), middlewares: [MyMiddleWare()]),
// ,middlewares: [MyMiddleWare()]

/////////////////////////////////////////////////
//for testing:
// GetPage(name:  "/", page: ()=>const Login()),
// GetPage(name:  "/", page: ()=>const Cart()),
//  GetPage(name:  "/", page: ()=>const Testview()),
  ////////////////////////////////////////////////////////

// GetPage(name:  AppRoutes.login, page: ()=>const Login()),

  GetPage(name: AppRoutes.sginup, page: () => const Sginup()),
  GetPage(name: AppRoutes.forgetpassword, page: () => ForgetPasswprd()),
  GetPage(name: AppRoutes.resetPassword, page: () => Resetpassword()),
  GetPage(name: AppRoutes.verifycode, page: () => const Verifycode()),
  GetPage(
      name: AppRoutes.scucess_resetpassword,
      page: () => const ScusessResetpassword()),
  GetPage(name: AppRoutes.scucess_sginup, page: () => const Scusesssginup()),

  GetPage(
      name: AppRoutes.verifycode_sginup, page: () => const Verifycode_sginup()),
  GetPage(name: AppRoutes.home, page: () => const HomeScreen()),

// ================ orders ===========

  GetPage(name: AppRoutes.orderspending, page: () => const Orderspending()),
  GetPage(name: AppRoutes.Archivedelivery, page: () => Archivedelivery()),
  GetPage(name: AppRoutes.ordersdetail, page: () => const OrdersDetail()),
  GetPage(name: AppRoutes.orderstracking, page: () => const Tracking()),


  
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
