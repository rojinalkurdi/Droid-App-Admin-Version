import 'package:delivery/app_link.dart';
import 'package:delivery/core/class/crud.dart';

class MyFavoriteData {
  Crud crud;

  MyFavoriteData(this.crud);

  getData(int id) async {
    var response =
        await crud.postData(AppLink.favoriteView, {"id": id.toString()});
   
    return response.fold((l) => l, (r) => r);
  }

    deleteData(int id) async {
    var response =
        await crud.postData(AppLink.deleteFromMyfavorite, {"id": id.toString()});
   
    return response.fold((l) => l, (r) => r);
  }
}
