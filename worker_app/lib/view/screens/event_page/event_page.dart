import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/sizes.dart';
import '../../../constant/theme.dart';
import '../../widget/animation_title.dart';
import '../../widget/drawer.dart';
import '../../widget/event_card.dart';

// ignore: must_be_immutable
class EventPage extends StatelessWidget {
  List<EventCard> events = [
    EventCard(
      event: Event(
        artistsNames: ['artist one', 'artist two', 'artist three'],
        availablePlaces: 80,
        beginDate: 'sometime',
        description: 'very good',
        eventName: 'Event one',
        imagesNames: [
          'assets/images/concert.png',
          'assets/images/medium page background image.jpg',
          'assets/images/tickets.png'
        ],
        ticketsPrice: 50,
      ),
    ),
    EventCard(
      event: Event(
        artistsNames: ['artist one', 'artist two', 'artist three'],
        availablePlaces: 80,
        beginDate: 'sometime',
        description: 'very good',
        eventName: 'Event two',
        imagesNames: [
          'assets/images/concert.png',
          'assets/images/medium page background image.jpg',
          'assets/images/tickets.png'
        ],
        ticketsPrice: 50,
      ),
    ),
    EventCard(
        event: Event(
      artistsNames: ['artist one', 'artist two', 'artist three'],
      availablePlaces: 80,
      beginDate: 'sometime',
      description: 'very good',
      eventName: 'Event three',
      imagesNames: [
        'assets/images/concert.png',
        'assets/images/medium page background image.jpg',
        'assets/images/tickets.png'
      ],
      ticketsPrice: 50,
    )),
    EventCard(
        event: Event(
      artistsNames: ['artist one', 'artist two', 'artist three'],
      availablePlaces: 80,
      beginDate: 'sometime',
      description: 'very good',
      eventName: 'Event four',
      imagesNames: [
        'assets/images/concert.png',
        'assets/images/medium page background image.jpg',
        'assets/images/tickets.png'
      ],
      ticketsPrice: 50,
    )),
    EventCard(
        event: Event(
      artistsNames: ['artist one', 'artist two', 'artist three'],
      availablePlaces: 80,
      beginDate: 'sometime',
      description: 'very good',
      eventName: 'Event five',
      imagesNames: [
        'assets/images/concert.png',
        'assets/images/medium page background image.jpg',
        'assets/images/tickets.png'
      ],
      ticketsPrice: 50,
    )),
    EventCard(
        event: Event(
      artistsNames: ['artist one', 'artist two', 'artist three'],
      availablePlaces: 80,
      beginDate: 'sometime',
      description: 'very good',
      eventName: 'Event six',
      imagesNames: [
        'assets/images/concert.png',
        'assets/images/medium page background image.jpg',
        'assets/images/tickets.png'
      ],
      ticketsPrice: 50,
    )),
  ];
  EventPage({super.key});
  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return Scaffold(
      drawer: ProjectDrawer(),
      appBar: createAppBar(size),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Get.isDarkMode ? darkPrimaryColor : primaryColor,
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                color: Get.isDarkMode ? backGroundDarkColor : skinColorWhite,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
            ),
            buildEventGridView()
          ],
        ),
      ),
    );
  }

  Widget buildEventGridView() {
    return ListView.builder(
      itemCount: events.length - 1,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: events[index],
        );
      },
    );
  }

  PreferredSizeWidget? createAppBar(Sizes size) {
    return AppBar(
      elevation: 0.4,
      backgroundColor: Get.isDarkMode ? darkPrimaryColor : primaryColor,
      title: AnimationAppBarTitle(title: 'Events'.tr),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
            size: size.appBarIconSize,
          ),
          onPressed: () {
            // Perform search action
          },
        ),
      ],
    );
  }
}
