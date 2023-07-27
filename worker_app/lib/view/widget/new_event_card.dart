import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worker_app/constant/fonts.dart';
import 'package:worker_app/constant/text_style.dart';
import 'package:worker_app/constant/theme.dart';

class NewEventCard extends StatelessWidget {
  const NewEventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.size.height * .12,
        width: Get.size.width * .95,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black54,
              width: 0.2,
            ),
            color: Get.isDarkMode
                ? const Color.fromARGB(255, 54, 54, 54)
                : Colors.grey[400],
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(400),
                bottomRight: Radius.circular(400))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: dateContainer(
                  'july'.toUpperCase(), 9, 'sunday'.toUpperCase()),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Event Name', style: generalTextStyle(25)),
                  timeContainer('6:30 PM'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Center(
                child: ClipOval(
                    child: Image.asset('assets/images/The project icon 1.jpg')),
              ),
            )
          ],
        ));
  }

  Widget timeContainer(String time) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      height: Get.size.height * .04,
      width: Get.size.width * .22,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black54,
            width: 0.2,
          ),
          color: const Color.fromARGB(255, 199, 214, 213),
          borderRadius: const BorderRadius.all(Radius.circular(100))),
      child: Center(
          child: Text(
        time,
        style: const TextStyle(color: Colors.black54),
      )),
    );
  }

  Widget dateContainer(String monthName, int monthNumber, String dayName) {
    return Center(
      child: Container(
        height: Get.size.height * .11,
        width: Get.size.height * .11,
        decoration: BoxDecoration(
          color: Get.isDarkMode
              ? darkPrimaryColor
              : const Color.fromARGB(255, 184, 212, 210),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // const Spacer(),
            Text(
              monthName,
              style:
                  TextStyle(color: Colors.black26, fontFamily: jostFontFamily),
            ),
            const SizedBox(
              height: 1,
            ),
            Text(monthNumber.toString(),
                style: TextStyle(fontSize: 31, fontFamily: jostFontFamily)),
            const SizedBox(
              height: 0,
            ),
            Text(dayName,
                style: TextStyle(
                    color: Colors.black26, fontFamily: jostFontFamily)),
            // const Spacer(),
          ],
        ),
      ),
    );
  }
}
