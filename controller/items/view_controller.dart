import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/data/datasource/remote/Items_data.dart';
import 'package:delivery/data/model/Items_model.dart';
import 'package:get/get.dart';
import 'package:delivery/core/class/statusRequest.dart';
import '../../core/functions/handlingdata.dart';

class ItemsController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());

  List<ItemsModel> data = [];
  late StatusRequest statusrequest;
  getData() async {
    data.clear();
    statusrequest = StatusRequest.loading;
    update();
    var response = await itemsData.getData();
    statusrequest = handlingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        List dataList = response['data'];
        data.addAll(dataList.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusrequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteItem(int id, String imageName) {
    itemsData.delete({"id": id, "imagename": imageName});
    data.removeWhere((element) => element.itemsId == id);
    update();
  }

  goToEditPage(ItemsModel itemsmodel) {
    Get.toNamed(AppRoutes.itemsedit,
        arguments: {'Itemsmodel': itemsmodel});
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
