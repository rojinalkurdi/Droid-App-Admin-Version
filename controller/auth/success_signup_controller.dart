import 'package:delivery/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController {
  goToLogIn();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  goToLogIn() {
    Get.offAllNamed(AppRoutes.login);
  }
}
