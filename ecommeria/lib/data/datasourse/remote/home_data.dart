import 'package:ecommeria/core/class/crud.dart';
import 'package:ecommeria/linkapi.dart';

class HomeData{
  Crud crud;
  HomeData(this.crud);
  getData() async{// this method give l or r only

// var response = await crud.postData('http://192.168.1.3/ecommeria/home.php', {});// {}== map
// return response.fold((l) => l, (r) => r);// error => l not 1


var response = await crud.postData('${AppLink.home}', {});// {}== map
return response.fold((l) => l, (r) => r);


  }

  
 
  searchData(String search) async{// this method give l or r only

var response = await crud.postData(AppLink.search, {"search":search});// {}== map
return response.fold((l) => l, (r) => r);// error => l not 1


  }
  
}