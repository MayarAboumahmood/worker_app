import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/status_request.dart';
import '../../../data/Models/event_info_model.dart';
import '../../../general_controller/statuse_request_controller.dart';
import '../../../main.dart';
import '../../widget/no_internet_page.dart';
import '../../widget/snak_bar_for_errors.dart';
import 'event_info_service.dart';

class EventInfoController extends GetxController
    implements StatuseRequestController {
  final RxInt pageIndex = 0.obs;
  final PageController pageController = PageController();
  EventInfoService service = EventInfoService();
  EventInfoModel? model;
  late int eventId;
  bool isConfirmed = false;
RxInt eventModelImageLengh = 0.obs;
  
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

  @override
  StatuseRequest? statuseRequest = (StatuseRequest.init);
  @override
  void onInit() async {
    eventId = Get.arguments;
    model = await sendingARequestAndHandlingData();
    String g = await prefService.readString('enentI');
    g = g.toString().substring(6);
    if (g == eventId.toString()) {
      print("event equals");
      isConfirmed = true;
    } else {
      print("r");
      isConfirmed = false;
    }
    statuseRequest = StatuseRequest.loading;

    statuseRequest = await checkIfTheInternetIsConectedBeforGoingToThePage();
// statuseRequest=StatuseRequest.success;
    super.onInit();
  }

  sendingARequestAndHandlingData() async {
    print("drrrrrrrrrrrrrrr");
    statuseRequest = StatuseRequest.loading;
    update();
    dynamic response =
        await getdata(); // check if the return data is statuseRequest or real data
    statuseRequest = handlingData(response); //return the statuseResponse
    if (statuseRequest == StatuseRequest.success) {
      return whenGetDataSuccess(response);
    } else if (statuseRequest == StatuseRequest.authfailuer) {
      snackBarForErrors("Auth error", "Please login again");
      Get.offAllNamed('LoginPage');
    } else {
      // when happen a mestake we handel it here
      [];
    }
    update();
  }

  getdata() async {
    String token = await prefService.readString('token');
    Map<String, String> data = {"event_id": eventId.toString()};
    Either<StatuseRequest, Map<dynamic, dynamic>> response =
        await service.getEventInfo(token, data);

    return response.fold((l) => l, (r) => r);
  }

  handlingData(response) {
    if (response is StatuseRequest) {
      return response;
    } else {
      return StatuseRequest.success;
    }
  }

  Future<EventInfoModel> whenGetDataSuccess(response) async {
    Map<String, dynamic> data = response['data'];
    model = EventInfoModel.fromMap(data);
    print(model!.id);
     eventModelImageLengh.value = model!.images.length;
    update();
    
    return model!;
  }
}
