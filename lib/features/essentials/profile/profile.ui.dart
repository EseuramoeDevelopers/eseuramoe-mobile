import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/features/globals/background.widget.dart';
import 'package:myapp/static/themes/app.themes.dart';

class ProfileUi extends StatelessWidget {
  const ProfileUi({super.key});

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
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
