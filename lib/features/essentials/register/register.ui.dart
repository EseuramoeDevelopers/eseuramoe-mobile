import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/features/essentials/register/register.vm.dart';
import 'package:myapp/features/globals/background.widget.dart';
import 'package:myapp/features/globals/button.widget.dart';
import 'package:myapp/features/globals/card.widget.dart';
import 'package:myapp/features/globals/form.widget.dart';
import 'package:myapp/static/prefixes/app.prefixes.dart';
import 'package:myapp/static/strings/app.strings.dart';
import 'package:myapp/static/themes/app.sizes.dart';
import 'package:myapp/static/themes/app.themes.dart';

class RegisterUi extends StatelessWidget {
  RegisterUi({super.key});

  final registerVM = Get.put(RegisterVM());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, result) {
        registerVM.handleBack();
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
                                    height: 0.8.sh,
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
                                            AppStrings.registerTitle,
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
                                            AppStrings.registerDesc,
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
                                            controller:
                                                registerVM.nameController,
                                            label: AppStrings.nameLabel,
                                            hint: AppStrings.nameHint,
                                            helper: AppStrings.nameHelper,
                                            isObscure: false,
                                          ),
                                          SizedBox(
                                            height: 0.03.sh,
                                          ),
                                          FormWidget(
                                            controller:
                                                registerVM.emailController,
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
                                                registerVM.passwordController,
                                            label: AppStrings.passLabel,
                                            hint: AppStrings.passHint,
                                            helper: AppStrings.passHelper,
                                            isObscure: true,
                                          ),
                                          SizedBox(
                                            height: 0.03.sh,
                                          ),
                                          FormWidget(
                                            controller: registerVM
                                                .passwordConfirmController,
                                            label: AppStrings.passConfirmLabel,
                                            hint: AppStrings.passConfirmHint,
                                            helper:
                                                AppStrings.passConfirmHelper,
                                            isObscure: true,
                                          ),
                                          SizedBox(
                                            height: 0.03.sh,
                                          ),
                                          /* BUTTON WIDGET */
                                          ButtonWidget(
                                            func: registerVM
                                                .handleRequestStandard,
                                            child: !registerVM
                                                    .isLoadingStandard.value
                                                ? Text(
                                                    AppStrings.registerTitle,
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
                                              AppStrings.l5,
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
                                            func:
                                                registerVM.handleRequestGoogle,
                                            child: !registerVM
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
                                                AppStrings.l6,
                                                style: GoogleFonts.poppins(
                                                  color: AppThemes.whiteColor,
                                                  fontSize:
                                                      AppSizes.paragraphSize -
                                                          5.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: registerVM.handleLogin,
                                                child: Text(
                                                  AppStrings.l7,
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
                          if (registerVM.isError.value) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              CherryToast.error(
                                backgroundColor:
                                    AppThemes.blackColor.withAlpha(200),
                                shadowColor: Colors.transparent,
                                enableIconAnimation: true,
                                description: Text(
                                  AppStrings.rError,
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
