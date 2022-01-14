import 'package:dokan/model/login.model.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  static const baseURL = "https://apptest.dokandemo.com/wp-json/";
  static final client = http.Client();

  Future<RemoteResponse> login(Map<String, String> payload) async {
    var res = await client.post(Uri.parse(baseURL + "jwt-auth/v1/token"),
        body: payload);
    var result = RemoteResponse();
    if (res.statusCode == 200) {
      result.msg = "Login Success";
      result.status = true;
      result.data = loginModelFromJson(res.body);
    } else {
      result.msg = "Login Failed";
      result.status = false;
      result.data = loginErrModelFromJson(res.body);
    }
    return result;
  }

  Future<RemoteResponse> registration(Map<String, String> payload) async {
    var res = await client.post(Uri.parse("jwt-auth/v1/token"), body: payload);
    var result = RemoteResponse();
    if (res.statusCode == 200) {
      result.msg = "Login Success";
      result.status = true;
      result.data = loginModelFromJson(res.body);
    } else {
      result.msg = "Login Failed";
      result.status = false;
      result.data = loginErrModelFromJson(res.body);
    }
    return result;
  }
}

class RemoteResponse {
  var msg;
  var status = false;
  var data;
}
