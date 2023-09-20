import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:delivery/core/constant/colors.dart';
import 'package:delivery/controller/forgetpassword/verificationcode_controller.dart';
import 'package:get/get.dart';

import '../../widget/auth/custom_text_body.dart';
import '../../widget/auth/custom_title.dart';

class VerificationCode extends StatelessWidget {
  const VerificationCode({super.key});

  @override
  Widget build(BuildContext context) {
    VerificationCodeControllerImp controller =
        Get.put(VerificationCodeControllerImp());

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            centerTitle: true,
            title: Text("Forget Password",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: AppColors.grey),
                textAlign: TextAlign.center)),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            child: ListView(
              children: [
                const SizedBox(height: 10),
                const CustomTitle(text: "varifaction Code"),
                const SizedBox(height: 10),
                const CustomTextBody(
                    textBody:
                        "Enter The Varifaction Code \n You Received To Verify Your Identity"),
                const SizedBox(height: 15),
                OtpTextField(
                  fieldWidth: 50.0,
                  borderRadius: BorderRadius.circular(15),
                  numberOfFields: 5,
                  borderColor: const Color(0xFF512DA8),
                  showFieldAsBox: true,
                  //we don't need controller to handle the value here
                  //because this (otp) package doesn't accept controller
                  //and it handles the value by the onCodeChanged function
                  //(string code){} here the parameter code is the entered value
                  //onSubmit:(string verificationCode) ---> the verificationCode parameter here is
                  //the final entered code
                  onCodeChanged: (String code) {},
                  onSubmit: (String verificationCode) {
                    controller.goToResetPw(verificationCode);
                  },
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        );
  }
}
