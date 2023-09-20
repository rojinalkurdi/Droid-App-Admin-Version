import 'package:delivery/app_link.dart';
import 'package:delivery/core/class/crud.dart';

class HomeData{
  Crud crud;

  HomeData(this.crud);

  getData() async {
    // home api need get method, not post
    //it's just a name of the function
    var response = await crud.postData(AppLink.homepage, {});
   return response.fold((l) => l, (r) => r);
  }

   searchData(String search) async {
    // home api need get method, not post
    //it's just a name of the function
    var response = await crud.postData(AppLink.searchItems, {"search" : search});
   return response.fold((l) => l, (r) => r);
  }

 
}
