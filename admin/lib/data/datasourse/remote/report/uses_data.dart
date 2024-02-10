import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class UsesData {
  Crud crud;
  UsesData(this.crud);

// ===================================
  getUnapproveUsersData() async {
    var response = await crud.postData(AppLink.unapproveusers, {}); // {}== map
    return response.fold((l) => l, (r) => r);
  }

  approveUsersData(String usersid) async {
    var response = await crud.postData(AppLink.approveusers, {
      "usersid": usersid,
    }); // {}== map
    return response.fold((l) => l, (r) => r);
  }


    getMaxUsersData() async {
    var response = await crud.postData(AppLink.maxusers, {}); // {}== map
    return response.fold((l) => l, (r) => r);
  }
}
