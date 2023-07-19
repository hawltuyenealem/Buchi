import 'dart:convert';
import 'dart:io';

import 'package:buchi/src/config/env.dart';
import 'package:buchi/src/core/response_status.dart';
import 'package:buchi/src/data/models/pet_response_model.dart';
import 'package:buchi/src/injector.dart';
import 'package:dio/dio.dart';

class PetDataSource {
  final dioClient = sl.get<Dio>();
  final baseApiUrl = BASE_API_URL;

  Future<PetResponse> getPets() async {
    var responseJson;
    try {
      final response = await dioClient.get(
        "$baseApiUrl/pets",
        options: Options(
          followRedirects: false,
          validateStatus: (status) => true,
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );
      print("here we go ${response}");
      final res = json.encode(ResponseStatus(response));
      responseJson = petResponseFromJson(res);
    } on SocketException {
      throw UnimplementedError();
    } on DioError catch (e){
    }
    return responseJson;
  }

}