import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:myapp/static/themes/app.themes.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({
    super.key,
    required this.width,
    required this.height,
    required this.child,
  });

  final double width;
  final double height;
  final Widget child;

  @override
  State<CardWidget> createState() => CardWidgetState();
}

class CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: widget.width,
      height: widget.height,
      borderRadius: widget.width * 0.05,
      linearGradient: LinearGradient(
        colors: [
          AppThemes.whiteColor.withAlpha(20),
          AppThemes.whiteColor.withAlpha(75),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      border: 1,
      blur: 20,
      borderGradient: LinearGradient(
        colors: [
          AppThemes.whiteColor.withAlpha(20),
          AppThemes.whiteColor.withAlpha(100),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: widget.height * 0.02,
          horizontal: widget.width * 0.05,
        ),
        child: widget.child,
      ),
    );
  }
}
