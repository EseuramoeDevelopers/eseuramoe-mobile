import 'package:get/get.dart';
import 'package:myapp/core/services/storage.services.dart';

class HomeVM extends GetxController {
  RxString userName = "".obs;

  void requestInit() async {
    userName.value = await StorageService("user_data").get("user_name");
    update();
  }

  @override
  void onInit() {
    requestInit();
    super.onInit();
  }
}
