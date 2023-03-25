import 'package:novi_bus_app/api/provider.dart';

class ApiProvider extends ApiConnect {
  // Future<AuthModel?> loginApi(
  //   String mobile,
  // ) async {
  //   var body = FormData({
  //     "mobile": mobile,
  //   });

  //   log(body.toString());
  //   final response = await postApi('login.aspx', body);
  //   if (response != null) {
  //     return AuthModel.fromJson(response.body);
  //   }
  //   return null;
  // }

  // Future<CoverModel?> allCovers(String filter) async {
  //   var body = FormData({"userid": Session.userId, "filter": filter});

  //   log(body.toString());
  //   final response = await postApi('all_covers.aspx', body);
  //   if (response != null) {
  //     return CoverModel.fromJson(response.body);
  //   }
  //   return null;
  // }

  // Future<CoverModel?> distributedCovers() async {
  //   var body = FormData({"userid": Session.userId, "filter": 'date'});

  //   log(body.toString());
  //   final response = await postApi('distributed_covers.aspx', body);
  //   if (response != null) {
  //     return CoverModel.fromJson(response.body);
  //   }
  //   return null;
  // }

}
