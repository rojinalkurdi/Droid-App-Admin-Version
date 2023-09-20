import 'package:delivery/core/class/statusRequest.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/data/datasource/remote/auth/signup_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/handlingdata.dart';

abstract class SignUpcontroller extends GetxController {
  signUp();
  goToLogin();
}

class SignUpControllerImp extends SignUpcontroller {
  late TextEditingController userName;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phoneNumber;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  StatusRequest? statusrequest = StatusRequest.none;

  SignupData signupdata = SignupData(Get.find());
  List data = [];

  @override
  signUp() async {
    print('start --------------------------------');
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusrequest = StatusRequest.loading;
      update();
      var response = await signupdata.postdata(
          userName.text, password.text, email.text, phoneNumber.text);
      print('response: $response');
      statusrequest = handlingData(response);
      if (StatusRequest.success == statusrequest) {
        if (response['status'] == "success") {
          //  data.addAll(response['data']);
          Get.offNamed(AppRoutes.homePage);
          Get.snackbar("Congrats!",
              "The manager's account has been created successfully!");
        } else {
          Get.defaultDialog(
              title: "Warning",
              middleText:
                  "The Email Or Phone Number You Have Entered Already Exists");
          statusrequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  goToHomepage() {
    Get.offNamed(AppRoutes.homePage);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    userName = TextEditingController();
    phoneNumber = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    userName.dispose();
    phoneNumber.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToLogin() {
    // TODO: implement goToLogin
    throw UnimplementedError();
  }
}
