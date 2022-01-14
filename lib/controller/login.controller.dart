import 'package:dokan/model/login.model.dart';
import 'package:dokan/services/remote.service.dart';
import 'package:dokan/utils/functions.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var response = LoginModel().obs;
  var responseErr = LoginModelErr().obs;
  final _payload = {"username": "", "password": ""}.obs;

  Map<String, String> get payload => _payload.value;

  void login() async {
    isLoading(true);
    var res = await RemoteService().login(payload);
    if (res.status) {
      LoginModel data = res.data as LoginModel;
      response.value = data;

      showSuccessSnack("Login Success",
          "Hello ${data.userDisplayName}, You are successfully logged in ");
    } else {
      LoginModelErr data = res.data as LoginModelErr;
      responseErr.value = data;
      showErrorSnack("Login Failed", data.message ?? "Unable to login");
    }
    isLoading(false);
  }

  void setData(String key, String data) async {
    _payload.value[key] = data;
  }
}
