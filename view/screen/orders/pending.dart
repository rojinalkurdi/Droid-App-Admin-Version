import 'package:delivery/controller/orders/pending_controller.dart';
import 'package:delivery/core/class/handling_data_view.dart';
import 'package:delivery/core/constant/colors.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/data/model/orders_model.dart';
import 'package:delivery/view/widget/home/custom_cart_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PendingOrders extends StatelessWidget {
  const PendingOrders({super.key});

  @override
  Widget build(BuildContext context) {
   Get.put(PendingOrdersController());
    return Container(
      padding: const EdgeInsets.all(10),
      child: GetBuilder<PendingOrdersController>(
          builder: (controller) => HandlingDataView(
              statusrequest: controller.statusrequest,
              widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: ((context, index) => OrdersListCard(
                        listdata: controller.data[index],
                      ))))),
    );
  }
}

class OrdersListCard extends GetView<PendingOrdersController> {
  final OrdersModel listdata;
  const OrdersListCard({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order id : ${listdata.ordersId}",
              style:
                  Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 17),
            ),
            const Divider(),
            // Text(
            //   "Order delivery type : ${controller.printOrderDeliveryType(listdata.ordersType!)} ",
            //   style:
            //       Theme.of(context).textTheme.headline1!.copyWith(fontSize: 15),
            // ),
            Text(
              "Order price : ${listdata.ordersPrice} \$ ",
              style:
                  Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 15),
            ),
            Text(
              "Order delivery price : ${listdata.ordersDeliveryPrice} \$ ",
              style:
                  Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 15),
            ),
            Text(
              "Order payment method :${controller.printPaymentMethod(listdata.ordersPaymentMethod!)} ",
              style:
                  Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 15),
            ),
            // Text(
            //   "Order status :${controller.printOrderStatus(listdata.ordersStatus!)} ",
            //   style:
            //       Theme.of(context).textTheme.headline1!.copyWith(fontSize: 15),
            // ),
            const Divider(),
            Text("Total price : ${listdata.ordersTotalPrice} \$",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 20, color: AppColors.darkYellow)),
            Row(
              children: [
                CustomButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.ordersDetails,
                          arguments: {"ordersDetails": listdata});
                    },
                    text: "More Details"),
                const SizedBox(width: 10),
                //if ordersStatus == 2 means that the orrders is ready to be picked by delivery man
                //and when delivery man presses on APPROVE the ordersStatus will be changed 2->3
                // ordersStatus == 3 means the order is on the way
                if (listdata.ordersStatus == 2)
                  CustomButton(
                      onPressed: () {
                        controller.approveOrders(listdata.ordersId!, listdata.ordersUsersid!);
                      },
                      text: "Approve"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
