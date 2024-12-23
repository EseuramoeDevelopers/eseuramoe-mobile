import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/features/globals/card.widget.dart';
import 'package:myapp/static/themes/app.sizes.dart';
import 'package:myapp/static/themes/app.themes.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WorkspacesWidget extends StatelessWidget {
  const WorkspacesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 0.01.sh,
        ),
        CardWidget(
          width: 0.9.sw,
          height: 0.5.sh,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 0.02.sh,
              ),
              Text(
                "Your Workspaces",
                style: GoogleFonts.poppins(
                  color: AppThemes.whiteColor,
                  fontSize: AppSizes.paragraphSize - 5.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Divider(
                color: AppThemes.whiteColor.withAlpha(100),
              ),
              Skeletonizer(child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                ],
              ),),
              SizedBox(
                height: 0.01.sh,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 0.05.sh,
        ),
      ],
    );
  }
}
