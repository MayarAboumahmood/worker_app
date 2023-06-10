import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worker_app/constant/text_style.dart';

import '../../../constant/sizes.dart';
import '../../../constant/theme.dart';
import '../../widget/bottom_nav_bar.dart';
import '../../widget/drawer.dart';

class BarPage extends StatelessWidget {
  const BarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return DefaultTabController(
        length: 4,
        initialIndex: 0,
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
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
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
          bottomNavigationBar: const BottomNavBar(),
        ));
  }

  Widget createMyBottomBar() {
    return Container(
        color: Get.isDarkMode ? backGroundDarkColor : skinColorWhite,
        height: Get.size.height * .12,
        child: BottomAppBar(
          color: Get.isDarkMode ? darkPrimaryColor : primaryColor,
          child: TabBar(
            dividerColor: Get.isDarkMode ? backGroundDarkColor : skinColorWhite,
            indicatorColor:
                Get.isDarkMode ? backGroundDarkColor : skinColorWhite,
            tabs: [
              // Container(
              //   margin: EdgeInsets.only(
              //     top: Get.size.height * .02,
              //   ),
              //   height: Get.size.height * .1,
              //   color: Get.isDarkMode ? darkPrimaryColor : primaryColor,
              // ),
              bottomBarUnite(Icons.event, 'Events'.tr, Get.size.width * .26, 2),
              bottomBarUnite(
                  Icons.wine_bar_rounded, 'Bar'.tr, Get.size.width * .5, 2),
              bottomBarUnite(
                  Icons.task_alt_rounded, 'Orders'.tr, Get.size.width * .74, 2),
              bottomBarUnite(Icons.door_sliding_rounded, 'Door'.tr,
                  Get.size.width * .02, 2),
            ],
          ),
        ));
  }

  Widget bottomBarUnite(
      IconData? icon, String text, double left, double bottom) {
    return GestureDetector(
        onTap: () {},
        child: AnimatedContainer(
          height: Get.size.height * .11,
          width: Get.size.height * .11,
          padding: const EdgeInsets.all(20),
          duration: const Duration(milliseconds: 100),
          decoration: BoxDecoration(
              border: Border.all(
                color: Get.isDarkMode ? backGroundDarkColor : skinColorWhite!,
                width: 4.0,
              ),
              color: Get.isDarkMode ? darkPrimaryColor : primaryColor,
              shape: BoxShape.circle),
          child: Column(children: [
            Icon(
              icon,
              color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
            ),
            Text(
              text,
              style: generalTextStyle(null),
            ),
          ]),
        ));
  }

  Widget createBottomBar() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      child: BottomAppBar(
        color: Get.isDarkMode ? darkPrimaryColor : primaryColor,
        child: TabBar(
          dividerColor: Get.isDarkMode ? backGroundDarkColor : skinColorWhite,
          indicatorColor: Get.isDarkMode ? backGroundDarkColor : skinColorWhite,
          tabs: [
            Tab(
              text: 'Events'.tr,
              icon: Icon(
                Icons.event,
                color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
              ),
            ),
            Tab(
              text: 'Bar'.tr,
              icon: Icon(
                Icons.wine_bar_rounded,
                color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
              ),
            ),
            Tab(
              text: 'Orders'.tr,
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
              child: Text(
                'Door'.tr,
                style: generalTextStyle(null),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget verticalDivider() {
    return VerticalDivider(
      width: 0,
      thickness: 2,
      color: Get.isDarkMode ? backGroundDarkColor : skinColorWhite,
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
        style: generalTextStyle(size.appBarTextSize / 2),
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
    );
  }
}
