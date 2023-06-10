import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';

import '../../constant/text_style.dart';
import '../../constant/theme.dart';

void main() => runApp(const MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  int page = 0;
  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      key: bottomNavigationKey,
      index: 0,
      height: 75,
      items: <Widget>[
        bottomBarUnit('Event', Icons.event),
        bottomBarUnit('Bar', Icons.wine_bar_rounded),
        bottomBarUnit('Orders', Icons.task_alt_rounded),
        bottomBarUnit('Door', Icons.door_sliding_rounded),
      ],
      color: Get.isDarkMode ? darkPrimaryColor : primaryColor,
      buttonBackgroundColor: Get.isDarkMode ? darkPrimaryColor : primaryColor,
      backgroundColor: Get.isDarkMode ? backGroundDarkColor : skinColorWhite!,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      onTap: (index) {
        setState(() {
          print('index :');
          print(index);
          page = index;
        });
      },
      letIndexChange: (index) => true,
    );
  }

  Widget bottomBarUnit(String title, IconData? icon) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: SizedBox(
        height: 65,
        width: 65,
        child: Tab(
          icon: Icon(
            icon,
            color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
          ),
          child: Text(
            title.tr,
            style: generalTextStyle(null),
          ),
        ),
      ),
    );
  }
}
