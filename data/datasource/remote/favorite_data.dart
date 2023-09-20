import 'package:delivery/app_link.dart';
import 'package:delivery/core/class/crud.dart';

class FavoriteData{
  Crud crud;

  FavoriteData(this.crud);

  addFavorite(int itemsid, int usersid) async {
    var response = await crud.postData(AppLink.favoriteAdd, {
      "itemsid" : itemsid.toString(),
      "usersid" : usersid.toString()
    });
   return response.fold((l) => l, (r) => r);
  }

  removeFavorite(int itemsid, int usersid) async {
    var response = await crud.postData(AppLink.favoriteRemove, {
      "itemsid" : itemsid.toString(),
      "usersid" : usersid.toString()
    });
   return response.fold((l) => l, (r) => r);
  }
}
