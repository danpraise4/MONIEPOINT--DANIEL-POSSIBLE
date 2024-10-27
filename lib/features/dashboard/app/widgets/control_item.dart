import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:possible/core/resources/strings.dart';
import 'package:possible/core/theme/colors.dart';

class ControlItem extends StatefulWidget {
  const ControlItem(
      {super.key, required this.icon, this.label, this.opacity = .5})
      : assert(opacity <= 1.0, "Opacity must be less than or equal to 1.0");

  final String icon;
  final String? label;
  final double opacity;

  @override
  State<ControlItem> createState() => _ControlItemState();
}

class _ControlItemState extends State<ControlItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(widget.opacity),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            '$svgPath/${widget.icon}.svg',
            width: 20.r,
            height: 20.r,
            color: widget.opacity == 1 ? Palette.black : Palette.white,
          ),
          if (widget.label != null) ...[
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.label!,
              style: const TextStyle(color: Palette.white, fontSize: 14),
            ),
          ]
        ],
      ),
    );
  }
}
