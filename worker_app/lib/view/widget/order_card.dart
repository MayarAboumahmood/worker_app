import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worker_app/constant/fonts.dart';
import 'package:worker_app/constant/sizes.dart';
import 'package:worker_app/constant/text_style.dart';
import 'package:worker_app/constant/theme.dart';
import 'package:worker_app/view/screens/cart/cart_page.dart';

Widget orderCard(List<Order> orders, int index, BuildContext context,
    Sizes size, String description) {
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
                      itemCount: orders.length,
                      itemBuilder: ((context, index) => Column(
                            children: [
                              Text(
                                '${orders[index].drinksWithAmount[index].drink.name}/',
                                style: TextStyle(
                                  fontFamily: jostFontFamily,
                                  color: Get.isDarkMode
                                      ? skinColorWhite
                                      : backGroundDarkColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                  '${'Price'.tr}: \$${orders[index].calculatePrice(index)} S.P',
                                  style: generalTextStyle(16)),
                              const SizedBox(height: 8),
                              Text(
                                  '${'Amount Ordered'.tr}: ${orders[index].drinksWithAmount[index].amount}',
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
