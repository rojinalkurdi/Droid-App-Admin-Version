import 'package:delivery/app_link.dart';
import 'package:delivery/controller/items/view_controller.dart';
import 'package:delivery/core/class/handling_data_view.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Items"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoutes.itemsadd);
          },
          child: const Icon(Icons.add),
        ),
        body: GetBuilder<ItemsController>(
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
                                    "${AppLink.itemsImages}/${controller.data[index].itemsImage}",
                                    height: 70,
                                    width: 70,
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
                                                    "Are you sure you want to delete this Item?",
                                                onCancel: () {},
                                                onConfirm: () {
                                                  controller.deleteItem(
                                                      controller.data[index]
                                                          .itemsId.toInt(),
                                                      controller.data[index]
                                                          .itemsImage.toString());
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
                                        controller.data[index].itemsName.toString()),
                                    //or we can say: Itemsmodel.ItemsName instead of controller.data[index].ItemsName if we created an object from ItemsModel
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
