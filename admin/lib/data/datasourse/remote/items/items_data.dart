import 'dart:io';

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData
(this.crud);

  itemsviewData() async {
    var response = await crud.postData(AppLink.itemsview, {}); // {}== map
    return response.fold((l) => l, (r) => r); // error => l not 1
  }

  addItems(Map data, File file) async {
    var response = await crud.addRequestWithImageOne(
        AppLink.additems, data, file); // {}== map
    return response.fold((l) => l, (r) => r); // error => l not 1
  }

  editeItems(Map data, [File? file]) async {
    var response;
    if (file == null) { // have not image
      response = await crud.postData(AppLink.editeitems, data);
    } else { // have  image
      response =
          await crud.addRequestWithImageOne(AppLink.editeitems, data, file);
    } //  addRequestWithImageOne using for upload file
    // {}== map
    return response.fold((l) => l, (r) => r); // error => l not 1
  }

  deletItems(Map data) async {
    var response = await crud.postData(AppLink.deletitems, data); // {}== map
    return response.fold((l) => l, (r) => r); // error => l not 1
  }
}
