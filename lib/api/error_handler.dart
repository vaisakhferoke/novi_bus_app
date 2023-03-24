import 'package:get/get.dart';
import 'package:novi_bus_app/utils/style.dart';

class ErrorHandleError {
  static errorHandleError(Response response) {
    switch (response.statusCode) {
      case 200:
        break;
      case 401:
        break;

      default:
        errorToast(response.statusText!);
    }
  }
}
