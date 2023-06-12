// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/sizes.dart';
import '../../constant/text_style.dart';
import '../../constant/theme.dart';

// ignore: must_be_immutable
class DrinkCard extends StatelessWidget {
  Drink drink;
  Function()? onPressed;
  DrinkCard({super.key, required this.drink, this.onPressed});

  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: Get.isDarkMode ? skinColorWhite! : backGroundDarkColor),
            color: Get.isDarkMode
                ? darkWoodBrownColor.withOpacity(0.9)
                : woodBrownColor.withOpacity(0.9),
            borderRadius: BorderRadius.circular(size.buttonRadius)),
        width: size.drinkCardWidth,
        height: 210,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(size.buttonRadius),
                    topRight: Radius.circular(size.buttonRadius),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          // drink.imageName;
                          'assets/images/drinks.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                          top: 10, left: 5, child: addRemoveButton('add')),
                      Positioned(
                          top: 10, right: 5, child: addRemoveButton('remove')),
                    ],
                  ),
                ),
              ),
              AutoSizeText(
                drink.name,
                style: generalTextStyle(20),
              ),
              const SizedBox(
                height: 3,
              ),
              AutoSizeText(
                '${drink.unitPriceInSP} S.P',
                style: generalTextStyle(15),
              ),
            ]),
      ),
    );
  }

  Widget addRemoveButton(String addOrRemove) {
    return GestureDetector(
      onTap: () {
        //add one from this drink or remove one of the drink
      },
      child: Container(
        height: 25,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  offset: Offset(-2, -1),
                  color: Colors.black12,
                  spreadRadius: 0,
                  blurRadius: 10),
              BoxShadow(
                  offset: Offset(6, 5),
                  color: Colors.black26,
                  spreadRadius: 01,
                  blurRadius: 10),
              BoxShadow(
                  offset: Offset(-2, 5),
                  color: Colors.black26,
                  spreadRadius: 01,
                  blurRadius: 10),
              BoxShadow(
                  offset: Offset(6, -1),
                  color: Colors.black26,
                  spreadRadius: 01,
                  blurRadius: 10),
            ],
            shape: BoxShape.circle,
            color: addOrRemove == 'add' ? Colors.green : Colors.red),
        child: Icon(addOrRemove == 'add' ? Icons.add : Icons.remove),
      ),
    );
  }
}

class Drink {
  String name;
  int unitPriceInSP;
  Drink({
    required this.name,
    required this.unitPriceInSP,
  });
}
