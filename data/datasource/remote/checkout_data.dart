import 'package:delivery/app_link.dart';
import 'package:delivery/core/class/crud.dart';


class CheckoutData {
  Crud crud;

  CheckoutData(this.crud);

   getCheckout(int usersid, int addressid, int deliveryPrice, int ordersPrice, int couponid,int discountCoupon, int paymentMethod) async {
    var response = await crud.postData(AppLink.checkout, {
      "usersid" : usersid.toString(),
      "addressid" : addressid.toString(),
      //"type" : type.toString(),
      "deliveryprice" : deliveryPrice.toString(),
      "ordersprice" : ordersPrice.toString(),
      "couponid" : couponid.toString(),
      "discountcoupon" : discountCoupon.toString(),
      "paymentmethod" : paymentMethod.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  // getCheckout(Map data) async {
  //   var response = await crud.postData(AppLink.checkout, data);
  //   return response.fold((l) => l, (r) => r);
  // }
}
