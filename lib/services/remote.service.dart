import 'dart:convert';

import 'package:dokan/model/login.model.dart';
import 'package:dokan/model/product.model.dart';
import 'package:dokan/model/profile.model.dart';
import 'package:dokan/model/signup.model.dart';
import 'package:dokan/services/local.service.dart';
import 'package:dokan/utils/const_data.dart';
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

  static Future<RemoteResponse> profileInfo(
      Map<String, String>? payload) async {
    final userInfo = await LocalService.getSessionInfo();

    var headers = {'Authorization': "Bearer ${userInfo?.token ?? ""}"};

    var res = await client.post(Uri.parse(baseURL + "wp/v2/users/me"),
        headers: headers, body: payload);
    var result = RemoteResponse();
    if (res.statusCode == 200) {
      result.msg = "Success";
      result.status = true;
      result.data = profileModelFromJson(res.body);
    } else {
      result.msg = "Failed";
      result.status = false;
      result.data = loginErrModelFromJson(res.body);
    }
    return result;
  }

  static Future<List<ProductModel>?> fetchProduct() async {
    var list = <ProductModel>[];
    await Future.delayed(const Duration(seconds: 3)).then((value) {
      list = productModelFromJson(json.encode(products));
    });
    return list;
  }
}

class RemoteResponse {
  var msg;
  var status = false;
  var data;
}
