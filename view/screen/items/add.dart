import 'package:delivery/controller/Items/add_controller.dart';
import 'package:delivery/core/class/handling_data_view.dart';
import 'package:delivery/core/constant/colors.dart';
import 'package:delivery/core/functions/valid_input.dart';
import 'package:delivery/core/shared/global_text_form_field.dart';
import 'package:delivery/view/widget/home/custom_cart_button.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AddItems extends StatelessWidget {
  const AddItems({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsAddcontroller());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Items"),
        ),
        body: GetBuilder<ItemsAddcontroller>(
            builder: (controller) => HandlingDataView(statusrequest: controller.statusrequest!, widget: Container(
                  padding: const EdgeInsets.all(15),
                  child: ListView(
                    children: [
                      GlobalTextFormField(
                          hintText: "add itme name",
                          labelText: "itme name",
                          icons: Icons.production_quantity_limits_outlined,
                          myController: controller.name,
                          valid: (val) {
                            return validInput(val!, 1, 30, "");
                          },
                          isNumber: false),
                          GlobalTextFormField(
                          hintText: "add itme description",
                          labelText: "itme description",
                          icons: Icons.description_outlined,
                          myController: controller.name,
                          valid: (val) {
                            return validInput(val!, 1, 30, "");
                          },
                          isNumber: false),
                          GlobalTextFormField(
                          hintText: "add itme price",
                          labelText: "itme price",
                          icons: Icons.price_check_outlined,
                          myController: controller.name,
                          valid: (val) {
                            return validInput(val!, 1, 30, "");
                          },
                          isNumber: false),
                          GlobalTextFormField(
                          hintText: "add itme count",
                          labelText: "itme count",
                          icons: Icons.queue_play_next_outlined,
                          myController: controller.name,
                          valid: (val) {
                            return validInput(val!, 1, 30, "");
                          },
                          isNumber: false),
                          GlobalTextFormField(
                          hintText: "add itme discount",
                          labelText: "itme discount",
                          icons: Icons.discount_outlined,
                          myController: controller.name,
                          valid: (val) {
                            return validInput(val!, 1, 30, "");
                          },
                          isNumber: false),
                           GlobalTextFormField(
                          hintText: "Choose the related category",
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
                            child: const Text("Choose itme image")),
                      ),
                      //  if(controller.file != null)
                      //    SvgPicture.file(controller.file!),
                      
                      CustomButton(
                          onPressed: () {
                            controller.add();
                          },
                          text: "Add itme"),
                    ],
                  ),
                ))));
  }
}
