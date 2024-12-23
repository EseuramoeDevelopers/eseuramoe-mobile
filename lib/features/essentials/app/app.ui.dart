import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:myapp/features/essentials/app/app.vm.dart';
import 'package:myapp/features/essentials/home/home.ui.dart';
import 'package:myapp/features/essentials/profile/profile.ui.dart';
import 'package:myapp/static/themes/app.themes.dart';

class AppUi extends StatelessWidget {
  AppUi({super.key});

  final appVM = Get.put(AppVM());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Center(
            child: Obx(() {
              switch (appVM.selectedIndex.value) {
                case 0:
                  return HomeUi();
                case 1:
                  return const ProfileUi();
                default:
                  return HomeUi();
              }
            }),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppThemes.blackColor.withAlpha(100),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: AppThemes.whiteColor.withAlpha(5),
                border: Border.all(
                  color: const Color.fromARGB(255, 32, 32, 32),
                  width: 0.5,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 15.0,
                  ),
                  child: GNav(
                    rippleColor: Colors.grey[300]!,
                    hoverColor: Colors.grey[100]!,
                    gap: 8,
                    activeColor: AppThemes.whiteColor,
                    iconSize: 24,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 12.w,
                    ),
                    duration: const Duration(
                      milliseconds: 400,
                    ),
                    tabBackgroundColor: AppThemes.whiteColor.withAlpha(20),
                    color: Colors.grey,
                    tabs: const [
                      GButton(
                        icon: Icons.home_rounded,
                        text: "Home",
                      ),
                      GButton(
                        icon: LineIcons.user,
                        text: "Profile",
                      )
                    ],
                    selectedIndex: appVM.selectedIndex.value,
                    onTabChange: (index) {
                      appVM.handleChangeIndex(index);
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
