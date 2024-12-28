import 'dart:convert';

import 'package:get/get.dart';
import 'package:myapp/core/services/request.services.dart';
import 'package:myapp/core/services/storage.services.dart';
import 'package:myapp/features/essentials/app/app.ui.dart';

class WorkspacesVM extends GetxController {
  RxList workspaceData = [].obs;

  void requestInit() async {
    await RequestServices().requestWorkspacesData();

    workspaceData.value = jsonDecode(
        await StorageService("workspace_data").get("workspace_data") ?? []);
  }

  @override
  void onInit() {
    requestInit();
    super.onInit();
  }

  void handleBack() async {
    Get.to(() => AppUi());
  }
}
