import 'package:flutter/material.dart';
import 'package:delivery/core/constant/colors.dart';
import 'package:delivery/view/widget/auth/custom_button_auth.dart';
import 'package:delivery/view/widget/auth/custom_text_body.dart';
import 'package:delivery/controller/forgetpassword/resetpw_controller.dart';
import 'package:get/get.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/functions/valid_input.dart';
import '../../widget/auth/custom_title.dart';
import '../../widget/auth/text_form_field.dart';


class ResetPw extends StatelessWidget {
  const ResetPw({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPwControllerImp());

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            centerTitle: true,
            title: Text("Password Recovery",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: AppColors.grey),
                textAlign: TextAlign.center)),
        body: GetBuilder<ResetPwControllerImp>(
            builder: ((controller) =>
            HandlingDataView(statusrequest: controller.statusrequest!, widget:
                 Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        child: Form(
                          key: controller.formstate,
                          child: ListView(
                            children: [
                              const SizedBox(height: 10),
                              const CustomTitle(text: "Reset Your Password"),
                              const SizedBox(height: 10),
                              const CustomTextBody(
                                  textBody: "Enter Your New Password \n"),
                              const SizedBox(height: 15),
                              CustomTextFormField(
                                  isNumber: false,
                                  valid: (val) {
                                    return validInput(val!, 8, 50, "password");
                                  },
                                  hintText: "enter password",
                                  labelText: "New Password",
                                  icons: Icons.lock_outlined,
                                  myController: controller.password),
                              CustomTextFormField(
                                  isNumber: false,
                                  valid: (val) {
                                    return validInput(val!, 8, 50, "password");
                                  },
                                  hintText: "Re-enter your password",
                                  labelText: "Re-Enter New Password",
                                  icons: Icons.lock_outlined,
                                  myController: controller.repassword),
                              ButtonAuth(
                                  textButton: "Save",
                                  onPressed: () {
                                    controller.goToSuccessResetPw();
                                  }),
                              const SizedBox(height: 25),
                            ],
                          ),
                        ),
                      )))));
  }
}
