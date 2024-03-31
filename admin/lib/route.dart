
import 'package:admin/view/screen/addaddress.dart';
import 'package:admin/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:admin/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:admin/view/screen/auth/forgetpassword/scucess_resetpassword.dart';
import 'package:admin/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:admin/view/screen/auth/login.dart';
import 'package:admin/view/screen/auth/scucess_signup.dart';
import 'package:admin/view/screen/auth/sginup.dart';
import 'package:admin/view/screen/auth/verifycode_signup.dart';
import 'package:admin/view/screen/categories/addcatogeries.dart';
import 'package:admin/view/screen/categories/categories.dart';
import 'package:admin/view/screen/categories/editecatogeries.dart';
import 'package:admin/view/screen/delivery/approvedelivery.dart';
import 'package:admin/view/screen/delivery/deliverysetting.dart';
import 'package:admin/view/screen/delivery/maxdelivery.dart';
import 'package:admin/view/screen/home.dart';
import 'package:admin/view/screen/items/itemsadd.dart';
import 'package:admin/view/screen/items/itemsedite.dart';
import 'package:admin/view/screen/items/itemsview.dart';
import 'package:admin/view/screen/message.dart';
import 'package:admin/view/screen/orders/archive.dart';
import 'package:admin/view/screen/orders/ordersscreen.dart';
import 'package:admin/view/screen/orders/ordersdetail.dart';
import 'package:admin/view/screen/orders/orderspending.dart';
import 'package:admin/view/screen/orders/reporting.dart';
import 'package:admin/view/screen/setting.dart';
import 'package:admin/view/screen/users/approveusers.dart';
import 'package:admin/view/screen/users/maxusers.dart';
import 'package:admin/view/screen/users/userssetting.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'core/constant/nameroutes.dart';
import 'core/middleware/mymiddleware.dart';
import 'data/datasourse/remote/orders/archive_data.dart';

List<GetPage<dynamic>>? routes = [
// GetPage(name:  "/", page: ()=>const Login()),
  GetPage(name: "/", page: () => const Login(), middlewares: [MyMiddleWare()]),
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
  GetPage(name: AppRoutes.home, page: () => const Homepage()),

// ================ orders ===========

  GetPage(name: AppRoutes.orderspending, page: () => const Orderspending()),
  GetPage(name: AppRoutes.archive, page: () => const Archive()),
  GetPage(name: AppRoutes.ordersdetail, page: () => const OrdersDetail()),
GetPage(name: AppRoutes.orderscreen, page: () => const OrdersScreen()),
// ============= chart ============
GetPage(name: AppRoutes.reporting, page: () => const ReportScreen()),
// GetPage(name: AppRoutes.chart, page: () => const Chart()),

//======================= catogeries
  GetPage(name: AppRoutes.catogeriesview, page: () => const CategoriesView()),
  GetPage(name: AppRoutes.catogeriesedite, page: () => const Editecatogeries()),
  GetPage(name: AppRoutes.catogeriesadd, page: () => const Addcatogeries()),
  //======================= catogeries
  GetPage(name: AppRoutes.itemsview, page: () => const Itemsview()),
  GetPage(name: AppRoutes.itemsedite, page: () => const Itemsedite()),
  GetPage(name: AppRoutes.itemsadd, page: () => const Itemsadd()),
  // =======================
  GetPage(name: AppRoutes.userssetting, page: () => const Userssetting()),
  GetPage(name: AppRoutes.maxusers, page: () => const Maxusers()),
  GetPage(name: AppRoutes.unapproveusers, page: () => const Unapproveusers()),
  //===================
  GetPage(name: AppRoutes.deliverysetting, page: () => const Deliverysetting()),
  GetPage(name: AppRoutes.maxdelivery, page: () => const Maxdelivery()),
  GetPage(name: AppRoutes.unapprovedelivery, page: () => const UnapproveDelivery()),
  GetPage(name: AppRoutes.message, page: () => const Messagesending()),
  //==================
      GetPage(name: AppRoutes.setting, page: () => const Settingadd()),
     GetPage(name: AppRoutes.addaddress, page: () => const AddAddress()),
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
