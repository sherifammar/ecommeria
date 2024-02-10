import 'package:ecommeria/core/class/crud.dart';
import 'package:ecommeria/linkapi.dart';

class offersData {
  Crud crud;
  offersData(this.crud);
  getOffersData() async{// this method give l or r only

var response = await crud.postData(AppLink.offers, {});// {}== map
return response.fold((l) => l, (r) => r);// error => l not 1


  }}