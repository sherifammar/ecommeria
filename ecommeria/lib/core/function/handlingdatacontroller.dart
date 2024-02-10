import 'package:ecommeria/core/class/StatusRequest.dart';

handdlingData(response) {
  // response have to type map or statusrequest

  if (response is StatusRequest) {
    // StatusRequest class not instance

// main have problem
  return response;// response is statusrequest is error
  } else {
    // main scucess
    return StatusRequest.success; // main sucess and normal contition
  }
}
