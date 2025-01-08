import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/static/themes/app.sizes.dart';
import 'package:myapp/static/themes/app.themes.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.helper,
    required this.isObscure,
  });

  final RxString controller;
  final String label;
  final String hint;
  final String helper;
  final bool isObscure;

  @override
  State<FormWidget> createState() => FormWidgetState();
}

class FormWidgetState extends State<FormWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 1.sw,
          child: TextField(
            onChanged: (value) {
              widget.controller.value = value;
            },
            obscureText: widget.isObscure,
            cursorColor: AppThemes.whiteColor,
            style: GoogleFonts.poppins(
              color: AppThemes.whiteColor,
              fontSize: AppSizes.paragraphSize - 2.sp,
              fontWeight: FontWeight.w300,
            ),
            decoration: InputDecoration(
              label: Text(widget.label),
              labelStyle: GoogleFonts.poppins(
                color: AppThemes.whiteColor,
                fontSize: AppSizes.paragraphSize - 2.sp,
                fontWeight: FontWeight.w500,
              ),
              hintText: widget.hint,
              hintStyle: GoogleFonts.poppins(
                color: AppThemes.whiteColor.withAlpha(50),
                fontSize: AppSizes.paragraphSize,
                fontWeight: FontWeight.w300,
              ),
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(
                  color: AppThemes.whiteColor.withAlpha(50),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(
                  color: AppThemes.whiteColor.withAlpha(20),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(
                  color: AppThemes.whiteColor,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 0.01.sh),
        Text(
          widget.helper,
          style: GoogleFonts.poppins(
            color: AppThemes.whiteColor,
            fontSize: AppSizes.paragraphSize - 5.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
