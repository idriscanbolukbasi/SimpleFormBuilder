import 'package:flutter/material.dart';

class DropdownDecoration {
  final bool showHint;
  final bool showDescription;
  final bool showInRow;
  final String? hintText;
  final TextStyle? hintStyle;
  final IconData? icon;
  final Color? iconColor;
  final int? itemHeight;
  final Widget? underline;
  final BoxDecoration? decoration;
  final Color? textColor;
  final double width;

  DropdownDecoration({
    this.showHint = false,
    this.showDescription = false,
    this.showInRow = false,
    this.width = 0.9,
    this.hintText,
    this.hintStyle,
    this.icon,
    this.iconColor,
    this.itemHeight,
    this.underline,
    this.decoration,
    this.textColor,
  });
}
