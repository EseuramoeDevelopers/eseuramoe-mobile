import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:myapp/core/services/api.services.dart';
import 'package:myapp/core/services/storage.services.dart';
import 'package:myapp/static/constants/app.constants.dart';

class RequestServices {
  final _apiServices = ApiServices();

  // BASIC TOKEN
  Future<bool> checkAccessToken() async {
    try {
      String accessToken =
          await StorageService("access_token").get("access_token");

      if (accessToken == '' || accessToken.isEmpty) {
        return false;
      } else {
        const url = AppConstants.testUrl;

        final response = await _apiServices.get(url);

        if (response.statusCode == 200) {
          return true;
        } else {
          return false;
        }
      }
    } catch (e) {
      return false;
    }
  }

  // AUTHENTICATION - 1
  Future<bool> requestLogin(dynamic requestData) async {
    try {
      const url = AppConstants.loginUrl;

      final response = await _apiServices.post(url, requestData);

      if (response.statusCode == 200) {
        var responses = response.data;

        // SAVING USER TOKEN
        var saveToken = await StorageService("access_token").save(
          "access_token",
          responses['data']['token'],
        );

        var saveId = await StorageService("user_data").save(
          "user_id",
          responses['data']['user']['id'],
        );

        var saveName = await StorageService("user_data").save(
          "user_name",
          responses['data']['user']['name'],
        );
        var saveEmail = await StorageService("user_data").save(
          "user_email",
          responses['data']['user']['email'],
        );

        var savePhoto = await StorageService("user_data").save(
          "user_photo",
          responses['data']['user']['photo'],
        );

        if (saveToken && saveId && saveName && saveEmail && savePhoto) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      Logger().e(e);
      return false;
    }
  }

  // AUTHENTICATION - 2
  Future<bool> requestRegister(dynamic requestData) async {
    try {
      const url = AppConstants.registerUrl;

      final response = await _apiServices.post(url, requestData);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  // AUTHENTICATION - 3
  Future<bool> requestCheckEmail(dynamic requestdata) async {
    try {
      const url = AppConstants.checkEmailUrl;

      final response = await _apiServices.post(url, requestdata);
      if (response.statusCode == 200) {
        var responses = response.data;
        if (responses["message"] == "registered") {
          return true;
        } else if (responses["message"] == "unregistered") {
          return false;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  // DATA - 1
  Future<bool> requestDashboardData() async {
    try {
      const url = AppConstants.getDashboard;
      final response = await _apiServices.get(url);

      if (response.statusCode == 200) {
        var responses = response.data;

        // SAVING USER WORKSPACE
        await StorageService("dashboard_data")
            .save("result_count", responses['data']['resultCount']);

        await StorageService("dashboard_data")
            .save("model_count", responses['data']['modelCount']);

        await StorageService("dashboard_data")
            .save("detected_count", responses['data']['detectedCount']);

        await StorageService("dashboard_data")
            .save("timestamp", responses['data']['timestamp']);

        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  // WORKSPACES - 1
  Future<bool> requestWorkspacesData() async {
    try {
      const url = AppConstants.getWorkspaceUrl;
      final response = await _apiServices.get(url);

      if (response.statusCode == 200) {
        var responses = response.data;

        var responseData = jsonEncode(responses['data']);

        // SAVING USER WORKSPACE
        await StorageService("workspace_data")
            .save("workspace_data", responseData);

        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
