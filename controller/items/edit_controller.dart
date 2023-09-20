import 'dart:io';
import 'package:delivery/controller/items/view_controller.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/core/functions/uploadfile.dart';
import 'package:delivery/data/datasource/remote/Items_data.dart';
import 'package:delivery/data/model/Items_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:delivery/core/class/statusRequest.dart';
import '../../core/functions/handlingdata.dart';

class ItemsEditcontroller extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());
  List data = [];
  StatusRequest? statusrequest = StatusRequest.none;
  late TextEditingController name;
  File? file;
  //we must get Items list to edit it, so will pass it from (view) the arguments and handle it here
  ItemsModel? itemsmodel;

  chooseImage() async {
    file = await fileGalleryUpload(true);
    update();
  }

  edit() async {
    statusrequest = StatusRequest.loading;
    update();
    Map data = {
      "name": name.text,
      "oldimage": itemsmodel!.itemsImage,
      "id": itemsmodel!.itemsId.toString()
    };
    var response = await itemsData.edit(data, file);
    statusrequest = handlingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.itemsview);
        ItemsController item = Get.find();
        item.getData();
      } else {
        statusrequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    name = TextEditingController();
    itemsmodel = Get.arguments['Itemsmodel'];
    name.text = itemsmodel!.itemsName.toString();
    super.onInit();
  }
}
