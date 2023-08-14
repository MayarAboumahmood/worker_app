import 'package:get/get.dart';
import 'package:worker_app/view/screens/event_page/event_page_controller.dart';
import 'package:worker_app/view/widget/new_event_card.dart';

class EventPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(EventPageController());
  }
}
