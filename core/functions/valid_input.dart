import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "can't be empty";
  }
  if (type == "userName") {
    if (!GetUtils.isUsername(val)) {
      return "not valid Username";
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "not valid Email";
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "not valid Phone Number";
    }
  }

  if (val.length < min) {
    return "can't be less than $min Characters";
  }
  if (val.length > max) {
    return "can't be larger than $max Characters";
  }
}
