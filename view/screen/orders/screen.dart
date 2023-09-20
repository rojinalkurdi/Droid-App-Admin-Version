import 'package:delivery/controller/orders/screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:delivery/view/widget/home/custom_button_appbar.dart';
import 'package:get/get.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersScreenControllerImp());
    return GetBuilder<OrdersScreenControllerImp>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: Text(
                  "Orders",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              bottomNavigationBar: BottomAppBar(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //if we have a repeated widgets
                  //we better repeate them by using ...listgenerator(numberOfWidgets, context => ....)

                  // ...List.generate(
                  //     controller.pagesList.length,
                  //     ((index) => CustomButtonAppBar(
                  //         onpressed: () {
                  //           controller.changePage(index);
                  //         },
                  //         icon: Icons.home,
                  //         title: "${controller.pagesNames[index]}",
                  //         active: controller.currentpage == index ? true : false)))

                  CustomButtonAppBar(
                      onpressed: () {
                        controller.changePage(0);
                      },
                      icon: Icons.pending_actions_rounded,
                      title: "Pending",
                      active: controller.currentpage == 0 ? true : false),

                  CustomButtonAppBar(
                      onpressed: () {
                        controller.changePage(1);
                        // Get.toNamed(AppRoutes.cart);
                      },
                      icon: Icons.verified_outlined,
                      title: "Accepted",
                      active: controller.currentpage == 1 ? true : false),

                  CustomButtonAppBar(
                      onpressed: () {
                        controller.changePage(2);
                      },
                      icon: Icons.pending_actions_rounded,
                      title: "Settings",
                      active: controller.currentpage == 2 ? true : false),
                ],
              )),
              body: controller.pagesList.elementAt(controller.currentpage),
            ));
  }
}
