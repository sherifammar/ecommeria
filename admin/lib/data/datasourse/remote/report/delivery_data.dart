import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class DeliveryData {
  Crud crud;
  DeliveryData(this.crud);

// ===================================
  getUnapprovedeliveryData() async {
    var response =
        await crud.postData(AppLink.unapprovedelivery, {}); // {}== map
    return response.fold((l) => l, (r) => r);
  }

  approveDeliveryData(String deliveryid) async {
    var response = await crud.postData(AppLink.approvedelivery, {
      "deliveryid": deliveryid,
    }); // {}== map
    return response.fold((l) => l, (r) => r);
  }

  deletDelivery(String deliveryid) async {
    var response = await crud.postData(AppLink.deletdelivery, {
      "deliveryid": deliveryid,
    }); // {}== map
    return response.fold((l) => l, (r) => r);
  }
     getMaxDeliveryData() async {
    var response = await crud.postData(AppLink.maxdelivery, {}); // {}== map
    return response.fold((l) => l, (r) => r);
  }
}
