
import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class VerfiyCodeSignupData {
  Crud crud;
  VerfiyCodeSignupData(this.crud);
  postData( String email, String Verifycode) async {
    // this method give l or r only

    var response = await crud.postData("http://192.168.1.5/ecommeria/aurh delivery/verfiycode.php", 
    {
      
      "email" : email , 
      "verfiycode" : Verifycode  , 
    });
// {}== map

    return response.fold((l) => l, (r) => r); // error => l not 1
  }

  resendtData( String email) async {

    var response = await crud.postData("${AppLink.VerfiyCodeSignup}", 
    {
      
      "email" : email , 
     
    });
// {}== map

    return response.fold((l) => l, (r) => r); // error => l not 1
  }
}
