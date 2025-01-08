import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({
    super.key,
    required this.func,
    required this.child,
    required this.color,
  });

  final VoidCallback func;
  final Widget child;
  final Color color;

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
        backgroundColor: WidgetStatePropertyAll(
          widget.color,
        ),
      ),
      child: widget.child,
    );
  }
}
