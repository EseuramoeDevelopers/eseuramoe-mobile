import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/features/globals/button.widget.dart';
import 'package:myapp/features/globals/form.widget.dart';
import 'package:myapp/static/themes/app.sizes.dart';
import 'package:myapp/static/themes/app.themes.dart';

class WorkspaceCreate extends StatelessWidget {
  WorkspaceCreate({super.key});

  final RxString nameController = "".obs;
  final RxBool isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: screenWidth,
      height: screenHeight * 0.7,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              color: AppThemes.whiteColor.withAlpha(20),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              border: Border.all(
                color: AppThemes.whiteColor.withAlpha(20),
                width: 1,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.01),
                Container(
                  width: screenWidth * 0.075,
                  height: screenHeight * 0.005,
                  decoration: const BoxDecoration(
                    color: AppThemes.whiteColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create New Workspace",
                        style: GoogleFonts.poppins(
                          color: AppThemes.whiteColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Divider(
                        color: AppThemes.whiteColor.withAlpha(50),
                      ),
                      Text(
                        "Please fill name field below to create a new workspace.",
                        style: GoogleFonts.poppins(
                          color: AppThemes.whiteColor.withAlpha(90),
                          fontWeight: FontWeight.w300,
                          fontSize: screenHeight * 0.015,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      FormWidget(
                          controller: nameController,
                          label: "Workspace Name",
                          hint: "e.g : North Sumatra",
                          helper:
                              "Please fill this field with the name of workspace.",
                          isObscure: false),
                      SizedBox(height: screenHeight * 0.03),
                      ButtonWidget(
                        color: AppThemes.whiteColor,
                        func: () {},
                        child: Text(
                          "SUBMIT",
                          style: GoogleFonts.poppins(
                            color: AppThemes.blackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: AppSizes.paragraphSize,
                          ),
                        ),
                      ),
                      ButtonWidget(
                        color: AppThemes.whiteColor,
                        func: () {},
                        child: Text(
                          "CANCEL",
                          style: GoogleFonts.poppins(
                            color: AppThemes.blackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: AppSizes.paragraphSize,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
