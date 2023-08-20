import 'package:get/get.dart';
import 'package:worker_app/data/Models/door_model.dart';
import 'package:worker_app/data/Models/drink_model.dart';
import 'package:worker_app/view/screens/door/door_controller.dart';
import 'package:worker_app/view/widget/drink_card.dart';

class GeneralSearchController extends GetxController {
  DrinkCardController drinkCardController = Get.find();
  DoorController doorController = Get.find();
  List<DrinkModel> drinkSearchedList = [];
  List<ReservationResponse> finalSearchListData = [];
  @override
  void onInit() {
    drinkSearchedList = drinkCardController.finalListData;
    finalSearchListData =
        doorController.finalListDataCome + doorController.finalListDataNotCome;
    super.onInit();
  }

  RxInt drinkSearchedListLength = 0.obs;
  void drinkSearch(String drinkSearhedName) {
    if (drinkSearchedList.isEmpty) {
      drinkSearchedList = drinkCardController.finalListData;
    }

    print('drinkSearchedList: ');
    print(drinkSearchedList.length);

    drinkSearchedList = drinkCardController.finalListData
        .where((character) => character.name
            .toLowerCase()
            .startsWith(drinkSearhedName.toLowerCase()))
        .toList();
  }

  void customerSearch(String customerName) {
    finalSearchListData = doorController.finalListDataCome
        .where((character) => character.customerName
            .toLowerCase()
            .startsWith(customerName.toLowerCase()))
        .toList();
    finalSearchListData = doorController.finalListDataNotCome
        .where((character) => character.customerName
            .toLowerCase()
            .startsWith(customerName.toLowerCase()))
        .toList();
  }
}
