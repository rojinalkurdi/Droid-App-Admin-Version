import 'package:delivery/app_link.dart';
import 'package:delivery/core/class/crud.dart';

class CartData{
  Crud crud;

  CartData(this.crud);

  addCart(int itemsid, int usersid) async {
    var response = await crud.postData(AppLink.cartAdd, {
      "itemsid" : itemsid.toString(),
      "usersid" : usersid.toString()
    });
   return response.fold((l) => l, (r) => r);
  }

  deleteCart(int itemsid, int usersid) async {
    var response = await crud.postData(AppLink.cartDelete, {
      "itemsid" : itemsid.toString(),
      "usersid" : usersid.toString()
    });
   return response.fold((l) => l, (r) => r);
  }

   getitemsCart(int itemsid, int usersid) async {
    var response = await crud.postData(AppLink.getitemscount, {
      "itemsid" : itemsid.toString(),
      "usersid" : usersid.toString()
    });
   return response.fold((l) => l, (r) => r);
  }

  viewCart(int usersid) async {
    var response = await crud.postData(AppLink.cartView, {
      "usersid" : usersid.toString()
    });
   return response.fold((l) => l, (r) => r);
  }

   checkCoupon(String couponName) async {
    var response = await crud.postData(AppLink.checkCoupon, {
      "couponname" : couponName,
    });
   return response.fold((l) => l, (r) => r);
  }
}
