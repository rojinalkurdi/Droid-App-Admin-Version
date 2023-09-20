import 'package:delivery/app_link.dart';
import 'package:delivery/controller/categories/view_controller.dart';
import 'package:delivery/core/class/handling_data_view.dart';
import 'package:delivery/core/constant/colors.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Categoriescontroller());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Categories"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoutes.categoriesadd);
          },
          child: const Icon(Icons.add),
        ),
        body: GetBuilder<Categoriescontroller>(
            builder: ((controller) => HandlingDataView(
                statusrequest: controller.statusrequest,
                widget: WillPopScope(
                  onWillPop: () {
                    return controller.myBack();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Image.network(
                                    "${AppLink.categoriesImages}/${controller.data[index].categoriesImage}",
                                    height: 70,
                                    width: 70,
                                    color: AppColors.darkYellow,
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: ListTile(
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon:
                                              const Icon(Icons.delete_outlined),
                                          onPressed: () {
                                            Get.defaultDialog(
                                                title: "Warning!",
                                                middleText:
                                                    "Are you sure you want to delete this category?",
                                                onCancel: () {},
                                                onConfirm: () {
                                                  controller.deleteCategory(
                                                      controller.data[index]
                                                          .categoriesId!,
                                                      controller.data[index]
                                                          .categoriesImage!);
                                                  Get.back();
                                                });
                                          },
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.edit),
                                          onPressed: () {
                                            controller.goToEditPage(
                                                controller.data[index]);
                                          },
                                        ),
                                      ],
                                    ),
                                    title: Text(
                                        controller.data[index].categoriesName!),
                                    //or we can say: categoriesmodel.categoriesName instead of controller.data[index].categoriesName if we created an object from categoriesModel
                                  ))
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )))));
  }
}
