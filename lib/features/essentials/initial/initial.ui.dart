import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myapp/features/essentials/initial/initial.vm.dart';
import 'package:myapp/features/globals/background.widget.dart';
import 'package:myapp/static/prefixes/app.prefixes.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:myapp/static/themes/app.themes.dart';

class InitialUi extends StatelessWidget {
  InitialUi({super.key});

  final initialVM = Get.put(InitialVM());

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
              padding: EdgeInsets.only(top: ScreenUtil().statusBarHeight),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(),
                        Image.asset(
                          width: 0.4.sw,
                          AppPrefixes.logoUrl,
                          fit: BoxFit.fitWidth,
                        ),
                        SpinKitThreeBounce(
                          color: AppThemes.whiteColor,
                          size: 0.05.sw,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
