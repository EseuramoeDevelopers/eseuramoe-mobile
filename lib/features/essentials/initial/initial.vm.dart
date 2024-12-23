import 'package:get/get.dart';
import 'package:myapp/core/services/storage.services.dart';
import 'package:myapp/features/essentials/app/app.ui.dart';
import 'package:myapp/features/essentials/splash/splash.ui.dart';

class InitialVM extends GetxController {
  @override
  void onInit() {
    sessionCheck();
    super.onInit();
  }

  Future<void> sessionCheck() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );

    var accessToken = await StorageService("access_token").get("access_token");

    if (accessToken == null || accessToken == "") {
      Get.to(
        () => SplashUi(),
      );
    } else {
      Get.to(
        () => AppUi(),
      );
    }
  }
}
