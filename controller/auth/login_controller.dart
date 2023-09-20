//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:delivery/core/class/statusRequest.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/core/services/my_services.dart';
import 'package:delivery/data/datasource/remote/auth/login_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/handlingdata.dart';

abstract class LoginController extends GetxController {
  login();
 // goToSignUp();
  goToForgetPw();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool hidePassword = true;
  StatusRequest? statusrequest = StatusRequest.none;
  MyServices myservices = Get.find();
  LoginData logindata = LoginData(Get.find());

  showPassword() {
    hidePassword = hidePassword == true ? false : true;
    update();
  }

  @override
  login() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusrequest = StatusRequest.loading;
      update();
      var response = await logindata.postdata(email.text, password.text);
      print('response: $response');
      statusrequest = handlingData(response);
      if (StatusRequest.success == statusrequest) {
        if (response['status'] == "success") {
          //  data.addAll(response['data']);
          //encodeJson returns map that cotains ['status'] and ['data'] if status was 'success'
          //we need to get data grom backend and store it in sharedPreferncdes
          // ['data'] has got so many columns in the table so we need to specify which column we want to catch data from
          //for every user it's so importnant to get his personal info for different using.
          //so we ceated an instance from myServices class to get find the data we gave.          myservices.sharedPreferences.setString("id", response['data']['users_id']);
          myservices.sharedPreferences
              .setInt("id", response['data']['users_id']);
          myservices.sharedPreferences
              .setString("username", response['data']['users_name']);
          myservices.sharedPreferences
              .setString("email", response['data']['users_email']);
          myservices.sharedPreferences
              .setString("phone", response['data']['users_phone']);
          myservices.sharedPreferences.setString("step", "2");
          Get.offNamed(AppRoutes.homePage);
        } else {
          Get.defaultDialog(
              title: "Warning",
              middleText: "The Email Or Password Are Incorrect");
          statusrequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  goToForgetPw() {
    Get.toNamed(AppRoutes.forgetPw);
  }

  // @override
  // goToSignUp() {
  //   Get.offNamed(AppRoutes.signUp);
  // }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
