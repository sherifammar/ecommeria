import 'package:get/get.dart';

validinput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "not valid username";
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return " not valid email";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "not valid phone";
    }
  }

  if (val.length < min) {// length of string =0
    return "it is less tna $min ";
  } // error =>val .length

  if (val.length > max) {
    return " it is longer than $max ";
  }
  if (val.isEmpty) {
    return "it is empty";
  }
}
