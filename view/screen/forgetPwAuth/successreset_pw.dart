import 'package:flutter/material.dart';
import 'package:delivery/controller/forgetpassword/success_resetpw_controller.dart';
import 'package:delivery/core/constant/colors.dart';
import 'package:get/get.dart';
import '../../widget/auth/custom_button_auth.dart';
import '../../widget/auth/custom_text_body.dart';
import '../../widget/auth/custom_title.dart';

class SuccessResetPw extends StatelessWidget {
  const SuccessResetPw({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPwControllerImp controller =
        Get.put(SuccessResetPwControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text("LogIn",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: AppColors.grey),
              textAlign: TextAlign.center)),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Center(
              child: Icon(
                Icons.check_circle,
                size: 150,
                color: AppColors.darkYellow,
              ),
            ),
            const CustomTitle(
                text:
                    "Congratulations!\n Your Password Has Been Reset Successfully"),
            const SizedBox(height: 15),
            const CustomTextBody(textBody: "Please Press On Continue To LogIn"),
            const SizedBox(height: 15),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ButtonAuth(
                  textButton: "Continue",
                  onPressed: () {
                    controller.goToLogIn();
                  }),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
