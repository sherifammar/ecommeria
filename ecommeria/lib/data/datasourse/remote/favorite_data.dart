import 'package:ecommeria/core/class/crud.dart';
import 'package:ecommeria/linkapi.dart';

class favoriteData {
  Crud crud;
  favoriteData(this.crud);
  addFavorite(String usersid, String itemsid) async {
    // this method give l or r only

    // var response = await crud.postData(
    //     'http://192.168.1.3/ecommeria/favorite/addfavorite.php', {
    //   'usersid': usersid,
    //   "itemsid": itemsid
    // }); // id of items.php ,, {}== map

    var response = await crud.postData(
        '${AppLink.addfavorite}', {'usersid': usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r); // error => l not 1
  }

  removeFavorite(String usersid, String itemsid) async {
    // this method give l or r only

    // var response = await crud.postData(
    //     'http://192.168.1.3/ecommeria/favorite/removefavorite.php',
    //     {'usersid': usersid, "itemsid": itemsid});
// "usersid" => from php , userid from flutter
    var response = await crud.postData(
        '${AppLink.removefavorite}', {'usersid': usersid, "itemsid": itemsid});

    return response.fold((l) => l, (r) => r); // error => l not 1
  }


}
