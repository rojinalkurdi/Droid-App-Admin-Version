import 'package:delivery/core/class/statusRequest.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/data/datasource/remote/forgetpassword/checkemail.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/functions/handlingdata.dart';

abstract class ForgetPwController extends GetxController {
  checkEmail();
}

class ForgetPwControllerImp extends ForgetPwController {
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  late TextEditingController email;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest? statusrequest=StatusRequest.none;

  @override
  checkEmail() async{
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
   statusrequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postdata(email.text) ;
      print('response: $response');
      statusrequest = handlingData(response);
      if (StatusRequest.success == statusrequest) {
        if (response['status'] == "success") {
          //  data.addAll(response['data']);
          Get.offNamed(AppRoutes.varifactionCode, arguments: {
            "email" : email.text
          });
        } else {
          Get.defaultDialog(
              title: "Warning",
              middleText:
                  "The Email Is Not Exist");
          statusrequest = StatusRequest.failure;
        }
      }
      update();
    }
  }



  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
