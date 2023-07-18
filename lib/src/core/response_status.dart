// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names, file_names

import 'dart:convert';

import 'package:buchi/src/core/custom_exception.dart';
import 'package:dio/dio.dart' as di;


dynamic ResponseStatus(di.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = response.data;
      return responseJson;
    case 201:
      var responseJson = response.data;
      return responseJson;
    case 204:
      var responseJson = response.data;
      return responseJson;
    case 400:
      if (response is di.DioError) {
        di.DioError res = response as di.DioError;
        throw BadRequestException( "Not Found");
      }
      break;
    case 401:
      throw UnauthorisedException(json.decode(response.data.toString()));
    case 403:
      throw UnauthorisedException(json.decode(response.data.toString()));
    case 500:
    default:
      throw FetchDataException(
          message:
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
