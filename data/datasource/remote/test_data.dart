import 'package:delivery/app_link.dart';
import 'package:delivery/core/class/crud.dart';

class TestData{
  Crud crud;

  TestData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.test, {});
   return response.fold((l) => l, (r) => r);
  }
}
