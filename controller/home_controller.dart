import 'package:delivery/core/constant/routes.dart';
import 'package:get/get.dart';

class HomeControllerImp extends GetxController {
  goToSignupPage() {
    Get.toNamed(AppRoutes.signUp);
  }
}
