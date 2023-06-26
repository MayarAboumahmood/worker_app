// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worker_app/constant/text_style.dart';

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
      reservation: Reservation(eventId: 1, name: 'someone2', number: 5)),
  ReservationCard(
      reservation: Reservation(eventId: 1, name: 'someone3', number: 1)),
  ReservationCard(
      reservation: Reservation(eventId: 1, name: 'someone4', number: 1)),
  ReservationCard(
      reservation: Reservation(eventId: 1, name: 'someone', number: 2)),
  ReservationCard(
      reservation: Reservation(eventId: 1, name: 'someone2', number: 5)),
  ReservationCard(
      reservation: Reservation(eventId: 1, name: 'someone3', number: 1)),
  ReservationCard(
      reservation: Reservation(eventId: 1, name: 'someone4', number: 1)),
];
Widget cameReservationList() {
  return ListView.builder(
    padding: const EdgeInsets.symmetric(vertical: 20),
    itemCount: cameReservatons.length - 1,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: cameReservatons[index],
      );
    },
  );
}

Widget notCameReservationList() {
  return ListView.builder(
    padding: const EdgeInsets.symmetric(vertical: 20),
    itemCount: notCameReservatons.length - 1,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: notCameReservatons[index],
      );
    },
  );
}

Widget reservationList() {
  return Column(
    children: [
      const SizedBox(
        height: 30,
      ),
      dividerWithWord('haven not come yet'.tr),
      const SizedBox(
        height: 10,
      ),
      Expanded(child: notCameReservationList()),
      dividerWithWord('already came'.tr),
      const SizedBox(
        height: 10,
      ),
      Expanded(child: cameReservationList())
    ],
  );
}

Widget dividerWithWord(String word) {
  return Row(
    children: [
      const Divider(),
      Text(
        word,
        style: generalTextStyle(null),
      ),
      const Divider(),
    ],
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
