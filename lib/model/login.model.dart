import 'dart:convert';

LoginModelErr loginErrModelFromJson(String str) =>
    LoginModelErr.fromJson(json.decode(str));

String loginErrModelToJson(LoginModelErr data) => json.encode(data.toJson());

class LoginModelErr {
  LoginModelErr({
    this.code,
    this.message,
    this.data,
  });

  var code;
  String? message;
  Data? data;

  factory LoginModelErr.fromJson(Map<String, dynamic> json) => LoginModelErr(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.status,
  });

  var status;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
      };
}

/// Login Success Model
LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.token,
    this.userEmail,
    this.userNicename,
    this.userDisplayName,
  });

  String? token;
  String? userEmail;
  String? userNicename;
  String? userDisplayName;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        token: json["token"],
        userEmail: json["user_email"],
        userNicename: json["user_nicename"],
        userDisplayName: json["user_display_name"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user_email": userEmail,
        "user_nicename": userNicename,
        "user_display_name": userDisplayName,
      };
}
