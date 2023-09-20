import 'dart:io';

import 'package:delivery/controller/categories/view_controller.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/core/functions/uploadfile.dart';
import 'package:delivery/data/datasource/remote/categories_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:delivery/core/class/statusRequest.dart';
import '../../core/functions/handlingdata.dart';

class CategoriesAddcontroller extends GetxController {
  CategoriesData categoriesAdd = CategoriesData(Get.find());
  List data = [];
  StatusRequest? statusrequest = StatusRequest.none;
  late TextEditingController name;
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
    var response = await categoriesAdd.add(data, file!);
    statusrequest = handlingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.categoriesview);
        Categoriescontroller cat = Get.find();
        cat.getData();
      } else {
        statusrequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    name = TextEditingController();
    super.onInit();
  }
}
