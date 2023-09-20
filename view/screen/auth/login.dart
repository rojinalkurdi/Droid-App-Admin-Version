import 'package:delivery/controller/auth/login_controller.dart';
import 'package:delivery/core/constant/colors.dart';
import 'package:delivery/view/widget/auth/custom_button_auth.dart';
import 'package:delivery/view/widget/auth/logo_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/handling_data_view.dart';
import '../../../core/functions/valid_input.dart';
import '../../widget/auth/custom_title.dart';
import '../../widget/auth/text_form_field.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            centerTitle: true,
            title: Text("Sign In",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: AppColors.grey),
                textAlign: TextAlign.center)),
        body: GetBuilder<LoginControllerImp>(
            builder: (controller) => HandlingDataView(
                  statusrequest: controller.statusrequest!,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          const LogoAuth(),
                          const SizedBox(height: 20),
                          const CustomTitle(text: "Welcome To Hey Taxi!"),
                          // const SizedBox(height: 10),
                          // const CustomTextBody(
                          //  textBody:
                          //    "Enter Your Email And Passowrd\n For Signing in with Hey Taxi!"),
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
                          CustomTextFormField(
                              isNumber: false,
                              valid: (val) {
                                return validInput(val!, 8, 50, "password");
                              },
                              obscureText: controller.hidePassword,
                              onTapIcon: () => controller.showPassword(),
                              myController: controller.password,
                              hintText: "enter your password",
                              labelText: "Password",
                              icons: controller.hidePassword
                                  ? Icons.remove_red_eye_outlined
                                  : Icons.visibility_off_outlined),
                          const SizedBox(height: 15),
                          InkWell(
                            onTap: () {
                              controller.goToForgetPw();
                            },
                            child: Text("Forget Your Password?",
                                textAlign: TextAlign.end,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 15,
                                        color: AppColors.grey,
                                        fontWeight: FontWeight.bold)),
                          ),
                          ButtonAuth(
                              textButton: "Sign In",
                              onPressed: () {
                                controller.login();
                              }),
                          const SizedBox(height: 25),
                          // SignInUpText(
                          //     txt: "Don't Have An Account?",
                          //     onTap: () => controller.goToSignUp(),
                          //     inkwellText: "Sign Up"),
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
