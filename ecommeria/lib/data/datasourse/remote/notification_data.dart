import 'package:ecommeria/core/class/crud.dart';
import 'package:ecommeria/linkapi.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);
  getData(String usersid) async{// this method give l or r only

var response = await crud.postData(AppLink.notificationview, {

"usersid":usersid

});// {}== map
return response.fold((l) => l, (r) => r);// error => l not 1


  }}