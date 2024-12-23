import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/features/globals/card.widget.dart';
import 'package:myapp/static/strings/app.strings.dart';
import 'package:myapp/static/themes/app.sizes.dart';
import 'package:myapp/static/themes/app.themes.dart';

class FeaturesWidget extends StatelessWidget {
  const FeaturesWidget({super.key});

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
          height: 0.12.sh,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20).w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 0.6.sw,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.d2,
                        style: GoogleFonts.poppins(
                          color: AppThemes.whiteColor,
                          fontSize: AppSizes.paragraphSize - 5.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 0.01.sh,
                      ),
                      Text(
                        AppStrings.d3,
                        style: GoogleFonts.poppins(
                          color: AppThemes.whiteColor,
                          fontSize: AppSizes.paragraphSize - 15.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      AppThemes.whiteColor,
                    ),
                  ),
                  icon: Icon(
                    Icons.arrow_outward,
                    color: AppThemes.blackColor,
                    size: AppSizes.paragraphSize,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 0.01.sh,
        ),
        CardWidget(
          width: 0.9.sw,
          height: 0.12.sh,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20).w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 0.6.sw,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.d4,
                        style: GoogleFonts.poppins(
                          color: AppThemes.whiteColor,
                          fontSize: AppSizes.paragraphSize - 5.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 0.01.sh,
                      ),
                      Text(
                        AppStrings.d5,
                        style: GoogleFonts.poppins(
                          color: AppThemes.whiteColor,
                          fontSize: AppSizes.paragraphSize - 15.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      AppThemes.whiteColor,
                    ),
                  ),
                  icon: Icon(
                    Icons.arrow_outward,
                    color: AppThemes.blackColor,
                    size: AppSizes.paragraphSize,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
