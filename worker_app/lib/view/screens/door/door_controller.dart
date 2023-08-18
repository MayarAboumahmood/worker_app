import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import '../../../constant/status_request.dart';

import '../../../data/Models/door_model.dart';
import '../../../data/Models/event_model.dart';
import '../../../general_controller/statuse_request_controller.dart';
import '../../../main.dart';
import '../../widget/no_internet_page.dart';
import '../../widget/snak_bar_for_errors.dart';
import 'door_service.dart';

class DoorController extends GetxController
    implements StatuseRequestController {
  List<ReservationResponse> finalListDataCome = [];
  List<ReservationResponse> finalListDataNotCome = [];
  DoorService service = DoorService();
  late int eventID;
  @override
  StatuseRequest? statuseRequest = (StatuseRequest.init);
  @override
  void onInit() async {
    // statuseRequest = await checkIfTheInternetIsConectedBeforGoingToThePage();
    await sendingARequestAndHandlingData();
    statuseRequest = await checkIfTheInternetIsConectedBeforGoingToThePage();
eventID=0;
    super.onInit();
  }

  Future<List<ReservationResponse>> sendingARequestAndHandlingData() async {
    // print("drrrrrrrrrrrrrrr");
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
    return [];
  }

  getdata() async {
    String token = await prefService.readString('token');
   Map<String,String> data={
   "event_id":eventID.toString()
   };
    Either<StatuseRequest, Map<dynamic, dynamic>> response =
        await service.getDoorReservations(token,data);

    return response.fold((l) => l, (r) => r);
  }

  handlingData(response) {
    if (response is StatuseRequest) {
      return response;
    } else {
      return StatuseRequest.success;
    }
  }
List<int > numberOfPepole=[];
  Future<List<ReservationResponse>> whenGetDataSuccess(response) async {
    List notComeData = response['data']['notCome'];
    List comeData = response['data']['hasCome'];

    for (int i = 0; i < notComeData.length; i++) {
      // print(i);
      finalListDataNotCome
          .add(ReservationResponse.fromJson(notComeData[i], "notCome"));
         numberOfPepole.add( finalListDataCome[i].attendanceNumber!);
    }

    for (int i = 0; i < comeData.length; i++) {
      // print(i);
      finalListDataCome.add(ReservationResponse.fromJson(comeData[i], "come"));
         numberOfPepole.add( finalListDataNotCome[i].attendanceNumber!);
    }

// print("${finalListData[0].beginDate.hour}:${finalListData[0].beginDate.minute}");
    update();
    return finalListDataCome;
  }

  void increaseTheNumberOfPeople(int reservationID) {
    numberOfPepole[reservationID]++;
    // if (finalListDataNotCome[reservationID].attendanceNumber <
    //     finalListDataNotCome[reservationID].numberOfPlaces) {
    //   print('i am innnnnnnnnnnnnnnn');
    //   finalListDataNotCome[reservationID].attendanceNumber=(finalListDataNotCome[reservationID].attendanceNumber+1)!;
    //   reservation.cameNumber++;
      update();
    // }
  }

  void decreaseTheNumberOfPeople(int reservationID) {
    numberOfPepole[reservationID]--;
  //   if (reservation.cameNumber > 0) {
  //     reservation.cameNumber--;
  //     numberOfPeople[reservation.id].value--;
  //   }
  update();
  }
    RxBool showTrueSign = false.obs;

  void toggleTrueSign() {
    showTrueSign.toggle();
  }

}
