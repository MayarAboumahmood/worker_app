import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worker_app/constant/text_style.dart';

import '../../../constant/sizes.dart';
import '../../../constant/theme.dart';
import '../../widget/drawer.dart';

class BarPage extends StatelessWidget {
  const BarPage({super.key});

  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: createAppBar(size),
        drawer: ProjectDrawer(),
        body: Stack(
          children: [
            Container(
              color: Get.isDarkMode ? darkPrimaryColor : primaryColor,
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                color: Get.isDarkMode ? backGroundDarkColor : skinColorWhite,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            TabBarView(
              children: [
                buildGridView(),
                buildGridView(),
                buildGridView(),
                buildGridView(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGridView() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: 16,
      itemBuilder: (context, index) {
        return Card(
          child: Center(
            child: Text('Card ${index + 1}'),
          ),
        );
      },
    );
  }

  PreferredSizeWidget? createAppBar(Sizes size) {
    return AppBar(
      elevation: 0.4,
      backgroundColor: Get.isDarkMode ? darkPrimaryColor : primaryColor,
      title: Text(
        'Worker app'.tr,
        style: generalTextStyle(null),
      ),
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
      bottom: TabBar(
        tabs: [
          Tab(
            icon: Icon(
              Icons.event,
              color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.wine_bar_rounded,
              color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.task_alt_rounded,
              color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.door_sliding_rounded,
              color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
            ),
          ),
        ],
      ),
    );
  }
}
