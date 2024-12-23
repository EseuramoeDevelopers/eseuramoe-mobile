import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myapp/core/services/request.services.dart';
import 'package:myapp/features/essentials/app/app.ui.dart';
import 'package:myapp/features/essentials/login/login.ui.dart';

class RegisterVM extends GetxController {
  // STATES
  RxString nameController = "".obs;
  RxString emailController = "".obs;
  RxString passwordController = "".obs;
  RxString passwordConfirmController = "".obs;

  RxBool isLoadingStandard = false.obs;
  RxBool isLoadingGoogle = false.obs;
  RxBool isError = false.obs;

  void handleBack() async {
    Get.to(() => LoginUi());
  }

  void handleLogin() async {
    Get.to(() => LoginUi());
  }

  void handleRequestStandard() async {
    isLoadingGoogle.value = false;
    isLoadingStandard.value = true;

    Future.delayed(const Duration(seconds: 3)).then((_) async {
      if (passwordController.value == passwordConfirmController.value) {
        isError.value = false;
      } else {
        isError.value = true;
      }

      var data = {
        "name": nameController.value,
        "email": emailController.value,
        "password": passwordController.value,
      };

      final bool requestStatus = await RequestServices().requestRegister(data);

      if (requestStatus) {
        var data = {
          "email": emailController.value,
          "password": passwordController.value,
        };

        final bool loginStatus = await RequestServices().requestLogin(data);

        if (loginStatus) {
          Get.to(() => AppUi());
        } else {
          isError.value = true;
        }
      } else {
        isError.value = true;
      }
      isLoadingStandard.value = false;
    });

    update();
  }

  void handleRequestGoogle() async {
    isLoadingStandard.value = false;
    isLoadingGoogle.value = true;

    Future.delayed(const Duration(seconds: 3)).then((_) async {
      await GoogleSignIn().signOut();

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      var result = await FirebaseAuth.instance.signInWithCredential(credential);

      if (result.user != null) {
        var name = result.user!.displayName;
        var email = result.user!.email;
        var password = result.user!.uid;
        var photoUrl = result.user!.photoURL;

        try {
          var data = {'email': email};

          final bool isEmailRegistered =
              await RequestServices().requestCheckEmail(data);

          if (isEmailRegistered) {
            var data = {
              'email': email,
              'password': password,
            };

            final bool requestStatus =
                await RequestServices().requestLogin(data);

            if (requestStatus) {
              Get.to(
                () => AppUi(),
              );
            } else {
              isError.value = true;
            }
          } else {
            var data = {
              'name': name,
              'email': email,
              'password': password,
              'photo': photoUrl,
            };

            final bool requestStatus =
                await RequestServices().requestRegister(data);

            if (requestStatus) {
              var data = {
                'email': email,
                'password': password,
              };
              final bool requestStatus =
                  await RequestServices().requestLogin(data);

              if (requestStatus) {
                Get.to(
                  () => AppUi(),
                );
              } else {
                isError.value = true;
              }
            }
          }
        } catch (e) {
          isError.value = true;
        }
      }

      isLoadingGoogle.value = false;
      update();
    });
  }
}
