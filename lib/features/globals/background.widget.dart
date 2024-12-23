import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/static/prefixes/app.prefixes.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      height: ScreenUtil().screenHeight,
      width: ScreenUtil().screenWidth,
      AppPrefixes.bgUrl,
      fit: BoxFit.fill,
    );
  }
}
