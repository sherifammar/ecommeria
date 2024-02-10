
import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class MessageData{
  Crud crud;
  MessageData(this.crud);
  getData(String usersid , String title , String body , String top) async{// this method give l or r only

var response = await crud.postData(AppLink.message, {
  "usersid": usersid,
  "title":title,
  "body":body,
  "top":top,

});
return response.fold((l) => l, (r) => r);
  }

  }