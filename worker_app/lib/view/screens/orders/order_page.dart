import 'package:flutter/material.dart';
import 'package:worker_app/constant/sizes.dart';
import 'package:worker_app/view/screens/cart/cart_page.dart';
import 'package:worker_app/view/widget/drink_card.dart';
import 'package:worker_app/view/widget/order_card.dart';

List<List<Order>> ordersList = [
  [
    Order(tabelNumber: 1, drinksWithAmount: [
      DrinkAmount(
          drink: Drink(id: 1, name: 'beer', unitPriceInSP: 2330), amount: 1)
    ]),
    Order(tabelNumber: 2, drinksWithAmount: [
      DrinkAmount(
          drink: Drink(id: 2, name: 'vodka', unitPriceInSP: 2330), amount: 3)
    ]),
  ],
  [
    Order(tabelNumber: 3, drinksWithAmount: [
      DrinkAmount(
          drink: Drink(id: 3, name: 'beer', unitPriceInSP: 2330), amount: 2)
    ]),
    Order(tabelNumber: 4, drinksWithAmount: [
      DrinkAmount(
          drink: Drink(id: 4, name: 'vodka', unitPriceInSP: 2330), amount: 3)
    ]),
  ],
  [
    Order(tabelNumber: 5, drinksWithAmount: [
      DrinkAmount(
          drink: Drink(id: 5, name: 'beer', unitPriceInSP: 2330), amount: 4)
    ]),
    Order(tabelNumber: 6, drinksWithAmount: [
      DrinkAmount(
          drink: Drink(id: 6, name: 'vodka', unitPriceInSP: 2330), amount: 3)
    ]),
  ],
];

Widget buildOrderList(Sizes size) {
  return ListView.builder(
      itemCount: ordersList.length,
      itemBuilder: ((context, index) =>
          orderCard(ordersList[index], index, context, size, 'somethings')));
}
