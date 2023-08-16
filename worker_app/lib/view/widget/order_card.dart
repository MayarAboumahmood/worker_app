import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worker_app/constant/fonts.dart';
import 'package:worker_app/constant/sizes.dart';
import 'package:worker_app/constant/text_style.dart';
import 'package:worker_app/constant/theme.dart';

import '../../data/Models/costumer_order.dart';
import '../screens/orders/orders_contrller.dart';

Widget orderCard(
    int index, BuildContext context, Sizes size, String description) {
  OrderController controller = Get.find();
  return GetBuilder<OrderController>(
    builder: (context) {
      return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  color: Get.isDarkMode ? darkPrimaryColor : primaryColor,
                  width: 1.0,
                ),
              ),
              color: Get.isDarkMode
                  ? const Color.fromARGB(255, 77, 77, 77)
                  : Colors.grey[400],
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                          itemCount: controller.finalListData.length,
                          itemBuilder: ((context, index) => Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                    child: ListView.builder(
                                      itemCount: controller.finalListData.length,
                                      itemBuilder: ((context, innerIndex) => Text(
                                            '${controller.finalListData[index].orderDrinks[innerIndex].drinkName}/',
                                            style: TextStyle(
                                              fontFamily: jostFontFamily,
                                              color: Get.isDarkMode
                                                  ? skinColorWhite
                                                  : backGroundDarkColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  SizedBox(
                                    height: 20,
                                    child: ListView.builder(
                                        itemCount: controller.finalListData[index]
                                            .orderDrinks.length,
                                        itemBuilder: ((context, innerIndex) => Text(
                                            '${'Price'.tr}: \$${controller.calculatePriceFromOrder(controller.finalListData[index].orderDrinks)} S.P',
                                            style: generalTextStyle(16)))),
                                  ),
                                  const SizedBox(height: 8),
                                  SizedBox(
                                    height: 20,
                                    child: ListView.builder(
                                        itemCount: controller.finalListData[index]
                                            .orderDrinks.length,
                                        itemBuilder: ((context, innerIndex) => Text(
                                            '${'Amount Ordered'.tr}: ${controller.calculateAmountForOneOrder(controller.finalListData[index].orderDrinks)}',
                                            style: generalTextStyle(16)))),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                      '${'Table Number'.tr}: ${0}', //this should not be in the listview.builder because in this way it will be repeted.
                                      style: generalTextStyle(16)),
                                ],
                              ))),
                    ),
                    Text(
                      description,
                      style: generalTextStyle(10),
                    )
                  ],
                ),
              )));
    }
  );
}
