import 'dart:convert';

import 'package:dokan/model/login.model.dart';
import 'package:dokan/model/signup.model.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  static const baseURL = "https://apptest.dokandemo.com/wp-json/";
  static final client = http.Client();

  static Future<RemoteResponse> login(Map<String, String> payload) async {
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

  static Future<RemoteResponse> registration(
      Map<String, String> payload) async {
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse(baseURL + "wp/v2/users/register"));
    request.body = json.encode(payload);
    request.headers.addAll(headers);
    var res = await client.send(request);

    var result = RemoteResponse();

    final bytes = await res.stream.bytesToString();

    if (res.statusCode == 200) {
      result.msg = "Registration Success";
      result.status = true;
      result.data = signupModelFromJson(bytes);
    } else {
      result.msg = "Registration Failed";
      result.status = false;
      result.data = signupModelFromJson(bytes);
    }
    return result;
  }
}

class RemoteResponse {
  var msg;
  var status = false;
  var data;
}
