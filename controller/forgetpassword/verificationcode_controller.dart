import 'package:delivery/core/class/statusRequest.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/data/datasource/remote/forgetpassword/verifycodepw.dart';
import 'package:get/get.dart';

import '../../core/functions/handlingdata.dart';

abstract class VerificationCodeController extends GetxController {
  checkCode();
  goToResetPw(String verifyCode);
}

class VerificationCodeControllerImp extends VerificationCodeController {
  String? email;
  VerifycodePwData verifycodedata = VerifycodePwData(Get.find());
  StatusRequest? statusrequest = StatusRequest.none;

  @override
  checkCode() {}

  @override
  goToResetPw(verifyCode) async {
    statusrequest = StatusRequest.loading;
    update();
    var response =
        await verifycodedata.postdata(email!, verifyCode);
    print('response: $response');
    statusrequest = handlingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        //  data.addAll(response['data']);
        Get.offNamed(AppRoutes.resetPw, arguments: {
          "email" : email
        });
      } else {
        Get.defaultDialog(title: "Warning", middleText: "Incorrect Code");
        statusrequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
