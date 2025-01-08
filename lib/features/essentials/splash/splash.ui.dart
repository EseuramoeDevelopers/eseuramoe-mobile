import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/features/essentials/splash/splash.vm.dart';
import 'package:myapp/features/globals/background.widget.dart';
import 'package:myapp/features/globals/button.widget.dart';
import 'package:myapp/static/prefixes/app.prefixes.dart';
import 'package:myapp/static/strings/app.strings.dart';
import 'package:myapp/static/themes/app.sizes.dart';
import 'package:myapp/static/themes/app.themes.dart';

class SplashUi extends StatelessWidget {
  SplashUi({super.key});

  final splashVM = Get.put(
    SplashVM(),
  );

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, result) {
        Navigator.of(context).pop();
      },
      child: Scaffold(
        backgroundColor: AppThemes.blackColor,
        body: Builder(builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
              top: ScreenUtil().statusBarHeight,
              bottom: ScreenUtil().bottomBarHeight,
            ),
            child: Stack(
              children: [
                /* BACKGROUND WIDGETS */
                const BackgroundWidget(),

                /* CONTENT WIDGETS */
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 0.05.sh,
                    horizontal: 0.075.sw,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        width: 0.3.sw,
                        AppPrefixes.logoUrl,
                        fit: BoxFit.fitWidth,
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      Text(
                        AppStrings.s1,
                        style: GoogleFonts.poppins(
                          color: AppThemes.whiteColor,
                          fontSize: AppSizes.titleSize + 10.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        AppStrings.s2,
                        style: GoogleFonts.poppins(
                          color: AppThemes.whiteColor,
                          fontSize: AppSizes.titleSize - 10.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      Text(
                        AppStrings.appStory,
                        style: GoogleFonts.poppins(
                          color: AppThemes.whiteColor,
                          fontSize: AppSizes.paragraphSize - 5.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      ButtonWidget(
                        color: AppThemes.whiteColor,
                        func: splashVM.handleButton,
                        child: Text(
                          AppStrings.sButton,
                          style: GoogleFonts.poppins(
                            color: AppThemes.blackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: AppSizes.paragraphSize,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
