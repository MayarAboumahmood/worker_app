import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worker_app/constant/text_style.dart';
import 'package:worker_app/view/screens/bar/bar_page_controller.dart';

import '../../../constant/sizes.dart';
import '../../../constant/theme.dart';
import '../../../main.dart';
import '../../widget/animation_title.dart';
import '../../widget/bottom_nav_bar.dart';
import '../../widget/drawer.dart';
import '../../widget/drink_card.dart';
import '../door/door_page.dart';

class BarPage extends StatelessWidget {
  const BarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    BarPageController controller = Get.find();
    return DefaultTabController(
        length: 1,
        initialIndex: 0,
        child: Scaffold(
          floatingActionButton: Obx(() => SizedBox(
                height: 100,
                child: AnimatedAlign(
                  duration: const Duration(milliseconds: 500),
                  alignment: controller.page.value == 2
                      ? sharedPreferences!.getString('lang') == 'en'
                          ? Alignment.topRight
                          : sharedPreferences!.getString('lang') == 'ar'
                              ? Alignment.topLeft
                              : Alignment.topRight
                      : sharedPreferences!.getString('lang') == 'en'
                          ? Alignment.bottomRight
                          : sharedPreferences!.getString('lang') == 'ar'
                              ? Alignment.bottomLeft
                              : Alignment.bottomRight,
                  child: FloatingActionButton.extended(
                      onPressed: () {},
                      label: Text('Done'.tr, style: generalTextStyle(null))),
                ),
              )),
          extendBody: true,
          appBar: createAppBar(size),
          drawer: ProjectDrawer(),
          body: SafeArea(
            child: Stack(
              children: [
                Container(
                  color: Get.isDarkMode ? darkPrimaryColor : primaryColor,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    color:
                        Get.isDarkMode ? backGroundDarkColor : skinColorWhite,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                ),
                Obx(() {
                  print('selectPage(controller)');
                  print(selectPage(controller));
                  return TabBarView(
                    children: selectPage(controller),
                  );
                }),
              ],
            ),
          ),
          bottomNavigationBar: const BottomNavBar(),
        ));
  }

  List<Widget> selectPage(BarPageController controller) {
    List<Widget> list = [
      buildBarGridView(Colors.black),
      buildBarGridView(Colors.blue),
      reservationList(),
    ];
    return ([list[controller.page.value]]);
  }

  Widget buildBarGridView(Color? color) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 230,
        crossAxisSpacing: 10,
        mainAxisSpacing: 16,
      ),
      itemCount: 16,
      itemBuilder: (context, index) {
        return DrinkCard(
          drink: Drink(name: 'beer', unitPriceInSP: 15000),
        );
      },
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
