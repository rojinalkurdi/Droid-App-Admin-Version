import 'package:delivery/controller/auth/signup_verification_controller.dart';
import 'package:delivery/core/constant/colors.dart';
import 'package:delivery/view/widget/auth/custom_text_body.dart';
import 'package:delivery/view/widget/auth/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../core/class/handling_data_view.dart';


class SignUpVerification extends StatelessWidget {
  const SignUpVerification({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpVerificationControllerImp());

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            centerTitle: true,
            title: Text("Identity Verification",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: AppColors.grey),
                textAlign: TextAlign.center)),
        body: GetBuilder<SignUpVerificationControllerImp>(
            builder: ((controller) =>
               HandlingDataView(statusrequest: controller.statusrequest!, widget: 
                     Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        child: ListView(
                          children: [
                            const SizedBox(height: 10),
                            const CustomTitle(text: "verification Code"),
                            const SizedBox(height: 10),
                            const CustomTextBody(
                                textBody:
                                    "Enter The Verificaton Code \n You Received To Verify Your Identity"),
                            const SizedBox(height: 15),
                            OtpTextField(
                              fieldWidth: 50.0,
                              borderRadius: BorderRadius.circular(15),
                              numberOfFields: 5,
                              borderColor: const Color(0xFF512DA8),
                              showFieldAsBox: true,
                              //we don't need controller to handle the value here
                              //because this package doesn't accept controller
                              //and it handles the value by the onCodeChanged function
                              //onSubmit: (string code){} here the parameter code is the entered value but
                              //we named it verificationCode instead of code 
                              onCodeChanged: (String code) {},
                              onSubmit: (String verificationCode) {
                                controller.goToSuccessSignUp(verificationCode);
                              },
                            ),
                            const SizedBox(height: 40),
                          ],
                        ),
                      )))));
  }
}
