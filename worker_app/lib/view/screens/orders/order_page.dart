import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worker_app/constant/sizes.dart';
import 'package:worker_app/view/widget/order_card.dart';

import '../event_page/event_page_controller.dart';

Widget buildOrderList(Sizes size) {
  // EventPageController controller=Get.put(EventPageController());
  return GetBuilder<EventPageController>(builder: (context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: ((context, index) => orderCard(
            ['drink one', 'drink two', 'drink three'],
            '40000',
            '4',
            context,
            size,
            'something good goooood',
            2)));
  });
}
