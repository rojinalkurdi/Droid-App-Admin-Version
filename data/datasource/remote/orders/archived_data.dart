import 'package:delivery/app_link.dart';
import 'package:delivery/core/class/crud.dart';

class ArchivedOrdersData{
  Crud crud;

  ArchivedOrdersData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.viewArchivedOrders, {});
   return response.fold((l) => l, (r) => r);
  }
}
