import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';
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
    final DrinkCardController drinkCardController =
        Get.put(DrinkCardController());
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
                      onPressed: () {
                        onpressedDone(
                            controller.page.value, drinkCardController);
                      },
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
                  return TabBarView(
                    children:
                        selectPage(controller, context, drinkCardController),
                  );
                }),
              ],
            ),
          ),
          bottomNavigationBar: const BottomNavBar(),
        ));
  }

  List<Widget> selectPage(BarPageController controller, BuildContext context,
      DrinkCardController drinkCardController) {
    List<Widget> list = [
      buildBarGridView(Colors.black, context, drinkCardController),
      buildBarGridView(Colors.blue, context, drinkCardController),
      reservationList(),
    ];
    return ([list[controller.page.value]]);
  }

  Widget buildBarGridView(Color? color, BuildContext context,
      DrinkCardController drinkCardContrller) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.widthInches > 8.5
            ? 4
            : context.widthInches > 5.5
                ? 3
                : 2,
        mainAxisExtent: 230,
        crossAxisSpacing: 10,
        mainAxisSpacing: 16,
      ),
      itemCount: 16,
      itemBuilder: (context, index) {
        drinkCardContrller.addNewElement();
        return DrinkCard(
          drink: Drink(id: index, name: 'beer+$index', unitPriceInSP: 15000),
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

  void onpressedDone(int index, DrinkCardController drinkCardController) {
    index == 0
        ? {
            Get.toNamed('/Cart', arguments: drinkCardController.order),
            Future.delayed(const Duration(milliseconds: 80), () {
              drinkCardController.order.makeTheOrderEmpty();
              drinkCardController.makeTheNumberofDriknsEqualsZero();
            })
          }
        : null;
  }
}
