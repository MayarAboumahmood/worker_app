import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worker_app/constant/text_style.dart';
import 'package:worker_app/constant/theme.dart';
import '../screens/door/door_page.dart';

class ReservationCard extends StatelessWidget {
  final Reservation reservation;
  const ReservationCard({super.key, required this.reservation});

  @override
  Widget build(BuildContext context) {
    final ReservationCardController controller = Get.put(
      ReservationCardController(),
      tag: reservation.hashCode.toString(),
    );

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(right: 5, top: 2, bottom: 2),
          child: ListTile(
            leading: SizedBox(
              height: 40,
              width: 40,
              child: TextButton(
                onPressed: () {
                  controller.toggleTrueSign();
                },
                child: Obx(() => Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color: Get.isDarkMode
                              ? Colors.grey[400]!
                              : const Color.fromARGB(255, 54, 54, 54)),
                    ),
                    child: controller.showTrueSign.value
                        ? Center(
                            child: Icon(Icons.check,
                                color: Get.isDarkMode
                                    ? darkPrimaryColor
                                    : primaryColor),
                          )
                        : null)),
              ),
            ),
            title: Text(
              "${'Name'.tr}: ${reservation.name}",
              style: generalTextStyle(null),
            ),
            subtitle: Text(
              "${'Number of people'.tr}: ${reservation.number}",
              style: generalTextStyle(null),
            ),
            trailing: SizedBox(
              width: 142,
              child: Row(
                children: [
                  const SizedBox(
                    width: 6,
                  ),
                  addRemoveButton('add', controller),
                  // Obx(() =>
                  Text(
                    '0',
                    style: TextStyle(
                      color: skinColorWhite,
                    ),
                    // )
                  ),
                  addRemoveButton('remove', controller),
                  const SizedBox(
                    width: 6,
                  ),
                ],
              ),
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}

Widget addRemoveButton(
    String addOrRemove, ReservationCardController drinkCardController) {
  return SizedBox(
    width: 60,
    child: MaterialButton(
      onPressed: () {
        // addOrRemove == 'add'
        // ? drinkCardController.increaseTheNumberOfDrinks(drink.id, drink)
        // : drinkCardController.decreaseTheNumberOfDrinks(drink.id, drink);
        //add one from this drink or remove one of the drink
      },
      child: Icon(
        addOrRemove == 'add' ? Icons.add : Icons.remove,
        color: skinColorWhite,
      ),
      // ),
    ),
  );
}

class ReservationCardController extends GetxController {
  RxBool showTrueSign = false.obs;

  void toggleTrueSign() {
    showTrueSign.toggle();
  }

  List<RxInt> numberOfPeople = <RxInt>[].obs;
  // void increaseTheNumberOfDrinks(int id, Drink drink) {
  //   numberOfPeople[id].value++;
  //     order.drinksWithAmount[id].amount++;
  //   }

  // bool ifDealingWithForTheFirstTime(Drink drink) {
  //   for (var element in order.drinksWithAmount) {
  //     if (element.drink.name == drink.name) {
  //       return false;
  //     }
  //   }
  //   return true;
  // }

  // void decreaseTheNumberOfDrinks(int id, Drink drink) {
  //   if (ifDealingWithForTheFirstTime(drink)) {
  //     order.drinksWithAmount.add(DrinkAmount(drink: drink, amount: 0));
  //   }
  //   order.drinksWithAmount[id].amount > 0
  //       ? order.drinksWithAmount[id].amount--
  //       : null;
  //   numberOfPeople[id].value > 0 ? numberOfPeople[id].value-- : null;

  //  }

  void makeTheNumberofDriknsEqualsZero() {
    for (var element in numberOfPeople) {
      element.value = 0;
    }
  }

  void addNewElement() {
    numberOfPeople.add(0.obs);
  }
}
