import 'package:delivery/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessResetPwController extends GetxController {
  goToLogIn();
}

class SuccessResetPwControllerImp extends SuccessResetPwController {
  @override
  goToLogIn() {
    Get.offAllNamed(AppRoutes.login);
  }
}
