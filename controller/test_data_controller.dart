import 'package:delivery/data/datasource/remote/test_data.dart';
import 'package:get/get.dart';
import 'package:delivery/core/class/statusRequest.dart';

import '../core/functions/handlingdata.dart';

class TestDatacontroller extends GetxController {
  TestData testData = TestData(Get.find());

  List data = [];
  late StatusRequest statusrequest;
  getData() async {
    statusrequest = StatusRequest.loading;
    var response = await testData.getData();
    statusrequest = handlingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusrequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
