import 'package:delivery/controller/items/edit_controller.dart';
import 'package:delivery/core/class/handling_data_view.dart';
import 'package:delivery/core/constant/colors.dart';
import 'package:delivery/core/functions/valid_input.dart';
import 'package:delivery/core/shared/global_text_form_field.dart';
import 'package:delivery/view/widget/home/custom_cart_button.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class EditItems extends StatelessWidget {
  const EditItems({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsEditcontroller());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Items"),
        ),
        body: GetBuilder<ItemsEditcontroller>(
            builder: (controller) => HandlingDataView(statusrequest: controller.statusrequest!, widget: Container(
                  padding: const EdgeInsets.all(15),
                  child: ListView(
                    children: [
                      GlobalTextFormField(
                          hintText: "add item name",
                          labelText: "item Name",
                          icons: Icons.production_quantity_limits_outlined,
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
                            child: const Text("Choose item image")),
                      ),
                      //  if(controller.file != null)
                      //    SvgPicture.file(controller.file!),
                      
                      CustomButton(
                          onPressed: () {
                            controller.edit();
                          },
                          text: "Edit item"),
                    ],
                  ),
                ))));
  }
}
