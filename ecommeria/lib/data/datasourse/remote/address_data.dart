import 'package:ecommeria/core/class/crud.dart';
import 'package:ecommeria/linkapi.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);

  addAddress(
    String usersid,
    String city,
    String street,
    String lat,
    String long,
    String addressname,
  ) async {
    var response = await crud.postData(AppLink.add_address,
     {
      "usersid": usersid,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
      "addressname": addressname,
    });

    return response.fold((l) => l, (r) => r); // error => l not 1
  }

//=========================================

  removeAddress(String addressid) async {
    var response = await crud.postData(AppLink.deletaddress, {
      "addressid": addressid,
    }); // {}== map
    return response.fold((l) => l, (r) => r); // error => l not 1
  }

//==================================================

  viewaddress(String usersid) async {
    var response = await crud.postData(AppLink.viewaddress, {
      "usersid": usersid,
    });

    return response.fold((l) => l, (r) => r); // error => l not 1
  }

    editAddress(
    String addressid,
    String city,
    String street,
    String lat,
    String long,
    String addressname,
   
    
    ) async {
    var response = await crud.postData(AppLink.editaddress, {
      "addressid":addressid,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
      "addressname": addressname,
      
    });

    return response.fold((l) => l, (r) => r); // error => l not 1
  }

}
