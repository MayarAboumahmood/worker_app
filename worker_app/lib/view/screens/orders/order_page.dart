import 'package:flutter/material.dart';
import 'package:worker_app/constant/sizes.dart';
import 'package:worker_app/view/screens/cart/cart_page.dart';
import 'package:worker_app/view/widget/order_card.dart';

List<List<Order>> ordersList = [
  [Order(), Order()],
  [Order(), Order()],
  [Order(), Order()],
];

Widget buildOrderList(Sizes size) {
  return ListView.builder(
      itemCount: ordersList.length,
      itemBuilder: ((context, index) =>
          orderCard(ordersList[index], index, context, size, 'somethings')));
}
