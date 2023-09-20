import 'package:delivery/controller/categories/add_controller.dart';
import 'package:delivery/core/class/handling_data_view.dart';
import 'package:delivery/core/constant/colors.dart';
import 'package:delivery/core/functions/valid_input.dart';
import 'package:delivery/core/shared/global_text_form_field.dart';
import 'package:delivery/view/widget/home/custom_cart_button.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AddCategories extends StatelessWidget {
  const AddCategories({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesAddcontroller());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Categories"),
        ),
        body: GetBuilder<CategoriesAddcontroller>(
            builder: (controller) => HandlingDataView(statusrequest: controller.statusrequest!, widget: Container(
                  padding: const EdgeInsets.all(15),
                  child: ListView(
                    children: [
                      GlobalTextFormField(
                          hintText: "add category name",
                          labelText: "Category Name",
                          icons: Icons.category,
                          myController: controller.name,
                          valid: (val) {
                            return validInput(val!, 1, 30, "");
                          },
                          isNumber: false),
                      Container(
                        padding: const EdgeInsets.all(15),
                        child: MaterialButton(
                            color: AppColors.secColor,
                            onPressed: () {
                              controller.chooseImage();
                            },
                            child: const Text("Choose category image")),
                      ),
                      //  if(controller.file != null)
                      //    SvgPicture.file(controller.file!),
                      
                      CustomButton(
                          onPressed: () {
                            controller.add();
                          },
                          text: "Add Category"),
                    ],
                  ),
                ))));
  }
}
