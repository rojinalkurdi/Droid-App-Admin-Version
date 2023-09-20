import 'package:delivery/app_link.dart';
import 'package:delivery/core/class/crud.dart';

class AddressData{
  Crud crud;

  AddressData(this.crud);

  getData(int usersid) async {
    var response = await crud.postData(AppLink.addressView, {
      "usersid" :usersid.toString(),
    });
   return response.fold((l) => l, (r) => r);
  }
  addData(int usersid, String addressName, String city, String street , String lat, String long) async {
    var response = await crud.postData(AppLink.addressAdd, {
       "usersid" :usersid.toString(),
      "addressname" :addressName,
      "city" : city ,
      "street" : street,
      "lat" : lat,
      "long" : long,

    });
   return response.fold((l) => l, (r) => r);
  }
  deleteData(int addressid) async {
    var response = await crud.postData(AppLink.addressDelete, {
      "addressid" : addressid.toString(),
    });
   return response.fold((l) => l, (r) => r);
  }
}
