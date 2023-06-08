import 'package:flutter/material.dart';

class Sizes {
  late double appBarIconSize; //done on web not on moblile.
  late double appBarTextSize; //done on web not on moblile.

  late double drinkCardWidth; //done
  late double drinkCardHeight; //done

  late double cardNormalTextSize; //done on web not on moblile.

  late double cardTitleTextSize; //done on web not on moblile.

  late double cardButtonHeight; //done on web not on moblile.
  late double cardButtonWidth; //done on web not on moblile.
  late double cardButtonTextSize; //done on web not on moblile.

  late double eventCardWidth; //done
  late double eventCardHeight; //done

  late double
      floatButtonWidth; //we  will not use it mostly because the floatActionButton have a const size by defult.
  late double
      floatButtonHeight; //we  will not use it mostly because the floatActionButton have a const size by defult.

  late double normalButtonHeight; //done but not on the mobile.
  late double normalButtonWidht; //done but not on the mobile.
  late double normalButtonInsidePaddin; //done

  late double bigButtonHeight; //done but not on the mobile.
  late double bigButtonWidht; //done but not on the mobile.

  late double smallEventCardHeight;
  late double smallEventCardWidth;

  late double bigButtonTextSize;
  late double normalButtonTextSize;
  // late double autoSizeTextMaxSizeNormalButton;

  late double textFieldIconSize; //done by default.
  late double textFieldWidth; //done by padding.
  late double textFieldHeight; //done by default.
  late double textFieldTextSize; //done by default

  late double wideNormalButtonTextSize; //done.
  late double wideNormalButtonWidth; //done.
  late double appBarTextFieldWidth;

  final double buttonRadius = 5; //done
/*---------------------------------*/

  late double width;
  late double height;
  late BuildContext context;
  Sizes(this.context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    setSizesForMobile();
  }
  void setSizesForMobile() {
    smallEventCardHeight = height * .2;
    smallEventCardWidth = width * .75;
    appBarTextFieldWidth =
        width * .8; //it's just an icon here so we not going to use it.
    wideNormalButtonTextSize = 18;
    wideNormalButtonWidth = width * .85;
    cardButtonTextSize = width * .1;
    normalButtonInsidePaddin = width * .08;
    bigButtonTextSize = height * .04;
    normalButtonTextSize = height * .035;
    textFieldTextSize = height * .04;
    textFieldWidth = width * .8;
    appBarIconSize = width * .07;
    appBarTextSize = width * .1;
    drinkCardWidth = width * .4;
    drinkCardHeight = height * .4;
    cardTitleTextSize = height * .03;
    cardNormalTextSize = height * .025;
    cardTitleTextSize = height * .05;
    cardButtonHeight = height * .06;
    cardButtonWidth = width * .1;
    eventCardWidth = width * .9;
    eventCardHeight = height * .45;
    floatButtonWidth = width * .08;
    floatButtonHeight = height * .06;
    normalButtonHeight = height * .06;
    normalButtonWidht = width * .5;
    bigButtonHeight = height * .2;
    bigButtonWidht = width * .3;
  }
}
