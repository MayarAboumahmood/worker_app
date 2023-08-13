import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worker_app/constant/sizes.dart';
import 'package:worker_app/constant/theme.dart';
import 'package:worker_app/view/widget/animation_title.dart';

class Stock extends StatelessWidget {
  const Stock({super.key});

  @override
  Widget build(BuildContext context) {
    final Sizes size = Sizes(context);
    return Scaffold(
      appBar: createAppBar(size),
    );
  }

  PreferredSizeWidget? createAppBar(Sizes size) {
    return AppBar(
      elevation: 0.4,
      backgroundColor: Get.isDarkMode ? darkPrimaryColor : primaryColor,
      title: AnimationAppBarTitle(title: 'Worker app'.tr),
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
