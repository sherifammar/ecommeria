class AppLink {
  static const String server = "http://192.168.1.240/ecommeria";

  static const String test = "$server/test.php";

  //==============auth========//

  static const String login = "$server/aurh/login.php";
  static const String signup = "$server/aurh/signup.php";
  static const String VerfiyCodeSignup = "$server/aurh/resendverfiycode.php";
  // ================ firrbase
  static const String firebaseauth = "$server/aurh/firebaseauth.php";
  static const String firebasesignup = "$server/aurh/firebasesign.php";

  // ======= forgetpassword=====//

  static const String checkemail = "$server/forgetpassword/checkemail.php";
  static const String resetpassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verfiycode =
      "$server/forgetpassword/verifycodecheckemail.php";

  //===================cart ======================

  static const String addcart = "$server/cart/addcart.php";
  static const String removecart = "$server/cart/removecart.php";
  static const String countItemscart = "$server/cart/getcountitems.php";
  static const String viewcart = "$server/cart/viewcart.php";

  // ================coupon

  static const String coupon = "$server/cart/coupon.php";

  // =========== favorite=======//

  static const String addfavorite = "$server/favorite/addfavorite.php";
  static const String removefavorite = "$server/favorite/removefavorite.php";

//=======home ====

  static const String home = "$server/home.php";

// ==== items ====

  static const String items = "$server/items/items.php";

// === my favorite ==

  static const String viewmyfavorite = "$server/favorite/viewmyfavorite.php";

  static const String deletfavorite = "$server/favorite/deletfavorite.php";

  // ===== search ====

  static const String search = "$server/items/search.php";

  // ========= address ==
  static const String viewaddress = "$server/address/viewaddress.php";
  static const String add_address = "$server/address/add.php";
  static const String deletaddress = "$server/address/delet.php";
  static const String editaddress = "$server/address/edit.php";

  // ================check out ===
  static const String checkout = "$server/orders/addchechout.php";

  // =================== orders

  static const String pending = "$server/orders/pendingorders.php";
  static const String archive = "$server/orders/archive.php";
  static const String ordersdetail = "$server/orders/ordersdetail.php";
  static const String deletorders = "$server/orders/deletorders.php";
  static const String rating = "$server/orders/rating.php";
  //    ====================== notification =====
  static const String notificationview = "$server/notification.php";

  //  ================ offers ===
  static const String offers = "$server/offers.php";

  // ================= ratingitems ================
  static const String addRatingitems = "$server/ratingitems/ratingitems.php";

  static const String allratingitemsview ="$server/ratingitems/allratingitemsview.php";

  //  =================== go to favorite to productdetail page =====
static const String myfavoriteToproductdetail ="$server/myfavoritetoproductdetail.php";




}
