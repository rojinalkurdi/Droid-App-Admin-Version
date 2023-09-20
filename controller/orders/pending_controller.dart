import 'package:delivery/core/class/statusRequest.dart';
import 'package:delivery/data/datasource/remote/orders/pending_data.dart';
import 'package:delivery/data/model/orders_model.dart';
import 'package:get/get.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/my_services.dart';

class PendingOrdersController extends GetxController {
  PendingOrdersData pendingData = PendingOrdersData(Get.find());
  MyServices myServices = Get.find();
  List<OrdersModel> data = [];
  late StatusRequest statusrequest;

  // printOrderDeliveryType(int val) {
  //   if (val == 0) {
  //     return "Motor";
  //   } else {
  //     return "Truck";
  //   }
  // }

  printPaymentMethod(int val) {
    if (val == 0) {
      return "Cach MTN";
    } else {
      return "Cach Syriatel";
    }
  }

  printOrderStatus(int val) {
    if (val == 0) {
      return "Processing...";
    } else if (val == 1) {
      return "Preparing";
    } else if (val == 2) {
      return "Preparing";
    } else {
      return "Archived";
    }
  }

  getOrders() async {
    data.clear();
    statusrequest = StatusRequest.loading;
    var response = await pendingData
        .getPendingData();
    statusrequest = handlingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
        // data.addAll(response['data']);
      } else {
        statusrequest = StatusRequest.failure;
      }
    }
    update();
  }


    approveOrders(int ordersid, int usersid) async {
    data.clear();
    statusrequest = StatusRequest.loading;
    var response = await pendingData
        .approveOrdersData(ordersid, usersid);
    statusrequest = handlingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
     
      } else {
        statusrequest = StatusRequest.failure;
      }
    }
    update();
  }


  refreshOrders() {
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
