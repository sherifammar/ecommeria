import 'package:ecommeria/core/class/crud.dart';
import 'package:ecommeria/linkapi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  postData(String username, String password, String email, String phone) async {
    // this method give l or r only

  

    //  var response = await crud.postData("http://192.168.1.3/ecommeria/aurh/signup.php", 
    // {
    //    "username" : username , // username is yellow from php ( $username= filterRequest("username"))== username is white from flutter
    //   "password" : password  , 
    //   "email" : email , 
    //   "phone" : phone  , 
    // });

     var response = await crud.postData("${AppLink.signup}", 
    {
       "username" : username , // username is yellow from php ( $username= filterRequest("username"))== username is white from flutter
      "password" : password  , 
      "email" : email , 
      "phone" : phone  , 
    });
// {}== map

    return response.fold((l) => l, (r) => r); // error => l not 1
  }
  // ================== fire base
//     fireBaseData(String email) async {
   

//        var response = await crud.postData(AppLink.firebaseauth, 
//     {
//        "email" : email , 
      
    
//     });
// // {}== map

//     return response.fold((l) => l, (r) => r); // error => l not 1
//   }

 fireBassignup(String username, String password, String email, String phone) async {
    
     var response = await crud.postData("${AppLink.firebasesignup}", 
    {
       "username" : username , // username is yellow from php ( $username= filterRequest("username"))== username is white from flutter
      "password" : password  , 
      "email" : email , 
      "phone" : phone  , 
    });
// {}== map

    return response.fold((l) => l, (r) => r); // error => l not 1
  }
}
