import 'package:ecommeria/core/class/crud.dart';
import 'package:ecommeria/linkapi.dart';

class CheckoutData {
  Crud crud;
  CheckoutData(this.crud);
  checkout(Map data) async{// this method give l or r only

var response = await crud.postData(AppLink.checkout, data);// {}== map
return response.fold((l) => l, (r) => r);// error => l not 1


  }

  }