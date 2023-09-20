import 'package:delivery/app_link.dart';
import 'package:delivery/core/class/crud.dart';

class VerifycodePwData {
  Crud crud;

  VerifycodePwData(this.crud);

  postdata(String email, String verifycodepw) async {
    var response = await crud.postData(AppLink.verifycodepw, {
      "email" : email,
      "verifycode" : verifycodepw
    });
   return response.fold((l) => l, (r) => r);
  }
}
