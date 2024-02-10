class AppLink {
  static const String server = "http://192.168.1.240/ecommeria/delivery";

  static const String test = "$server/test.php";

  //==============auth========//

  static const String login = "$server/aurh delivery/login.php";
  static const String signup = "$server/aurh delivery/signup.php";
  static const String VerfiyCodeSignup = "$server/aurh delivery/resendverfiycode.php";

  // ======= forgetpassword=====//

  static const String checkemail = "$server/forgetpassword delivery/checkemail.php";
  static const String resetpassword =
      "$server/forgetpassword delivery/resetpassword.php";
  static const String verfiycode =
      "$server/forgetpassword delivery/verifycodecheckemail.php";
   
//=======home ====

  static const String home = "$server/home.php";


  // =================== orders
 static const String viewaccept = "$server/order delivery/acceptorders.php";
  static const String viewpending = "$server/order delivery/pending.php";
  static const String viewarchive = "$server/order delivery/archive.php";
  static const String ordersdetail = "$server/order delivery/detaildelivery.php";
  static const String done = "$server/order delivery/done.php";
  
  static const String approve = "$server/order delivery/approvedelivery.php";
  //    ====================== notification =====





}
