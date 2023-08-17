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
              "${'Number of people'.tr}: ${reservation.totalNumber}",
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
                    controller.myOnStart(reservation);
                    return Text(
                      controller.numberOfPeople[reservation.id].value
                          .toString(),
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
    width: 50,
    child: MaterialButton(
      onPressed: () {
        addOrRemove == 'add'
            ? reservationController.increaseTheNumberOfPeople(reservation)
            : reservationController.decreaseTheNumberOfPeople(reservation);
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

  // List<RxInt> numberOfPeople2 = <RxInt>[];

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

  void myOnStart(Reservation reservation) {
    numberOfPeople[reservation.id].value = reservation.cameNumber;
  }

  void increaseTheNumberOfPeople(Reservation reservation) {
    print('reservation.id: ');
    print(reservation.id);
    print('');
    print('reservation.cameNumber: ');
    print(reservation.cameNumber);
    print('');
    print('numberOfPeople[reservation.id].value: ');
    print(numberOfPeople[reservation.id].value);
    print('');
    print('reservation.totalNumber: ');
    print(reservation.totalNumber);

    if (reservation.cameNumber < reservation.totalNumber) {
      print('i am innnnnnnnnnnnnnnn');
      numberOfPeople[reservation.id].value++;
      reservation.cameNumber++;
      update();
    }
  }

  void decreaseTheNumberOfPeople(Reservation reservation) {
    if (reservation.cameNumber > 0) {
      reservation.cameNumber--;
      numberOfPeople[reservation.id].value--;
    }
  }

  void addNewElement() {
    numberOfPeople.add(0.obs);
  }
}
