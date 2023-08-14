// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worker_app/view/widget/divider_with_word.dart';

import '../../widget/reservation_card.dart';

List<Widget> cameReservatons = [
  ReservationCard(
      reservation: Reservation(eventId: 1, name: 'someone', number: 2)),
  ReservationCard(
      reservation: Reservation(eventId: 1, name: 'someone2', number: 5)),
  ReservationCard(
      reservation: Reservation(eventId: 1, name: 'someone3', number: 1)),
  ReservationCard(
      reservation: Reservation(eventId: 1, name: 'someone4', number: 1)),
];
List<Widget> notCameReservatons = [
  ReservationCard(
      reservation: Reservation(eventId: 1, name: 'someone', number: 2)),
  ReservationCard(
      reservation: Reservation(eventId: 2, name: 'someone2', number: 5)),
  ReservationCard(
      reservation: Reservation(eventId: 3, name: 'someone3', number: 1)),
  ReservationCard(
      reservation: Reservation(eventId: 4, name: 'someone4', number: 1)),
  ReservationCard(
      reservation: Reservation(eventId: 5, name: 'someone5', number: 2)),
];

Widget attendanceList() {
  return ListView.builder(
    padding: const EdgeInsets.symmetric(vertical: 20),
    itemCount: cameReservatons.length + notCameReservatons.length + 1,
    itemBuilder: (context, index) {
      print('index: ${index}');

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: index == 0
            ? Column(
                children: [
                  dividerWithWord('haven not come yet'.tr),
                  const SizedBox(height: 10),
                ],
              )
            : index < cameReservatons.length
                ? cameReservatons[index]
                : index == cameReservatons.length
                    ? Column(
                        children: [
                          dividerWithWord('haven not come yet'.tr),
                          const SizedBox(height: 10),
                        ],
                      )
                    : notCameReservatons[index - cameReservatons.length - 1],
      );
    },
  );
}

class Reservation {
  String name;
  int number;
  int eventId;
  Reservation({
    required this.name,
    required this.number,
    required this.eventId,
  });
}
