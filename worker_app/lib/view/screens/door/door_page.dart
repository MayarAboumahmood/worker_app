// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worker_app/constant/sizes.dart';
import 'package:worker_app/view/widget/divider_with_word.dart';

import '../../../constant/status_request.dart';
import '../../../constant/text_style.dart';
import '../../widget/no_internet_page.dart';
import '../../widget/reservation_card.dart';
import 'door_controller.dart';

Widget attendanceList(BuildContext context,int eventId) {
  Sizes size = Sizes(context);
  DoorController controller = Get.put(DoorController());
  controller.eventID=eventId;
  return GetBuilder<DoorController>(
    builder: (ctx) => controller.statuseRequest == StatuseRequest.offlinefailure
        ? noInternetPage(size, controller)
        : controller.statuseRequest == StatuseRequest.loading
            ? Text("loading....".tr, style: generalTextStyle(14))
            : whenShowTheBodyAfterLoadingAndInternet(context,controller),
  );
}

whenShowTheBodyAfterLoadingAndInternet(context,DoorController controller) {
  return ListView.builder(
    padding: const EdgeInsets.symmetric(vertical: 20),
    itemCount: controller.finalListDataCome.length+controller.finalListDataNotCome.length + 2,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: index == 0
            ? Column(
                children: [
                  dividerWithWord('haven not come yet'.tr),
                  const SizedBox(height: 10),
                ],
              )
            : index - 1 < controller.finalListDataCome .length
                ? ReservationCard(reservation: controller.finalListDataCome[index],index:controller.finalListDataNotCome.length+index)
                : index - 1 == controller.finalListDataCome.length
                    ? Column(
                        children: [
                          dividerWithWord('haven not come yet'.tr),
                          const SizedBox(height: 10),
                        ],
                      )
                    : ReservationCard(reservation: controller.finalListDataNotCome[index],index:index)
                ,
      );
    },
  );
}

class Reservation {
  String name;
  int totalNumber;
  int cameNumber;
  int eventId;
  int id;

  Reservation({
    required this.name,
    required this.totalNumber,
    required this.cameNumber,
    required this.eventId,
    required this.id,
  });
}
