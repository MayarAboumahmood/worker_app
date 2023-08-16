// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:worker_app/constant/text_style.dart';
// import 'package:worker_app/view/widget/drink_card.dart';

// import '../../constant/sizes.dart';
// import '../../constant/theme.dart';

// // ignore: must_be_immutable
// class StockDrinkCard extends StatelessWidget {
//   MakeDrink drink;
//   StockCardController controller = Get.put(StockCardController());
//   Function()? onPressed;
//   StockDrinkCard({super.key, required this.drink, this.onPressed});
//   @override
//   Widget build(BuildContext context) {
//     Sizes size = Sizes(context);
//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         decoration: BoxDecoration(
//             border: Border.all(
//                 color: Get.isDarkMode ? skinColorWhite! : backGroundDarkColor),
//             color: Get.isDarkMode
//                 ? darkWoodBrownColor.withOpacity(0.9)
//                 : woodBrownColor.withOpacity(0.9),
//             borderRadius: BorderRadius.circular(size.buttonRadius)),
//         width: 100, //size.drinkCardWidth,
//         height: 210,
//         child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 150,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(size.buttonRadius),
//                     topRight: Radius.circular(size.buttonRadius),
//                   ),
//                   child: Stack(
//                     children: [
//                       Positioned.fill(
//                         child: Image.asset(
//                           // drink.imageName;
//                           'assets/images/medium page background image.jpg',
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                       Positioned.fill(
//                         child: Container(
//                           color: backGroundDarkColor.withOpacity(0.2),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 10),
//                         child: Row(
//                           children: [
//                             const SizedBox(
//                               width: 6,
//                             ),
//                             const Spacer(),
//                             Obx(() => Text(
//                                   controller.numberOfDrinks[drink.id]
//                                       .toString(),
//                                   style: TextStyle(
//                                     color: skinColorWhite,
//                                   ),
//                                 )),
//                             const Spacer(),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               AutoSizeText(
//                 drink.name,
//                 style: generalTextStyle(20),
//               ),
//               const SizedBox(
//                 height: 3,
//               ),
//               AutoSizeText(
//                 '${drink.unitPriceInSP} S.P',
//                 style: generalTextStyle(15),
//               ),
//             ]),
//       ),
//     );
//   }
// }

// class StockCardController extends GetxController {
//   List<RxInt> numberOfDrinks = [];
//   void addNewElement() {
//     numberOfDrinks.add(0.obs);
//   }
// }
