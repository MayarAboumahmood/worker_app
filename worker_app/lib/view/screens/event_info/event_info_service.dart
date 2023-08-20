import 'dart:convert';

import 'package:dartz/dartz.dart';
import '../../../constant/server_const.dart';
import '../../../constant/status_request.dart';
import '../../../data/checkInternet/check_internet.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_client_sse/flutter_client_sse.dart';

class EventInfoService {
     void test() {
    SSEClient.subscribeToSSE(
        url:Uri.parse('${ServerConstApis.baseAPI}notifications').toString() ,
        header: {
          "Cookie":
              'jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InRlc3QiLCJpYXQiOjE2NDMyMTAyMzEsImV4cCI6MTY0MzgxNTAzMX0.U0aCAM2fKE1OVnGFbgAU_UVBvNwOMMquvPY8QaLD138; Path=/; Expires=Wed, 02 Feb 2022 15:17:11 GMT; HttpOnly; SameSite=Strict',
          "Accept": "text/event-stream",
          "Cache-Control": "no-cache",
        }).listen((event) {
      print('Id: ' + event.id!);
      print('Event: ' + event.event!);
      print('Data: ' + event.data!);
    });
  }
 
  Future<Either<StatuseRequest, Map>> getEventInfo(String token,Map<String,String> data) async {
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
        test();
       print(response.body);
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
