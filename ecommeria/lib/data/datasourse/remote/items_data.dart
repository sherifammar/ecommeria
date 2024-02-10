import 'package:ecommeria/core/class/crud.dart';
import 'package:ecommeria/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData(String id, String userid) async{// this method give l or r only

var response = await crud.postData('${AppLink.items}', {'id':id.toString(),"userid": userid });
// id of items.php ,, {}== map// id.tostring from flutter page
// id => catogeries id
return response.fold((l) => l, (r) => r);


  }


  
}