import 'package:flutter/material.dart';

class ButtonStyles {
  static ButtonStyle elevatedButtonStyle({
    required Color backgroundColor,
    double? fontSize,
    EdgeInsetsGeometry? padding,
    Size? minimumSize,
    double? elevation,
    BorderRadius? borderRadius,
    Color? borderSideColor,
    double? borderSideWidth,
  }) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      padding: padding,
      textStyle: TextStyle(fontSize: fontSize),
      minimumSize: minimumSize,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.zero,
        side: borderSideColor != null
            ? BorderSide(color: borderSideColor, width: borderSideWidth ?? 0)
            : BorderSide.none,
      ),
    );
  }
}