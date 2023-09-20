import 'package:delivery/app_link.dart';
import 'package:delivery/core/class/crud.dart';

class SignupData {
  Crud crud;

  SignupData(this.crud);

  postdata(String username , String password , String email, String phone) async {
    var response = await crud.postData(AppLink.signup, {
      "username" : username,
      "password" : password,
      "email" : email,
      "phone" : phone,
    });
   return response.fold((l) => l, (r) => r);
  }
}
