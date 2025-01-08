import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/features/essentials/app/app.ui.dart';
import 'package:myapp/features/essentials/workspace/workspace.vm.dart';
import 'package:myapp/features/globals/background.widget.dart';
import 'package:myapp/features/globals/card.widget.dart';
import 'package:myapp/static/strings/app.strings.dart';
import 'package:myapp/static/themes/app.sizes.dart';
import 'package:myapp/static/themes/app.themes.dart';

class WorkspaceUi extends StatelessWidget {
  WorkspaceUi({super.key});

  final workspaceVM = Get.put(WorkspacesVM());

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (_, result) {
          Get.to(() => AppUi());
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

                    /* WORKSPACES WIDGETS */
                    RefreshIndicator(
                      onRefresh: workspaceVM.handleReload,
                      backgroundColor: AppThemes.blackColor,
                      color: AppThemes.whiteColor,
                      child: Padding(
                        padding: const EdgeInsets.all(25).w,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: workspaceVM.handleBack,
                                  icon: const Icon(
                                    Icons.chevron_left,
                                    color: AppThemes.whiteColor,
                                  ),
                                ),
                                Text(
                                  AppStrings.d6,
                                  style: GoogleFonts.poppins(
                                    color: AppThemes.whiteColor,
                                    fontSize: 40.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 0.9.sw,
                              height: 0.4.sh,
                              child: workspaceVM.workspaceData.isEmpty
                                  ? Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.folder_open,
                                            size: AppSizes.titleSize + 80.sp,
                                            color: AppThemes.whiteColor,
                                          ),
                                          SizedBox(
                                            height: 0.01.sh,
                                          ),
                                          Text(
                                            AppStrings.d8,
                                            style: GoogleFonts.poppins(
                                              color: AppThemes.whiteColor,
                                              fontSize:
                                                  AppSizes.paragraphSize - 5.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : ListView.builder(
                                      padding: const EdgeInsets.only(top: 2).w,
                                      itemCount:
                                          workspaceVM.workspaceData.length,
                                      itemBuilder: (context, index) {
                                        final workspaceData = workspaceVM
                                            .workspaceData.value[index];

                                        return Column(
                                          children: [
                                            SizedBox(
                                              height: 0.01.sh,
                                            ),
                                            CardWidget(
                                              width: 0.9.sw,
                                              height: 0.075.sh,
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "${index + 1}",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        color: AppThemes
                                                            .whiteColor,
                                                        fontSize:
                                                            AppSizes.titleSize,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 0.7.sw,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${workspaceData['Name_WD']}",
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color: AppThemes
                                                                  .whiteColor,
                                                              fontSize: AppSizes
                                                                      .paragraphSize -
                                                                  5.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          Text(
                                                            "${workspaceData['CreatedAt_WD']}",
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color: AppThemes
                                                                  .whiteColor
                                                                  .withAlpha(
                                                                      100),
                                                              fontSize: AppSizes
                                                                      .paragraphSize -
                                                                  15.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                          Text(
                                                            "${workspaceData['resultCount']} result",
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color: AppThemes
                                                                  .whiteColor,
                                                              fontSize: AppSizes
                                                                      .paragraphSize -
                                                                  10.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /* BUTTON WORKSPACES */
                    Padding(
                      padding: const EdgeInsets.all(25).w,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          onPressed: () {
                            workspaceVM.handleCreate(context);
                          },
                          icon: const Icon(
                            Icons.add,
                            color: AppThemes.blackColor,
                          ),
                          style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            fixedSize: WidgetStatePropertyAll(
                              Size(
                                0.065.sh,
                                0.065.sh,
                              ),
                            ),
                            backgroundColor: const WidgetStatePropertyAll(
                              AppThemes.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
