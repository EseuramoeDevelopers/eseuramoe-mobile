import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/features/essentials/home/home.vm.dart';
import 'package:myapp/features/essentials/home/widgets/features.widget.dart';
import 'package:myapp/features/essentials/home/widgets/overview.widget.dart';
import 'package:myapp/features/essentials/home/widgets/workspaces.widget.dart';
import 'package:myapp/features/globals/background.widget.dart';
import 'package:myapp/static/prefixes/app.prefixes.dart';
import 'package:myapp/static/themes/app.sizes.dart';
import 'package:myapp/static/themes/app.themes.dart';

class HomeUi extends StatelessWidget {
  HomeUi({super.key});

  final homeVM = Get.put(HomeVM());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, result) {
        Navigator.of(context).pop();
      },
      child: Scaffold(
        backgroundColor: AppThemes.blackColor,
        body: Builder(
          builder: (context) {
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
                  Obx(() {
                    return SizedBox(
                      width: 1.sw,
                      height: 1.sh,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 0.05.sh,
                            horizontal: 0.075.sw,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  /* HEAD PANEL */
                                  Text(
                                    "Halo, ${homeVM.userName.value}!",
                                    style: GoogleFonts.poppins(
                                      color: AppThemes.whiteColor,
                                      fontSize: AppSizes.paragraphSize,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Image.asset(
                                    width: 0.2.sw,
                                    AppPrefixes.logoUrl,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 0.03.sh,
                              ),

                              /* BODY PANEL */
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  /* OVERVIEW WIDGET */
                                  OverviewWidget(
                                    resultCount: homeVM.resultCount,
                                    detectedCount: homeVM.detectedCount,
                                    modelCount: homeVM.modelCount,
                                  ),

                                  /* FEATURES WIDGET */
                                  const FeaturesWidget(),

                                  /* WORKSPACES WIDGET */
                                  WorkspacesWidget(data: homeVM.workspaceData),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
