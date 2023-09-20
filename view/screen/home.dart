import 'package:delivery/controller/home_controller.dart';
import 'package:delivery/core/constant/image.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/view/widget/auth/custom_button_auth.dart';
import 'package:delivery/view/widget/home/custom_admin_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return Scaffold(
      appBar: AppBar(
          title: const Center(
        child: Text("Home"),
      )),
      body: ListView(
        children: [
          GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisExtent: 150),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              CustomAdminCard(
                  imgUrl: onBoardingImages.product,
                  title: "Categories",
                  onClick: () {
                    Get.toNamed(AppRoutes.categoriesview);
                  }),
              // CustomAdminCard(
              //     imgUrl: onBoardingImages.orders,
              //     title: "Orders",
              //     onClick: () {}),
              // CustomAdminCard(
              //     imgUrl: onBoardingImages.message,
              //     title: "Messages",
              //     onClick: () {}),
              // CustomAdminCard(
              //     imgUrl: onBoardingImages.users,
              //     title: "Users",
              //     onClick: () {}),
              CustomAdminCard(
                  imgUrl: onBoardingImages.items,
                  title: "Items",
                  onClick: () {
                    Get.toNamed(AppRoutes.itemsview);
                  }),
            ],
          ),
          ButtonAuth(
              textButton: "Create a manager account",
              onPressed: () {
                controller.goToSignupPage();
              })
        ],
      ),
    );
  }
}
