import 'dart:convert';

import 'package:dartz/dartz.dart';
import '../../../constant/server_const.dart';
import '../../../constant/status_request.dart';
import '../../../data/checkInternet/check_internet.dart';
import 'package:http/http.dart' as http;

import '../../../main.dart';

class EventService {
  Future<bool> checkingConfirmation() async {
    int workerId = int.parse(await prefService.readString('id'));
    var _client = http.Client();
    var request = new http.Request(
        "GET", Uri.parse('${ServerConstApis.baseAPI}sendEventID/${workerId}'));
    request.headers["Cache-Control"] = "no-cache";
    request.headers["Accept"] = "text/event-stream";

    final response = await _client.send(request); // Await the response

    if (response.statusCode == 200) {
      await response.stream.listen((data) {
        String d = utf8.decode(data);
        d = d.trim();
        print("Received data: $d");
       print(d);
        if (d != 'data: init') {
          print("stored");
          prefService.createString('enentI', "$d");
        }
        // Here, you can parse the data as needed and handle the event
      }).asFuture(); // Await the stream subscription to complete
    } else {
      print("Received unexpected status code: ${response.statusCode}");
    }
    return true;
  }

  Future<Either<StatuseRequest, Map>> getEvents(String token) async {
    //Either for return two data type in the same time
    try {
      if (await checkInternet()) {
        print("start");
        Uri url = Uri.parse(ServerConstApis.showUpComing);
        Map<String, String> headers = {
          // "Access-Control-Allow-Origin": "*",
          "x-access-token": token
        };

        var response = await http.get(url, headers: headers);
        if (response.statusCode == 200 || response.statusCode == 201) {
          final responsebody = jsonDecode(response.body);

          return Right(responsebody);
        } else if (response.statusCode == 401) {
          return const Left(StatuseRequest.authfailuer);
        } else {
          return const Left(StatuseRequest.serverfailure);
        }
      } else {
        return const Left(StatuseRequest
            .offlinefailure); //left return the left data type =>StatuseRequest
      }
    } catch (e) {
      return const Left(StatuseRequest.offlinefailure);
    }
  }
}
