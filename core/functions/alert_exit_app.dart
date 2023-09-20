//هاد واجهة تنبيه عند الخروج من التطبيق هل انت متأكد من انك تريد الخروج بس ما حبيتا كتير غليظة و ما عاد حدا عملها
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

alertExitApp() {
  return Get.defaultDialog(
      title: "Warning",
      middleText: "Are You Sure You Want /n To Exit The App",
      actions: [
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            child:const Text("Yes")),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("No")),
      ]);
}
