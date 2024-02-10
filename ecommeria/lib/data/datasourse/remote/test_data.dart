import 'package:ecommeria/core/class/crud.dart';
import 'package:ecommeria/linkapi.dart';

class TestData {
  Crud crud;
  TestData(this.crud);
  getData() async{// this method give l or r only

var response = await crud.postData(AppLink.test, {});// {}== map
return response.fold((l) => l, (r) => r);// error => l not 1


  }

  
//   getData() async{// this method give l or r only and test fetch data fromlocalhost

// var response = await crud.postData(AppLink.test, {});// {}== map
// return response.fold((l) => l, (r) => r);// error => l not 1


//   }
  
}