import 'package:dokan/model/login.model.dart';
import 'package:dokan/model/profile.model.dart';
import 'package:dokan/services/remote.service.dart';
import 'package:dokan/utils/functions.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final isLoading = false.obs;
  final isUpdating = false.obs;
  final profileInfo = ProfileModel().obs;
  final _payload = {
    "name": "",
    "first_name": "",
    "last_name": "",
    "email": "",
    "url": "",
    "description": "",
    "link": "",
    "locale": "",
    "nickname": ""
  };

  @override
  void onInit() {
    _fetchInfo();
    super.onInit();
  }

  void _fetchInfo() async {
    isLoading(true);
    var res = await RemoteService.profileInfo(null);
    if (res.status) {
      ProfileModel data = res.data as ProfileModel;
      profileInfo.value = data;
    } else {
      LoginModelErr data = res.data as LoginModelErr;
      showErrorSnack("Data Fetching Failed", "${data.message}");
    }
    isLoading(false);
  }

  void updateProfile() async {
    isUpdating(true);
    var res = await RemoteService.profileInfo(_payload);
    if (res.status) {
      ProfileModel data = res.data as ProfileModel;
      profileInfo.value = data;
      showSuccessSnack("Data Update Success", "");
    } else {
      LoginModelErr data = res.data as LoginModelErr;
      showErrorSnack("Data Updating Failed", "${data.message}");
    }
    isUpdating(false);
  }

  void setData(String key, String data) async {
    _payload[key] = data;
  }
}
