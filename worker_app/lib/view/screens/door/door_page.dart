// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worker_app/view/widget/divider_with_word.dart';

import '../../widget/reservation_card.dart';

List<Widget> cameReservatons = [
  ReservationCard(
      reservation: Reservation(
          id: 0, eventId: 1, name: 'someone', totalNumber: 2, cameNumber: 0)),
  ReservationCard(
      reservation: Reservation(
          id: 1, eventId: 1, name: 'someone2', totalNumber: 5, cameNumber: 0)),
  ReservationCard(
      reservation: Reservation(
          id: 2, eventId: 1, name: 'someone3', totalNumber: 3, cameNumber: 0)),
  ReservationCard(
      reservation: Reservation(
          id: 3, eventId: 1, name: 'someone4', totalNumber: 1, cameNumber: 0)),
];
List<Widget> notCameReservatons = [
  ReservationCard(
      reservation: Reservation(
          id: 4, eventId: 1, name: 'someone', totalNumber: 2, cameNumber: 2)),
  ReservationCard(
      reservation: Reservation(
          id: 5, eventId: 2, name: 'someone2', totalNumber: 2, cameNumber: 2)),
  ReservationCard(
      reservation: Reservation(
          id: 6, eventId: 3, name: 'someone3', totalNumber: 2, cameNumber: 2)),
  ReservationCard(
      reservation: Reservation(
          id: 7, eventId: 4, name: 'someone4', totalNumber: 2, cameNumber: 2)),
  ReservationCard(
      reservation: Reservation(
          id: 8, eventId: 5, name: 'someone5', totalNumber: 2, cameNumber: 2)),
];

Widget attendanceList() {
  return ListView.builder(
    padding: const EdgeInsets.symmetric(vertical: 20),
    itemCount: cameReservatons.length + notCameReservatons.length + 2,
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
            : index - 1 < cameReservatons.length
                ? cameReservatons[index - 1]
                : index - 1 == cameReservatons.length
                    ? Column(
                        children: [
                          dividerWithWord('haven not come yet'.tr),
                          const SizedBox(height: 10),
                        ],
                      )
                    : notCameReservatons[index - cameReservatons.length - 2],
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
