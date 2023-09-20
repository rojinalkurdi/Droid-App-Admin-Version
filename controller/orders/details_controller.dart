import 'dart:async';
import 'package:delivery/data/model/cart_model.dart';
import 'package:delivery/data/model/orders_model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../core/class/statusRequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasource/remote/orders/details_data.dart';

class OrdersDetailsController extends GetxController {
  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());
  List<CartModel> data = [];
  late StatusRequest statusrequest;
  List<Marker> markers = [];
  double? lat;
  double? long;
  Completer<GoogleMapController>? completerController =
      Completer<GoogleMapController>();
  CameraPosition? kGooglePlex;
  late OrdersModel ordersModel;

  initialData() {
    kGooglePlex = CameraPosition(
      target: LatLng(ordersModel.addressLat!, ordersModel.addressLong!),
      zoom: 12.4746,
    );
    //to place a marker at the chosen user's address
    markers.add(Marker(
      markerId: const MarkerId("1"),
      position: LatLng(ordersModel.addressLat!, ordersModel.addressLong!),
    ));
  }

  getData() async {
    statusrequest = StatusRequest.loading;
    var response = await ordersDetailsData.getData(ordersModel.ordersId!);
    statusrequest = handlingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        List dataList = response['data'];
        data.addAll(dataList.map((e) => CartModel.fromJson(e)));
      } else {
        statusrequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersDetails'];
    getData();
    initialData();
    super.onInit();
  }
}
