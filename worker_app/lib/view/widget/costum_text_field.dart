import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/fonts.dart';
import '../../constant/theme.dart';

// ignore: must_be_immutable
class CostumTextField extends StatelessWidget {
  String hint;
  late TextStyle? hintStyle;
  late TextStyle? labelStyle;
  String? label;
  Widget? iconsuffex;
  TextInputType? inputtype;
  Function(String?)? onsaved;
  Function()? onTap;
  String? Function(String?)? validat;
  TextEditingController? controller;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool? sucer;
  double? reduis;
  late double widthOnTheScreen;
  String? inialValue;
  CostumTextField(
      {Key? key,
      this.labelStyle,
      this.inialValue,
      this.suffixIcon,
      this.sucer,
      this.prefixIcon,
      required this.hint,
      this.label,
      this.iconsuffex,
      this.inputtype,
      this.onsaved,
      this.onTap,
      this.controller,
      this.hintStyle,
      this.reduis,
      required this.widthOnTheScreen,
      this.validat})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: widthOnTheScreen,
        child: TextFormField(
          initialValue: inialValue,
          cursorColor: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
          style: TextStyle(
              color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
              fontFamily: jostFontFamily),
          obscureText: sucer ?? true,
          validator: validat,
          controller: controller,
          onSaved: onsaved,
          onTap: onTap,
          keyboardType: inputtype,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Get.isDarkMode ? darkPrimaryColor : primaryColor)),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      style: BorderStyle.solid,
                      color: Get.isDarkMode ? darkPrimaryColor : primaryColor)),
              hintText: hint,
              hintMaxLines: 1,
              hintStyle: hintStyle,
              helperMaxLines: 1,
              errorMaxLines: 1,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      reduis == null ? 5 : reduis as double)),
              label: label != null
                  ? Text(
                      label!,
                      style: labelStyle,
                    )
                  : null,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              prefixIconColor: Get.isDarkMode ? darkPrimaryColor : primaryColor,
              suffixIconColor: Get.isDarkMode ? darkPrimaryColor : primaryColor,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Get.isDarkMode
                        ? darkHoverButtonColor
                        : lightHoverButtonColor),
                borderRadius: BorderRadius.circular(
                    reduis == null ? 5 : reduis as double),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10)),
        ),
      ),
    );
  }
}
