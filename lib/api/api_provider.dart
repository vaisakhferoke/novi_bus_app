import 'dart:developer';

import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:novi_bus_app/api/provider.dart';
import 'package:novi_bus_app/config/session.dart';
import 'package:novi_bus_app/model/api_model.dart';
import 'package:novi_bus_app/model/driver_list_model.dart';
import 'package:novi_bus_app/model/login_response.dart';

class ApiProvider extends ApiConnect {
  Future<LoginResponse?> loginApi(String username, String password) async {
    var body = FormData({"username": username, "password": password});

    log(body.toString());
    final response = await postApi('LoginApi', body);
    if (response != null) {
      return LoginResponse.fromJson(response.body);
    }
    return null;
  }

  Future<DriverListModel?> allDrivers() async {
    final response = await getApiWithHeader(
      'DriverApi/${Session.urlId}/',
    );
    if (response != null) {
      return DriverListModel.fromJson(response.body);
    }
    return null;
  }

  Future<ApiModel?> addDrivers(String name, String liseNo) async {
    var body =
        FormData({"name": name, "mobile": '9744449448', 'license_no': liseNo});

    log(body.toString());
    final response =
        await postApiWithHeader('DriverApi/${Session.urlId}/', body);
    if (response != null) {
      return ApiModel.fromJson(response.body);
    }
    return null;
  }

  Future<ApiModel?> deleteDriver(String id) async {
    var body = {
      "driver_id": id,
    };
    // log(body.toString());
    final response = await deleteApi('DriverApi/${Session.urlId}/', body);
    if (response != null) {
      return ApiModel.fromJson(response);
    }
    return null;
  }
}
