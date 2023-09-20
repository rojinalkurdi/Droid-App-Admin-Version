import 'package:delivery/controller/orders/details_controller.dart';
import 'package:delivery/core/class/handling_data_view.dart';
import 'package:delivery/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersDetailsController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Orders",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: Colors.white)),
        ),
        body: Container(
            padding: const EdgeInsets.all(15),
            child: GetBuilder<OrdersDetailsController>(
                builder: (controller) => HandlingDataView(
                    statusrequest: controller.statusrequest,
                    widget: ListView(
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Table(
                                  children: [
                                    TableRow(
                                      children: [
                                        Text(
                                          "Item",
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge!
                                              .copyWith(
                                                  fontSize: 19,
                                                  color: AppColors.darkYellow),
                                        ),
                                        Text(
                                          "QTY",
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge!
                                              .copyWith(
                                                  fontSize: 19,
                                                  color: AppColors.darkYellow),
                                        ),
                                        Text(
                                          "Price",
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge!
                                              .copyWith(
                                                  fontSize: 19,
                                                  color: AppColors.darkYellow),
                                        ),
                                      ],
                                    ),
                                    ...List.generate(
                                        controller.data.length,
                                        (index) => TableRow(
                                              children: [
                                                Text(
                                                  "${controller.data[index].itemsName}",
                                                  textAlign: TextAlign.center,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayLarge!
                                                      .copyWith(fontSize: 17),
                                                ),
                                                Text(
                                                  "${controller.data[index].itemsCount}",
                                                  textAlign: TextAlign.center,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayLarge!
                                                      .copyWith(fontSize: 17),
                                                ),
                                                Text(
                                                  "${controller.data[index].itemsPrice}\$",
                                                  textAlign: TextAlign.center,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayLarge!
                                                      .copyWith(fontSize: 17),
                                                ),
                                              ],
                                            ))
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    children: [
                                      Text("Total Price: ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge!
                                              .copyWith(
                                                  fontSize: 17,
                                                  color: AppColors.darkYellow)),
                                      Text("${controller.ordersModel.ordersTotalPrice}\$",
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge!
                                              .copyWith(fontSize: 17)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Card(
                          child: ListTile(
                            title: Text("Shipping Address",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                        fontSize: 19,
                                        color: AppColors.darkYellow)),
                            subtitle: Text(
                                "${controller.ordersModel.addressCity}, ${controller.ordersModel.addressStreet}",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(fontSize: 15)),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          height: 300,
                          width: double.infinity,
                          child: GoogleMap(
                            //mapType: MapType.hybrid,
                            mapType: MapType.normal,
                            markers: controller.markers.toSet(),

                            initialCameraPosition: controller.kGooglePlex!,
                            onMapCreated: (GoogleMapController controllerMap) {
                              controller.completerController!
                                  .complete(controllerMap);
                            },
                          ),
                        )
                      ],
                    )))));
  }
}
