import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/features/essentials/login/login.vm.dart';
import 'package:myapp/features/globals/background.widget.dart';
import 'package:myapp/features/globals/button.widget.dart';
import 'package:myapp/features/globals/card.widget.dart';
import 'package:myapp/features/globals/form.widget.dart';
import 'package:myapp/static/prefixes/app.prefixes.dart';
import 'package:myapp/static/strings/app.strings.dart';
import 'package:myapp/static/themes/app.sizes.dart';
import 'package:myapp/static/themes/app.themes.dart';

class LoginUi extends StatelessWidget {
  LoginUi({super.key});

  final loginVM = Get.put(LoginVM());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, result) {
        loginVM.handleBack();
      },
      child: Scaffold(
        backgroundColor: AppThemes.blackColor,
        resizeToAvoidBottomInset: false,
        body: Builder(
          builder: (context) {
            return Padding(
              padding: EdgeInsets.only(
                top: ScreenUtil().statusBarHeight,
                bottom: ScreenUtil().bottomBarHeight,
              ),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 1.sh,
                  ),
                  child: IntrinsicHeight(
                    child: Stack(
                      children: [
                        /* BACKGROUND WIDGETS */
                        const BackgroundWidget(),

                        /* CONTENT WIDGETS */
                        Obx(() {
                          return Padding(
                            padding: const EdgeInsets.all(25).w,
                            child: Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    width: 0.3.sw,
                                    AppPrefixes.logoUrl,
                                    fit: BoxFit.fitWidth,
                                  ),
                                  CardWidget(
                                    width: 1.sw,
                                    height: 0.65.sh,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 0.02.sh,
                                          ),
                                          Text(
                                            AppStrings.loginTitle,
                                            style: GoogleFonts.poppins(
                                              color: AppThemes.whiteColor,
                                              fontSize: AppSizes.paragraphSize +
                                                  10.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Divider(
                                            color: AppThemes.whiteColor
                                                .withAlpha(50),
                                          ),
                                          Text(
                                            AppStrings.loginDesc,
                                            style: GoogleFonts.poppins(
                                              color: AppThemes.whiteColor,
                                              fontSize:
                                                  AppSizes.paragraphSize - 5.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 0.03.sh,
                                          ),
                                          FormWidget(
                                            controller: loginVM.emailController,
                                            label: AppStrings.emailLabel,
                                            hint: AppStrings.emailHint,
                                            helper: AppStrings.emailHelper,
                                            isObscure: false,
                                          ),
                                          SizedBox(
                                            height: 0.03.sh,
                                          ),
                                          FormWidget(
                                            controller:
                                                loginVM.passwordController,
                                            label: AppStrings.passLabel,
                                            hint: AppStrings.passHint,
                                            helper: AppStrings.passHelper,
                                            isObscure: true,
                                          ),
                                          SizedBox(
                                            height: 0.02.sh,
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: Text(
                                                "Forgot Password?",
                                                style: GoogleFonts.poppins(
                                                  color: AppThemes.whiteColor,
                                                  fontSize:
                                                      AppSizes.paragraphSize -
                                                          5.sp,
                                                  fontWeight: FontWeight.w500,
                                                  textStyle: const TextStyle(
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 0.03.sh,
                                          ),
                                          /* BUTTON WIDGET */
                                          ButtonWidget(
                                            func: loginVM.handleRequestStandard,
                                            child: !loginVM
                                                    .isLoadingStandard.value
                                                ? Text(
                                                    AppStrings.loginTitle,
                                                    style: GoogleFonts.poppins(
                                                      color:
                                                          AppThemes.blackColor,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: AppSizes
                                                          .paragraphSize,
                                                    ),
                                                  )
                                                : SizedBox(
                                                    height: 0.02.sh,
                                                    width: 0.02.sh,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color:
                                                          AppThemes.blackColor,
                                                      strokeWidth: 10.w,
                                                    ),
                                                  ),
                                          ),
                                          SizedBox(
                                            height: 0.02.sh,
                                          ),
                                          Center(
                                            child: Text(
                                              AppStrings.l3,
                                              style: GoogleFonts.poppins(
                                                color: AppThemes.whiteColor,
                                                fontSize:
                                                    AppSizes.paragraphSize -
                                                        5.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 0.01.sh,
                                          ),
                                          ButtonWidget(
                                            func: loginVM.handleRequestGoogle,
                                            child: !loginVM
                                                    .isLoadingGoogle.value
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                        height: 0.03.sh,
                                                        AppPrefixes.googleUrl,
                                                        fit: BoxFit.fitHeight,
                                                      ),
                                                      SizedBox(
                                                        width: 0.02.sw,
                                                      ),
                                                      Text(
                                                        AppStrings.l4,
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: AppThemes
                                                              .blackColor,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: AppSizes
                                                              .paragraphSize,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : SizedBox(
                                                    height: 0.02.sh,
                                                    width: 0.02.sh,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color:
                                                          AppThemes.blackColor,
                                                      strokeWidth: 10.w,
                                                    ),
                                                  ),
                                          ),
                                          SizedBox(
                                            height: 0.02.sh,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                AppStrings.l1,
                                                style: GoogleFonts.poppins(
                                                  color: AppThemes.whiteColor,
                                                  fontSize:
                                                      AppSizes.paragraphSize -
                                                          5.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: loginVM.handleRegister,
                                                child: Text(
                                                  AppStrings.l2,
                                                  style: GoogleFonts.poppins(
                                                    color: AppThemes.whiteColor,
                                                    fontSize:
                                                        AppSizes.paragraphSize -
                                                            5.sp,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 0.02.sh,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                        Obx(() {
                          if (loginVM.isError.value) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              CherryToast.error(
                                backgroundColor:
                                    AppThemes.blackColor.withAlpha(200),
                                shadowColor: Colors.transparent,
                                enableIconAnimation: true,
                                description: Text(
                                  AppStrings.lError,
                                  style: GoogleFonts.poppins(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                  ),
                                ),
                                animationType: AnimationType.fromLeft,
                                animationDuration:
                                    const Duration(milliseconds: 1000),
                                autoDismiss: true,
                              ).show(context);
                            });
                            loginVM.isError.value = false;
                          }
                          return const SizedBox.shrink();
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
