import 'package:delivery/core/class/statusRequest.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/data/datasource/remote/forgetpassword/resetpassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/functions/handlingdata.dart';

abstract class ResetPwController extends GetxController {
  resetPassword();
  goToSuccessResetPw();
}

class ResetPwControllerImp extends ResetPwController {
  ResetpasswordData resetpwdata = ResetpasswordData(Get.find());
  late TextEditingController password;
  late TextEditingController repassword;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest? statusrequest = StatusRequest.none;
  String? email;

  @override
  resetPassword() {}

  @override
  goToSuccessResetPw() async {
    if (password.text != repassword.text) {
      return Get.defaultDialog(
          title: "Warning!", middleText: "The Passwords Are Not Matching");
    }
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusrequest = StatusRequest.loading;
      update();
      var response = await resetpwdata.postdata(email!, password.text);
      print('response: $response');
      statusrequest = handlingData(response);
      if (StatusRequest.success == statusrequest) {
        if (response['status'] == "success") {
          //  data.addAll(response['data']);
          Get.offNamed(AppRoutes.successResetPw);
        } else {
          Get.defaultDialog(title: "Warning", middleText: "Please Try Again");
          statusrequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
     super.dispose();
  }
}
