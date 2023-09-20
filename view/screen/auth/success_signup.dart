import 'package:delivery/controller/auth/success_signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';
import '../../widget/auth/custom_button_auth.dart';
import '../../widget/auth/custom_text_body.dart';
import '../../widget/auth/custom_title.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller = Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text("Sign Up",
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
                    "Congratulations!\n Your Account Has Been Created Successfully"),
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
