import 'package:delivery/app_link.dart';
import 'package:delivery/core/class/crud.dart';

class PendingOrdersData{
  Crud crud;

  PendingOrdersData(this.crud);

  getPendingData() async {
    var response = await crud.postData(AppLink.viewPendingOrders, {});
   return response.fold((l) => l, (r) => r);
  }

  approveOrdersData(int ordersid, int usersid) async {
    var response = await crud.postData(AppLink.approveOrders, {
      "id" : ordersid.toString(),
      "usersid" : usersid.toString()
    });
   return response.fold((l) => l, (r) => r);
  }
}
