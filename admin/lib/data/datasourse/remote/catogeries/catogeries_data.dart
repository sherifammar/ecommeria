import 'dart:io';

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class CatogeriesData {
  Crud crud;
  CatogeriesData(this.crud);

  catogeriesviewData() async {
    var response = await crud.postData(AppLink.catsview, {}); // {}== map
    return response.fold((l) => l, (r) => r); // error => l not 1
  }

  addCatogeries(Map data, File file) async {
    var response = await crud.addRequestWithImageOne(
        AppLink.addcats, data, file); // {}== map
    return response.fold((l) => l, (r) => r); // error => l not 1
  }

  editeCatogeries(Map data, [File? file]) async {
    var response;
    if (file == null) {
      response = await crud.postData(AppLink.editecats, data);
    } else {
      response =
          await crud.addRequestWithImageOne(AppLink.editecats, data, file);
    } //  addRequestWithImageOne using for upload file
    // {}== map
    return response.fold((l) => l, (r) => r); // error => l not 1
  }

  deletCatogeries(Map data) async {
    var response = await crud.postData(AppLink.deletcats, data); // {}== map
    return response.fold((l) => l, (r) => r); // error => l not 1
  }
}
