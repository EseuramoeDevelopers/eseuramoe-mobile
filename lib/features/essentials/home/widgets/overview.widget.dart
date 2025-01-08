import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/features/globals/card.widget.dart';
import 'package:myapp/static/strings/app.strings.dart';
import 'package:myapp/static/themes/app.sizes.dart';
import 'package:myapp/static/themes/app.themes.dart';

class OverviewWidget extends StatelessWidget {
  const OverviewWidget({
    super.key,
    required this.resultCount,
    required this.detectedCount,
    required this.modelCount,
  });

  final RxString resultCount;
  final RxString detectedCount;
  final RxString modelCount;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      width: 0.9.sw,
      height: 0.22.sh,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.d1,
            style: GoogleFonts.poppins(
              color: AppThemes.whiteColor,
              fontSize: AppSizes.paragraphSize - 5.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    detectedCount.value,
                    style: GoogleFonts.poppins(
                      color: AppThemes.whiteColor,
                      fontSize: AppSizes.titleSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "images detected",
                    style: GoogleFonts.poppins(
                      color: AppThemes.whiteColor,
                      fontSize: AppSizes.paragraphSize - 15.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              Container(
                height: 0.05.sh,
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: AppThemes.whiteColor,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    resultCount.value,
                    style: GoogleFonts.poppins(
                      color: AppThemes.whiteColor,
                      fontSize: AppSizes.titleSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "label detected",
                    style: GoogleFonts.poppins(
                      color: AppThemes.whiteColor,
                      fontSize: AppSizes.paragraphSize - 15.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              Container(
                height: 0.05.sh,
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: AppThemes.whiteColor,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    modelCount.value,
                    style: GoogleFonts.poppins(
                      color: AppThemes.whiteColor,
                      fontSize: AppSizes.titleSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "models",
                    style: GoogleFonts.poppins(
                      color: AppThemes.whiteColor,
                      fontSize: AppSizes.paragraphSize - 15.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Last updated at: 2024/12/12 21:22:04",
                style: GoogleFonts.poppins(
                  color: AppThemes.whiteColor,
                  fontSize: AppSizes.paragraphSize - 15.sp,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
