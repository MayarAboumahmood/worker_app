import 'package:get/get.dart';
import 'package:worker_app/view/screens/event_info/event_info_controller.dart';
import 'package:worker_app/view/widget/new_event_card.dart';

class EventInfoBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(EventInfoController());
    // Get.put(EventCardController());
  }
}
