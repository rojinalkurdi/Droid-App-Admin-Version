import 'dart:io';

import 'package:delivery/controller/categories/view_controller.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/core/functions/uploadfile.dart';
import 'package:delivery/data/datasource/remote/categories_data.dart';
import 'package:delivery/data/model/categories_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:delivery/core/class/statusRequest.dart';
import '../../core/functions/handlingdata.dart';

class CategoriesEditcontroller extends GetxController {
  CategoriesData categoriesEdit = CategoriesData(Get.find());
  List data = [];
  StatusRequest? statusrequest = StatusRequest.none;
  late TextEditingController name;
  File? file;
  //we must get categories list to edit it, so will pass it from (view) the arguments and handle it here
  CategoriesModel? categoriesmodel;

  chooseImage() async {
    file = await fileGalleryUpload(true);
    update();
  }

  edit() async {
    statusrequest = StatusRequest.loading;
    update();
    Map data = {
      "name": name.text,
      "oldimage": categoriesmodel!.categoriesImage!,
      "id": categoriesmodel!.categoriesId.toString()
    };
    var response = await categoriesEdit.edit(data, file);
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
    categoriesmodel = Get.arguments['categoriesmodel'];
    name.text = categoriesmodel!.categoriesName!;
    super.onInit();
  }
}
