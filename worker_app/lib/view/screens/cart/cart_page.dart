// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worker_app/constant/fonts.dart';
import 'package:worker_app/view/widget/cart_card.dart';
import 'package:worker_app/view/widget/drink_card.dart';
import 'package:worker_app/view/widget/my_button.dart';

import '../../../constant/sizes.dart';
import '../../../constant/theme.dart';
import '../../widget/animation_title.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    Order order = Get.arguments;
    final Sizes size = Sizes(context);
    return Scaffold(
      appBar: createAppBar(size),
      body: Column(
        children: [
          SizedBox(
            height: Get.size.height * .7,
            child: ListView.builder(
                itemCount: order.drinksWithAmount.length,
                itemBuilder: ((context, index) =>
                        cartCard(order, index, context, size)
                    // cartElement(order, index, context, size)
                    )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${'Total price'.tr}: ${order.calculateTotalPrice()}S.P',
              style: TextStyle(
                fontFamily: jostFontFamily,
                color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: MyButton(
              mycolor: Get.isDarkMode ? darkPrimaryColor : primaryColor,
              myRadius: size.buttonRadius,
              ontap: () {
                //send the data to the backend and go back to the prev page.
                Get.back();
              },
              mywidth: size.normalButtonWidht,
              myheight: size.normalButtonHeight,
              myShadow: 0,
              child: AutoSizeText(
                'Done'.tr,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: size.normalButtonTextSize,
                    fontFamily: jostFontFamily,
                    color:
                        Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
              ),
            ),
          )
        ],
      ),
    );
  }

  PreferredSizeWidget? createAppBar(Sizes size) {
    return AppBar(
      iconTheme: IconThemeData(
          color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
      elevation: 0.4,
      backgroundColor: Get.isDarkMode ? darkPrimaryColor : primaryColor,
      title: AnimationAppBarTitle(title: 'Cart page'.tr),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
            size: size.appBarIconSize,
          ),
          onPressed: () {
            // Perform search action
          },
        ),
      ],
    );
  }
}

class Order {
  List<DrinkAmount> drinksWithAmount = [];
  int tableNumber = 0;
  Order({
    drinksWithAmount,
    required tabelNumber,
  });
  double calculatePrice(int id) {
    double price = 0;
    for (int i = 0; i < drinksWithAmount[id].amount.toInt(); i++) {
      price += drinksWithAmount[id].drink.unitPriceInSP;
    }
    return price;
  }

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var element in drinksWithAmount) {
      for (int i = 0; i < element.amount; i++) {
        totalPrice += element.drink.unitPriceInSP;
      }
    }
    return totalPrice;
  }

  void makeTheOrderEmpty() {
    drinksWithAmount = [];
  }
}

class DrinkAmount {
  Drink drink;
  int amount;
  DrinkAmount({
    required this.drink,
    required this.amount,
  });
}
