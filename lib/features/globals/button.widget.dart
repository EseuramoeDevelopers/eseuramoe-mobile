import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/static/themes/app.themes.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({
    super.key,
    required this.func,
    required this.child,
  });

  final VoidCallback func;
  final Widget child;

  @override
  State<ButtonWidget> createState() => ButtonWidgetState();
}

class ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.func,
      style: ButtonStyle(
        fixedSize: WidgetStatePropertyAll(
          Size(
            1.sw,
            0.05.sh,
          ),
        ),
        backgroundColor: const WidgetStatePropertyAll(
          AppThemes.whiteColor,
        ),
      ),
      child: widget.child,
    );
  }
}
