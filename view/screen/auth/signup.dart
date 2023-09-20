import 'package:delivery/core/constant/colors.dart';
import 'package:delivery/view/widget/auth/custom_text_body.dart';
import 'package:delivery/view/widget/auth/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/signup_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/functions/valid_input.dart';
import '../../widget/auth/custom_button_auth.dart';
import '../../widget/auth/text_form_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(SignUpControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text("Create a manager account",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: AppColors.grey),
              textAlign: TextAlign.center)),
      body: GetBuilder<SignUpControllerImp>(
        builder: (controller) => 
        HandlingDataView(statusrequest: controller.statusrequest!, widget: 
         Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      const SizedBox(height: 10),
                      const CustomTitle(text: "add a new manager to Droid app"),
                      const SizedBox(height: 10),
                      const CustomTextBody(
                          textBody:
                              "Fill The Following Required Info\n To Create Manager Account"),
                      const SizedBox(height: 15),
                      CustomTextFormField(
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 2, 10, "Manager Name");
                          },
                          myController: controller.userName,
                          hintText: "enter Manager name",
                          labelText: "Manager Name",
                          icons: Icons.person_outline),
                      CustomTextFormField(
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 15, 50, "email");
                          },
                          myController: controller.email,
                          hintText: "enter Manager email",
                          labelText: "Email",
                          icons: Icons.email_outlined),
                      CustomTextFormField(
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 8, 50, "password");
                          },
                          myController: controller.password,
                          hintText: "enter Manager password",
                          labelText: "Password",
                          icons: Icons.lock_outline_rounded),
                      CustomTextFormField(
                          isNumber: true,
                          valid: (val) {
                            return validInput(val!, 7, 20, "phone");
                          },
                          myController: controller.phoneNumber,
                          hintText: "enter Manager phone number",
                          labelText: "Phone Number",
                          icons: Icons.phone_android_outlined),
                      const SizedBox(height: 40),
                      ButtonAuth(
                          textButton: "Done",
                          onPressed: () {
                            controller.signUp();
                          }),
                      // const SizedBox(height: 25),
                      // SignInUpText(
                      //     txt: "Have An Account Already?",
                      //     onTap: () => controller.goToLogin(),
                      //     inkwellText: "Login"),
                    ],
                  ),
                ),
              ),
      ),
    ));
  }
}
