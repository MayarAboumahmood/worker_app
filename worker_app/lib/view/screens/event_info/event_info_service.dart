import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import '../../../constant/server_const.dart';
import '../../../constant/status_request.dart';
import '../../../data/checkInternet/check_internet.dart';
import 'package:http/http.dart' as http;


class EventInfoService {
  Future<Either<StatuseRequest, Map>> getEventInfo(
      String token, Map<String, String> data) async {
    //Either for return two data type in the same time
    try {
      if (await checkInternet()) {
        print("start");
        Uri url = Uri.parse(ServerConstApis.showEventInfo);
        Map<String, String> headers = {
          // "Access-Control-Allow-Origin": "*",
          "x-access-token": token
        };

        http.Response response = await http.post(
          url,
          body: data,
          headers: headers,
        );

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
