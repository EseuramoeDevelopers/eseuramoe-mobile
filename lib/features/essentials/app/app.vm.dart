import 'package:get/get.dart';

class AppVM extends GetxController {
  RxInt selectedIndex = 0.obs;

  void handleChangeIndex(int index) {
    selectedIndex.value = index;
    update();
  }
}
