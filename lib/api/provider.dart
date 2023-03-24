import 'dart:developer';
import 'package:get/get.dart';
import 'package:novi_bus_app/api/base_url.dart';
import 'package:novi_bus_app/api/error_handler.dart';

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

  Future<dynamic> deleteApi(String url, {Map<String, dynamic>? qurey}) async {
    final response = await delete(
      "${BaseUrl().baseUrl}$url",
      query: qurey,
      // body,
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
}
