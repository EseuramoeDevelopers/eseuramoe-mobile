import 'dart:convert';

import 'package:get/get.dart';
import 'package:myapp/core/services/request.services.dart';
import 'package:myapp/core/services/storage.services.dart';
import 'package:myapp/features/essentials/workspace/workspace.ui.dart';

class HomeVM extends GetxController {
  RxString userName = "".obs;
  RxString resultCount = "0".obs;
  RxString modelCount = "0".obs;
  RxString detectedCount = "0".obs;
  RxList workspaceData = [].obs;

  void requestInit() async {
    // REQUEST NEW DATA
    await RequestServices().requestWorkspacesData();
    await RequestServices().requestDashboardData();

    // UPDATE STATES
    userName.value = (await StorageService("user_data").get("user_name") ?? "")
        .split(" ")
        .first;

    resultCount.value = formatValue(
        await StorageService("dashboard_data").get("result_count") ?? 0);
    modelCount.value = formatValue(
        await StorageService("dashboard_data").get("model_count") ?? 0);
    detectedCount.value = formatValue(
        await StorageService("dashboard_data").get("detected_count") ?? 0);

    workspaceData.value = jsonDecode(
        await StorageService("workspace_data").get("workspace_data") ?? []);

    update();
  }

  void handleWorkspaces() async {
    Get.to(() => WorkspaceUi());
  }

  @override
  void onInit() {
    requestInit();
    super.onInit();
  }
}

String formatValue(dynamic value) {
  int intValue = int.tryParse(value.toString()) ?? 0;
  return intValue < 10 ? "0$intValue" : intValue.toString();
}
