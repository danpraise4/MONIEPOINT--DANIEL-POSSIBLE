import 'package:flutter/material.dart';

class NavigartorModel {
  /// An icon to display.
  final String icon;

  /// A primary color to use for this tab.
  final Color? selectedColor;

  /// The color to display when this tab is not selected.
  final Color? unselectedColor;

  NavigartorModel({
    required this.icon,
    this.selectedColor,
    this.unselectedColor,
  });
}
