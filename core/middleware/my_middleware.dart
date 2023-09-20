import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/core/services/my_services.dart';
import 'package:get/get.dart';

class MyMiddleware extends GetMiddleware {
  
  @override
  int? get priority => 1;

  MyServices myservices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myservices.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: AppRoutes.homePage);
    }
    if (myservices.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: AppRoutes.login);
    }
    return null;
  }
}
