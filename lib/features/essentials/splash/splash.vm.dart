import 'package:get/get.dart';
import 'package:myapp/features/essentials/login/login.ui.dart';

class SplashVM extends GetxController {
  void handleButton() async {
    Get.to(
      () => LoginUi(),
    );
  }
}
