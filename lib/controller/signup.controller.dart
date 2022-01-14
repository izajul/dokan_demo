import 'package:dokan/model/signup.model.dart';
import 'package:dokan/services/remote.service.dart';
import 'package:dokan/utils/functions.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  var isLoading = false.obs;
  var isSignupComplete = false.obs;
  final payload = {"username": "", "email": "", "password": ""}.obs;

  Map<String, String> get _payload => payload.value;

  void register() async {
    isLoading(true);
    final res = await RemoteService.registration(_payload);
    SignupModel data = res.data as SignupModel;

    if (res.status) {
      isSignupComplete(true);
      showSuccessSnack("Signup Success", data.message ?? "Signup completed");
    } else {
      showErrorSnack(
          "Signup Failed", data.message ?? "Unable to signup, try again");
    }

    isLoading(false);
  }

  void setData(String key, String data) async {
    payload.value[key] = data;
  }
}
