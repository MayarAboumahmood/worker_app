import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/sizes.dart';
import '../../constant/text_style.dart';
import '../../constant/theme.dart';

class EventCard extends StatelessWidget {
  final EventCardController controller = Get.put(EventCardController());
  final Event event;

  EventCard({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Sizes size = Sizes(context);
    return cardBody(size);
  }

  Widget cardBody(Sizes size) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Get.isDarkMode ? skinColorWhite! : backGroundDarkColor,
          ),
          color: Get.isDarkMode
              ? darkWoodBrownColor.withOpacity(0.9)
              : woodBrownColor.withOpacity(0.9),
          borderRadius: BorderRadius.circular(size.buttonRadius),
        ),
        width: size.drinkCardWidth,
        // height: 210,
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              child: GestureDetector(
                  onHorizontalDragEnd: (details) {
                    const velocityThreshold = 2.0;
                    if (details.velocity.pixelsPerSecond.dx.abs() >
                        velocityThreshold) {
                      final direction =
                          details.velocity.pixelsPerSecond.dx.isNegative
                              ? -1
                              : 1;
                      controller.onSlide(direction);
                    }
                  },
                  onTap: () {},
                  child: buildImagesList(size)),
            ),
            const SizedBox(height: 10),
            buildDots(),
            setEventOneINfo(
              event.eventName,
            ),
            const SizedBox(height: 3),
            setEventOneINfo(
              '${event.ticketsPrice} S.P',
            ),
            const SizedBox(height: 3),
            setEventOneINfo(event.description),
            const SizedBox(height: 3),
            setEventOneINfo(
              'Artists: ${event.artistsNames.join(", ")}',
            ),
            const SizedBox(height: 3),
            setEventOneINfo(
              'Available Places: ${event.availablePlaces}',
            ),
            const SizedBox(height: 3),
            setEventOneINfo(
              'Begin Date: ${event.beginDate}',
            ),
          ],
        )));
  }

  Widget buildImagesList(Sizes size) {
    return AnimatedBuilder(
      animation: controller.pageController,
      builder: (context, child) {
        return PageView.builder(
          onPageChanged: controller.setPageIndex,
          controller: controller.pageController,
          itemCount: event.imagesNames.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(size.buttonRadius),
                topRight: Radius.circular(size.buttonRadius),
              ),
              child: Image.asset(
                event.imagesNames[index],
                fit: BoxFit.fill,
              ),
            );
          },
        );
      },
    );
  }

  Widget buildDots() {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          event.imagesNames.length,
          (index) =>
              buildDot(index: index, currentIndex: controller.pageIndex.value),
        ),
      );
    });
  }

  Widget setEventOneINfo(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: AutoSizeText(title, style: generalTextStyle(15)),
    );
  }

  Widget buildDot({required int index, required int currentIndex}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.all(5),
      height: 6,
      width: index == currentIndex ? 20 : 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: index == currentIndex
            ? (Get.isDarkMode ? darkPrimaryColor : primaryColor)
            : const Color(0xFFD8D8D8),
      ),
    );
  }
}

class Event {
  final List<String> imagesNames;
  final String eventName;
  final List<String> artistsNames;
  final String description;
  final double ticketsPrice;
  final int availablePlaces;
  final String beginDate;

  Event({
    required this.imagesNames,
    required this.eventName,
    required this.artistsNames,
    required this.description,
    required this.ticketsPrice,
    required this.availablePlaces,
    required this.beginDate,
  });
}

class EventCardController extends GetxController {
  final PageController pageController = PageController();
  final RxInt pageIndex = 0.obs;

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void setPageIndex(int index) {
    pageIndex.value = index;
  }

  void onSlide(int direction) {
    if (direction == 1) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }
}
