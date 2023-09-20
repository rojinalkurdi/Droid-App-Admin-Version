import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/data/datasource/remote/categories_data.dart';
import 'package:delivery/data/model/categories_model.dart';
import 'package:get/get.dart';
import 'package:delivery/core/class/statusRequest.dart';
import '../../core/functions/handlingdata.dart';

class Categoriescontroller extends GetxController {
  CategoriesData Categoriesdata = CategoriesData(Get.find());

  List<CategoriesModel> data = [];
  late StatusRequest statusrequest;
  getData() async {
    data.clear();
    statusrequest = StatusRequest.loading;
    update();
    var response = await Categoriesdata.getData();
    statusrequest = handlingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        List dataList = response['data'];
        data.addAll(dataList.map((e) => CategoriesModel.fromJson(e)));
      } else {
        statusrequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteCategory(int id, String imageName) {
    Categoriesdata.delete({"id": id, "imagename": imageName});
    data.removeWhere((element) => element.categoriesId == id);
    update();
  }

  goToEditPage(CategoriesModel categoriesmodel) {
    Get.toNamed(AppRoutes.categoriesedit,
        arguments: {'categoriesmodel': categoriesmodel});
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  myBack() {
    Get.offAllNamed(AppRoutes.homePage);
    return Future.value(false);
  }
}
