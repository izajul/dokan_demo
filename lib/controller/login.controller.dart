import 'package:dokan/model/login.model.dart';
import 'package:dokan/services/remote.service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var response = LoginModel().obs;
  var responseErr = LoginModelErr().obs;

  void login(Map<String, String> payload) async {
    isLoading(true);
    var res = await RemoteService().login(payload);
    if (res.status) {
      LoginModel data = res.data as LoginModel;
      response.value = data;
      // todo :: need to save the session into local
    } else {
      LoginModelErr data = res.data as LoginModelErr;
      responseErr.value = data;
      Get.snackbar("Login Failed", "${data.message}").show();
    }
    isLoading(false);
  }
}
