import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:novi_bus_app/api/base_url.dart';
import 'package:novi_bus_app/api/custom_exception.dart';
import 'package:novi_bus_app/api/error_handler.dart';
import 'package:novi_bus_app/config/session.dart';
import 'package:http/http.dart' as http;

class ApiConnect extends GetConnect {
  @override
  void onInit() {
    httpClient.timeout = Duration(seconds: AppSettings().timeout);
    super.onInit();
  }

  Future<dynamic> getApi(String url, {Map<String, dynamic>? qurey}) async {
    // var headers = {'Authorization': "Bearer ${Session.token}"};
    log('----Token -----');

    final response = await get(
      "${BaseUrl().baseUrl}$url",
      query: qurey,
    );
    if (response.status.hasError) {
      log('----Status Code -----');
      log(response.statusCode.toString());

      ErrorHandleError.errorHandleError(response);
    } else {
      return response;
    }
  }

  Future<dynamic> postApi(String url, dynamic body) async {
    // var headers = {'Authorization': "Bearer ${Session.token}"};
    final response = await post(
      "${BaseUrl().baseUrl}$url",
      body,
    );
    if (response.status.hasError) {
      log('----Status Code -----');
      log(response.statusCode.toString());
      log(response.body.toString());
      ErrorHandleError.errorHandleError(response);
    } else {
      return response;
    }
  }

  Future<dynamic> getApiWithHeader(String url,
      {Map<String, dynamic>? qurey}) async {
    var headers = {'Authorization': "Bearer ${Session.accessId}"};
    log('----Token -----');

    final response = await get(
      "${BaseUrl().baseUrl}$url",
      headers: headers,
      query: qurey,
    );
    if (response.status.hasError) {
      log('----Status Code -----');
      log(response.statusCode.toString());

      ErrorHandleError.errorHandleError(response);
    } else {
      return response;
    }
  }

  Future<dynamic> postApiWithHeader(String url, dynamic body) async {
    var headers = {'Authorization': "Bearer ${Session.accessId}"};
    final response = await post(
      "${BaseUrl().baseUrl}$url",
      headers: headers,
      body,
    );
    if (response.status.hasError) {
      log('----Status Code -----');
      log(response.statusCode.toString());
      log(response.body.toString());
      ErrorHandleError.errorHandleError(response);
    } else {
      return response;
    }
  }

  Future<dynamic> deleteApi(
    String url,
    dynamic param,
  ) async {
    debugPrint("Calling API storeAPICall post: $url");
    debugPrint("Calling parameters: $param");
    dynamic responseJson;
    try {
      final response = await http.delete(
        Uri.parse(BaseUrl().baseUrl + url),
        body: param,
        headers: <String, String>{
          "Authorization": 'Bearer ${Session.accessId}',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );
      debugPrint(response.statusCode.toString());
      debugPrint(response.body);
      responseJson = _response(response);
      debugPrint('the response data is ----> $responseJson');
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    //return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      case 201:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode:${response.statusCode}');
    }
  }
}
