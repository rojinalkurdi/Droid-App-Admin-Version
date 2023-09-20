import 'dart:io';
import 'package:delivery/controller/items/view_controller.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/core/functions/uploadfile.dart';
import 'package:delivery/data/datasource/remote/Items_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:delivery/core/class/statusRequest.dart';
import '../../core/functions/handlingdata.dart';

class ItemsAddcontroller extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());
  List data = [];
  StatusRequest? statusrequest = StatusRequest.none;
  late TextEditingController name;
  late TextEditingController desc;
  late TextEditingController count;
  late TextEditingController price;
  late TextEditingController discount;
  String? catid;
  File? file;

  chooseImage() async {
    file = await fileGalleryUpload(true);
    update();
  }

  add() async {
    if (file == null) Get.snackbar("Warnigng!", "Please choose an image");
    statusrequest = StatusRequest.loading;
    update();
    Map data = {
      "name": name.text,
    };
    var response = await itemsData.add(data, file!);
    statusrequest = handlingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.itemsview);
        ItemsController items = Get.find();
        items.getData();
      } else {
        statusrequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    name = TextEditingController();
    desc = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    count = TextEditingController();
    super.onInit();
  }
}
