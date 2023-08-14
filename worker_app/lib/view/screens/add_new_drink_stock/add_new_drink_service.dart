// // ignore_for_file: avoid_print

// import 'dart:convert';
// import 'dart:typed_data';

// import 'package:http/http.dart' as http;
// import 'package:dartz/dartz.dart';

// class AddDrinkService {
//   Future<Either<StatuseRequest, Map>> addDrink(
//       Map<String,String> data, Uint8List image,String imageName, String token) async {
//     //Either for return two data type in the same time
//     try {
//       if (await checkInternet()) {
//         print("starting in service");
//         Uri url = Uri.parse(ServerConstApis.addDrink);
       
//         Map<String, String> headers = {
//           "Access-Control-Allow-Origin": "*",
//           "x-access-token": token
//         };
    

//         var request = http.MultipartRequest("POST", url);
//         var multipartFile = http.MultipartFile.fromBytes(
//           "picture",
//           image,filename: imageName
//         );
//         request.files.add(multipartFile);
//         request.fields.addAll(data);
//         request.headers.addAll(headers);
//         var myrequest = await request.send();
//         var response = await http.Response.fromStream(myrequest);
//         print(response.body);
//         print(response.statusCode);
//         if (response.statusCode == 200 || response.statusCode == 201) {
//           final responsebody = jsonDecode(response.body);

//           return Right(responsebody);
//         } else if (response.statusCode == 400) {
//           return const Left(StatuseRequest.validationfailuer);
//         } else if (response.statusCode == 401) {
//           return const Left(StatuseRequest.authfailuer);
//         } else {
//           return const Left(StatuseRequest.serverfailure);
//         }
//       } else {
//         return const Left(StatuseRequest
//             .offlinefailure); //left return the left data type =>StatuseRequest
//       }
//     } catch (e) {
//       print(e);
//       return const Left(StatuseRequest.serverfailure);
//     }
//   }
// }