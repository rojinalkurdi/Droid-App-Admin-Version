import 'package:flutter/material.dart';
import 'package:delivery/controller/forgetpassword/forgetpw_controller.dart';

import 'package:delivery/core/constant/colors.dart';

import 'package:delivery/view/widget/auth/custom_button_auth.dart';
import 'package:delivery/view/widget/auth/custom_text_body.dart';
import 'package:get/get.dart';

import '../../../core/class/handling_data_view.dart';
import '../../../core/functions/valid_input.dart';
import '../../widget/auth/custom_title.dart';
import '../../widget/auth/text_form_field.dart';


class ForgetPw extends StatelessWidget {
  const ForgetPw({super.key});

  @override
  Widget build(BuildContext context) {
   Get.put(ForgetPwControllerImp());

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
        body: GetBuilder<ForgetPwControllerImp>(builder: ((controller) =>
       HandlingDataView(statusrequest: controller.statusrequest!, widget:
         Container(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  const SizedBox(height: 10),
                  const CustomTitle(text: "Recover Your Password Via Email"),
                  const SizedBox(height: 10),
                  const CustomTextBody(
                      textBody:
                          "Please Enter Your Email Address \n To Receive A varifaction Code"),
                  const SizedBox(height: 15),
                  CustomTextFormField(
                    isNumber: false,
                      valid: (val) {
                        return validInput(val!, 15, 50, "email");
                      },
                      myController: controller.email,
                      hintText: "enter your email",
                      labelText: "Email",
                      icons: Icons.email_outlined),
                  const SizedBox(height: 40),
                  ButtonAuth(
                      textButton: "Check",
                      onPressed: () {
                        controller.checkEmail();
                      }),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ))
        ))
    );
  }
}
