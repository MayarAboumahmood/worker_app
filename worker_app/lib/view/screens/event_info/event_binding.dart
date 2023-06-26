import 'package:get/get.dart';
import 'package:worker_app/view/screens/event_info/event_controller.dart';

class EventInfoBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(EventInfoController());
  }
}
