class AppLink {
  static const String server = "http://192.168.1.5/ecommeria/admin";
  static const String imagelink = "http://192.168.1.5/ecommeria/upload";
  static const String test = "$server/test.php";

  //==============auth========//

  static const String login = "$server/aurh admin/login.php";
  static const String signup = "$server/aurh admin/signup.php";
  static const String VerfiyCodeSignup = "$server/aurh admin/resendverfiycode.php";

  // ======= forgetpassword=====//

  static const String checkemail = "$server/forgetpassword admin/checkemail.php";
  static const String resetpassword =
      "$server/forgetpassword admin/resetpassword.php";
  static const String verfiycode =
      "$server/forgetpassword admin/verifycodecheckemail.php";
   
//=======home ====

  static const String home = "$server/home.php";


  // =================== orders =========
 static const String approve = "$server/orders/approveorders.php";
 static const String archive = "$server/orders/archive.php";
 static const String prepare = "$server/orders/prepare.php";
 static const String viewpending = "$server/orders/viewpending.php";
 static const String viewaccept = "$server/orders/viewaccept.php";
 static const String orderdetailsadmin = "$server/orders/orderdetailsadmin.php";
// =============================== report 
static const String reportingsearch = "$server/search.php";
static const String detailsadmin = "$server/detailsadmin.php";
static const String today = "$server/today.php";
//================== users
static const String maxusers = "$server/maxusers.php";
static const String unapproveusers = "$server/unapproveusers.php";
static const String approveusers = "$server/approveusers.php";
//================== delivery
static const String maxdelivery = "$server/maxdelivery.php";
static const String unapprovedelivery = "$server/unapproveddelivery.php";
static const String approvedelivery = "$server/approvedelivery.php";
static const String deletdelivery = "$server/deletdelivery.php";

  //    ====================== notification =====
static const String message = "$server/message.php";

// ==== cat
 static const String catsview = "$server/categories/view.php";
static const String addcats = "$server/categories/add.php";
static const String editecats = "$server/categories/edite.php";
static const String deletcats="$server/categories/delet.php";

// ======================= items

static const String itemsview = "$server/items/view.php";
static const String additems = "$server/items/add.php";
static const String editeitems = "$server/items/edite.php";
static const String deletitems="$server/items/delet.php";

}
