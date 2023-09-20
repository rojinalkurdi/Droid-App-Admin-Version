import 'package:delivery/core/class/handling_data_view.dart';
import 'package:delivery/core/constant/colors.dart';
import 'package:delivery/core/functions/valid_input.dart';
import 'package:delivery/core/shared/global_text_form_field.dart';
import 'package:delivery/view/widget/home/custom_cart_button.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controller/categories/edit_controller.dart';

class EditCategories extends StatelessWidget {
  const EditCategories({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesEditcontroller());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Categories"),
        ),
        body: GetBuilder<CategoriesEditcontroller>(
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
                            controller.edit();
                          },
                          text: "Edit Category"),
                    ],
                  ),
                ))));
  }
}
