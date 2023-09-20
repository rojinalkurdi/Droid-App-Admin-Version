import 'package:delivery/view/screen/orders/accepted.dart';
import 'package:delivery/view/screen/orders/pending.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class OrdersScreenController extends GetxController {
  changePage(int i);
}

class OrdersScreenControllerImp extends OrdersScreenController {
  int currentpage = 0;

  List<Widget> pagesList = [
  const PendingOrders(),
  const AcceptedOrders(),

  
 
  ];

  List pagesNames = [
    "Pending",
    "Accepted",

  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
