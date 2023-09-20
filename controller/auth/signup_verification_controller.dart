import 'package:delivery/core/class/statusRequest.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/data/datasource/remote/auth/verify_data.dart';
import 'package:get/get.dart';

import '../../core/functions/handlingdata.dart';

abstract class SignUpVerificationController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verifyCode);
}

class SignUpVerificationControllerImp extends SignUpVerificationController {
  String? email;
  StatusRequest? statusrequest = StatusRequest.none;
  SignupVerifyCodeData signupverificationcodeData =
      SignupVerifyCodeData(Get.find());

  @override
  checkCode() {}

  @override
  goToSuccessSignUp(String verifyCode) async {
    statusrequest = StatusRequest.loading;
    update();
    var response =
        await signupverificationcodeData.postdata(email!, verifyCode);
    print('response: $response');
    statusrequest = handlingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        //  data.addAll(response['data']);
        Get.offNamed(AppRoutes.successSignUp);
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
