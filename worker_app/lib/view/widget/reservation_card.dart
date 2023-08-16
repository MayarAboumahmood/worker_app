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
                  addRemoveButton('add', controller, reservation),
                  Obx(() {
                    return Text(
                      controller.numberOfPeople[1].value.toString(),
                      style: generalTextStyle(null),
                    );
                  }),
                  addRemoveButton('remove', controller, reservation),
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
  String addOrRemove,
  ReservationCardController reservationController,
  Reservation reservation,
) {
  return SizedBox(
    width: 60,
    child: MaterialButton(
      onPressed: () {
        addOrRemove == 'add'
            ? reservationController.increaseTheNumberOfPeople(
                reservation.eventId, reservation)
            : reservationController.decreaseTheNumberOfPeople(
                reservation.id, reservation);
      },
      child: Icon(
        addOrRemove == 'add' ? Icons.add : Icons.remove,
        color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
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

  List<RxInt> numberOfPeople = <RxInt>[
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs,
    0.obs
  ].obs;

  void increaseTheNumberOfPeople(int id, Reservation reservation) {
    if (numberOfPeople[id].value < reservation.number) {
      numberOfPeople[id].value++;
      reservation.number++;
    }
  }

  void decreaseTheNumberOfPeople(int id, Reservation reservation) {
    reservation.number > 0 ? reservation.number-- : null;
    numberOfPeople[id].value > 0 ? numberOfPeople[id].value-- : null;
  }

  void addNewElement() {
    numberOfPeople.add(0.obs);
  }
}
