import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/class/StatusRequest.dart';
import '../core/constant/nameroutes.dart';
import '../core/function/handlingdatacontroller.dart';
import '../core/services/servives.dart';
import '../data/datasourse/remote/message_data.dart';

class Messagecontroller extends GetxController {
  Myservices myservices = Get.find();

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController title;
  late TextEditingController body;
  late TextEditingController usersid;
  late TextEditingController top;

  late StatusRequest statusRequest = StatusRequest.none;
  MessageData sendMessage = MessageData(Get.find());

  insertMessage() async {
    if (formState.currentState!.validate()) {
    update();
    statusRequest = StatusRequest.loading;
    var response = await sendMessage.getData(usersid.text, title.text, body.text, top.text);

    print("****************   $response");
    statusRequest = handdlingData(
        response);

   
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.snackbar("Success", "Message is send");
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }}

  @override
  void onInit() {
    title = TextEditingController();
    body = TextEditingController();
    usersid = TextEditingController();
    top = TextEditingController();

    super.onInit();
  }
}
