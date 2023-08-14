import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';
import 'package:worker_app/constant/text_style.dart';
import 'package:worker_app/view/widget/costum_text_field.dart';
import 'package:worker_app/view/widget/drink_card.dart';
import '../../../constant/fonts.dart';
import '../../../constant/sizes.dart';
import '../../../constant/theme.dart';
import '../../../main.dart';
import '../../widget/divider_with_word.dart';
import '../../widget/my_button.dart';
import 'edite_drink_on_stock_controller.dart';

// ignore: must_be_immutable
class EditeDrinkOnStockPage extends StatelessWidget {
  final Drink drink;
  final EditeDrinkOnStockController controller = Get.find();
  EditeDrinkOnStockPage({super.key, required this.drink});
  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return Container(
        height: Get.size.height * .95,
        width: context.widthInches > 5.5 ? 400 : Get.size.width * .95,
        color: Get.isDarkMode ? Colors.black54 : skinColorWhite,
        child: SingleChildScrollView(
          child: Column(
            children: [
              createAppBar(size),
              SizedBox(
                height: sharedPreferences!.getString('lang') == 'en'
                    ? Get.size.height * .02
                    : Get.size.height * .01,
              ),
              dividerWithWord(
                'Enter the new information'.tr,
              ),
              const SizedBox(height: 30),
              editeDrinkInfoTextField(size, 'drink name', drink.name,
                  const Icon(Icons.wine_bar), TextInputType.name),
              const SizedBox(height: 30),
              editeDrinkInfoTextField(
                  size,
                  'available amount',
                  drink.unitPriceInSP
                      .toString() /*I forget to add available amount to the drink model that I created but I think it's fine you can do it. */,
                  const Icon(Icons.local_drink),
                  TextInputType.number),
              const SizedBox(height: 30),
              editeDrinkInfoTextField(
                  size,
                  'drink price',
                  drink.unitPriceInSP.toString(),
                  const Icon(Icons.money_rounded),
                  TextInputType.number),
              const SizedBox(height: 30),
              //to do................................
              const SizedBox(
                height: 5,
              ),
              TextButton(
                onPressed: () {
                  controller.pickImage();
                },
                child: Text(
                  'Select the drink image'.tr,
                  style: generalTextStyle(null),
                ),
              ),
              const SizedBox(height: 5),
              controller.webImageExcist
                  ? SizedBox(
                      width: 200,
                      height: 200,
                      child: /*GetPlatform.isWeb
                            ? */
                          Image.memory(
                        controller.selectedImageInBytes,
                        fit: BoxFit.contain,
                      )
                      /* : Image.file(
                                File(controller.selectedImage.value),
                                fit: BoxFit.contain,
                              ),*/
                      )
                  : const SizedBox(),

              //to do................................
              SizedBox(
                height: Get.size.height * .35,
              ),
              addAButton(size),
              const SizedBox(height: 20)
            ],
          ),
        ));
  }

  Widget addAButton(Sizes size) {
    return MyButton(
      myRadius: 5,
      mywidth: size.wideNormalButtonWidth,
      myheight: size.normalButtonHeight,
      mycolor: Get.isDarkMode ? darkPrimaryColor : primaryColor,
      ontap: () {},
      child: AutoSizeText(
        'Done'.tr,
        style: TextStyle(
          fontSize: size.wideNormalButtonTextSize,
          color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
        ),
      ),
    );
  }

  Widget editeDrinkInfoTextField(Sizes size, String hintText, String label,
      Widget prefixIcon, TextInputType inputType) {
    return CostumTextField(
      inputtype: inputType,
      labelStyle: TextStyle(
          color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
      widthOnTheScreen: size.textFieldWidth,
      onsaved: (value) {},
      hint: hintText.tr,
      hintStyle: TextStyle(
          fontFamily: jostFontFamily,
          color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
      label: label.tr,
      prefixIcon: prefixIcon,
      sucer: false,
    );
  }

  Padding createAppBar(Sizes size) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: sharedPreferences!.getString('lang') == 'en'
              ? Get.size.width * .01
              : 0),
      child: SizedBox(
        width: Get.size.width * .7,
        child: Text('Edite the drink info'.tr,
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontFamily: jostFontFamily,
              fontSize: 30,
              color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
            )),
      ),
    );
  }
}
