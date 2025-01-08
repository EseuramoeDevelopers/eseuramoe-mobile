import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/core/services/request.services.dart';
import 'package:myapp/core/services/storage.services.dart';
import 'package:myapp/features/essentials/app/app.ui.dart';
import 'package:myapp/features/essentials/workspace/widgets/create.sheet.dart';

class WorkspacesVM extends GetxController {
  RxList workspaceData = [].obs;

  Future<void> handleReload() async {
    Future.delayed(const Duration(seconds: 5), () {
      requestInit();
    });
  }

  Future<void> handleCreate(BuildContext context) async {
    Future.delayed(
      const Duration(milliseconds: 200),
      () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) {
            return WorkspaceCreate();
          },
        );
      },
    );
  }
  
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
