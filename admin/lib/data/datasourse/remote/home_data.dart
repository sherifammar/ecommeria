
import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class HomeData{
  Crud crud;
  HomeData(this.crud);
  getData() async{// this method give l or r only




var response = await crud.postData(AppLink.checkcountitems, {});// {}== map
return response.fold((l) => l, (r) => r);


  }

  
 
 
  
}