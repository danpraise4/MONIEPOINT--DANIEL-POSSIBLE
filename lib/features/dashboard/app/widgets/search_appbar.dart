// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:possible/core/extension/number.extention.dart';
import 'package:possible/core/resources/strings.dart';
import 'package:possible/core/theme/colors.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String location;
  final String? profileImageUrl;

  const SearchAppBar({
    super.key,
    required this.location,
    this.profileImageUrl,
  });

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _SearchAppBarState extends State<SearchAppBar>
    with TickerProviderStateMixin {
  late AnimationController containerController;
  late AnimationController textController;

  @override
  void initState() {
    super.initState();
    containerController = AnimationController(vsync: this);
    textController = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: 0,
      title: Row(
        children: [
          SvgPicture.asset(
            '$svgPath/icon-location.svg',
            width: 17.r,
            height: 17.r,
            color: Palette.secondaryLight,
          ),
          8.width,
          Text(widget.location,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Palette.secondaryLight,
                    fontWeight: FontWeight.w500,
                  ))
              .animate(
                controller: textController,
              )
              .fadeIn(duration: 500.milliseconds, begin: 0,),
        ],
      )
          .animate(
            autoPlay: true,
            controller: containerController,
            onComplete: (controller) {
              textController.animateTo(1,
                  duration: 500.milliseconds, curve: Curves.easeInOut);
            },
          )
          .scale(
            duration: 500.milliseconds,
            curve: Curves.easeInOut,
            begin: const Offset(0, 0),
            end: const Offset(1, 1),
          ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: CircleAvatar(
            radius: 18,
            backgroundColor: Colors.orange,
            backgroundImage: widget.profileImageUrl != null
                ? AssetImage(widget.profileImageUrl!)
                : null,
            child: widget.profileImageUrl == null
                ? Icon(Icons.person, color: Colors.white)
                : null,
          )
              .animate(
                autoPlay: true,
              )
              .scale(
                duration: 500.milliseconds,
                curve: Curves.easeInOut,
                begin: const Offset(0, 0),
                end: const Offset(1, 1),
              ),
        ),
      ],
    );
  }

}
