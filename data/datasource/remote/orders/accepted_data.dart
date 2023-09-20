import 'package:delivery/app_link.dart';
import 'package:delivery/core/class/crud.dart';

class AcceptedOrdersData{
  Crud crud;

  AcceptedOrdersData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.viewAcceptedOrders, {});
   return response.fold((l) => l, (r) => r);
  }

   doneData(int id, int usersid) async {
    var response = await crud.postData(AppLink.doneOrders, {
      "id" : id.toString(),
      "usersid" : usersid.toString(),
    });
   return response.fold((l) => l, (r) => r);
  }
}
