class AppConstants {
  static const String photoUrl =
      "https://firebasestorage.googleapis.com/v0/b/prof-d1cc3.appspot.com/o/eseuramoe%2Favatars%2Fsilhouette.png?alt=media&token=35d79a20-d84f-49c2-960c-12e2b8f6cb29";
  static const String baseUrl =
      'https://server-eseuramoe.netlify.app/.netlify/functions/api/';
  static const String engineUrl = 'https://5d19-103-14-20-182.ngrok-free.app/';
  static const String userUrl = 'user-management';
  static const String appUrl = 'app-management';
  static const String modelUrl = 'model-management';
  static const String workspaceUrl = 'workspace-management';
  static const String dataUrl = 'data-management';

  // FUNCTIONAL API
  // TEST SECURE
  static const String testUrl = '$appUrl/test-secure';

  // AUTH
  static const String loginUrl = '$userUrl/auth';
  static const String registerUrl = '$userUrl/register';
  static const String checkEmailUrl = '$userUrl/find/email';
  static const String checkIdentityUrl = '$userUrl/get';

  // USER MANAGEMENT
  static const String updateUrl = '$userUrl/update';
  static const String updatePassUrl = '$userUrl/update/pass';

  // SEND OTP
  static const String sendOtpUrl = '$userUrl/send/otp';

  // CHECK OTP
  static const String checkOtpUrl = '$userUrl/verify/otp';

  // DASHBOARD DATA
  static const String getDashboard = '$dataUrl/get/dashboard';

  // WORKSPACES MANAGEMENT
  static const String getWorkspaceUrl = '$workspaceUrl/get/by-user';
  static const String createWorkspaceUrl = '$workspaceUrl/create';
  static const String deleteWorkspaceUrl = '$workspaceUrl/delete/one';
  static const String deleteAllWorkspaceUrl = '$workspaceUrl/delete/by-user';

  static const String performScanUrl = '$engineUrl/engine-scan';
}
