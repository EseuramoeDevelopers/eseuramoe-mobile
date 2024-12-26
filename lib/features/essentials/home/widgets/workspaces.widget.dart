import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/features/globals/card.widget.dart';
import 'package:myapp/static/strings/app.strings.dart';
import 'package:myapp/static/themes/app.sizes.dart';
import 'package:myapp/static/themes/app.themes.dart';

class WorkspacesWidget extends StatelessWidget {
  const WorkspacesWidget({super.key, required this.data});

  final RxList data;

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.d6,
                    style: GoogleFonts.poppins(
                      color: AppThemes.whiteColor,
                      fontSize: AppSizes.paragraphSize - 5.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      AppStrings.d7,
                      style: GoogleFonts.poppins(
                        color: AppThemes.whiteColor,
                        fontSize: AppSizes.paragraphSize - 10.sp,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: AppThemes.whiteColor,
                      ),
                    ),
                  )
                ],
              ),
              Divider(
                color: AppThemes.whiteColor.withAlpha(100),
              ),
              SizedBox(
                width: 0.85.sw,
                height: 0.4.sh,
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 2).w,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final workspaceData = data.value[index];

                    return Column(
                      children: [
                        SizedBox(
                          height: 0.01.sh,
                        ),
                        CardWidget(
                          width: 0.8.sw,
                          height: 0.075.sh,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "${index + 1}",
                                  style: GoogleFonts.poppins(
                                    color: AppThemes.whiteColor,
                                    fontSize: AppSizes.titleSize,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 0.6.sw,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${workspaceData['Name_WD']}",
                                        style: GoogleFonts.poppins(
                                          color: AppThemes.whiteColor,
                                          fontSize:
                                              AppSizes.paragraphSize - 5.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        "${workspaceData['resultCount']} result",
                                        style: GoogleFonts.poppins(
                                          color: AppThemes.whiteColor,
                                          fontSize:
                                              AppSizes.paragraphSize - 10.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 0.01.sh,
                        ),
                      ],
                    );
                  },
                ),
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
