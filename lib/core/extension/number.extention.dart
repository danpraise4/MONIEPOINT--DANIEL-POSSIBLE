// Extension for number

import 'package:flutter/material.dart';

extension NumberExtension on int {
  Widget get width => SizedBox(width: toDouble());
  Widget get height => SizedBox(height: toDouble());
  BorderRadius get radius => BorderRadius.circular(toDouble());
}
