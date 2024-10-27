// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:possible/core/extension/number.extention.dart';
import 'package:possible/core/resources/strings.dart';
import 'package:possible/core/theme/colors.dart';
import 'package:possible/core/widgets/search_widget.dart';
import 'package:possible/features/dashboard/app/controllers/search.controller.dart'
    as i;
import 'package:possible/features/dashboard/app/widgets/control_item.dart';
import 'package:possible/features/dashboard/data/constants/constants.dart';
import 'package:possible/features/dashboard/data/models/locationmenu.model.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> with SingleTickerProviderStateMixin {
  final i.SearchController controller = i.SearchController();

  @override
  void initState() {
    super.initState();
    controller.setContext(context);
    controller.importMapStyle();
    controller.animationController = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: contentUI(),
    );
  }

  Widget contentUI() {
    return ValueListenableBuilder(
        valueListenable: controller.mapStyle,
        builder: (context, value, child) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // GoogleMap(
              //   mapType: MapType.normal,
              //   zoomControlsEnabled: false,
              //   initialCameraPosition: const CameraPosition(
              //     target: LatLng(-6.2088, 106.8456),
              //     zoom: 15,
              //   ),
              //   onTap: (x) => controller.onMarkerTap(x),
              //   onMapCreated: (GoogleMapController controller) {},
              //   style: value,
              // ),

              Image.asset('$imagePath/image-map3.png',
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                  fit: BoxFit.cover),

              ...locations.map(
                (e) => Align(
                  alignment: Alignment(e.$2, e.$3),
                  child: locationsUI(e.$1),
                ),
              ),

              // Header and controls
              SafeArea(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      10.height,
                      headerUI(),
                      const Spacer(),
                      controlsUI()
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }

  Widget headerUI() {
    // header section with search
    return Row(
      children: [
        Expanded(
          child: SearchWidget(
            prefixIcon: Iconsax.search_normal,
            controller: controller.searchController,
            hint: "Saint Petersburg",
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
        10.width,
        const ControlItem(
          icon: 'icon-filter',
          opacity: 1,
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
      ],
    );
  }

  Widget controlsUI() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomPopup(
              showArrow: false,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: locationMenuItems.map((e) => menuItemUI(e)).toList(),
              ),
              child: const ControlItem(icon: 'icon-send')
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
            10.height,
            const ControlItem(icon: 'icon-stack')
                .animate(
                  autoPlay: true,
                )
                .scale(
                  duration: 500.milliseconds,
                  curve: Curves.easeInOut,
                  begin: const Offset(0, 0),
                  end: const Offset(1, 1),
                ),
          ],
        ),
        const Spacer(),
        const ControlItem(
          icon: 'icon-menu',
          label: "List of variants",
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
      ],
    );
  }

  Widget menuItemUI(LocationMenuModel model) {
    return GestureDetector(
      onTap: () {
        controller.showText.value = !controller.showText.value;
        Navigator.pop(context);
      },
      child: Container(
        width: 150.w,
        color: Colors.white,
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              model.icon,
              width: 20,
              height: 20,
              color: model.isSelected ? Palette.primary : Colors.grey.shade500,
            ),
            10.width,
            Text(
              model.title,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: model.isSelected
                      ? Palette.primary
                      : Colors.grey.shade500),
            ),
          ],
        ),
      ),
    );
  }

  Widget locationsUI(String location) {
    return ValueListenableBuilder(
      valueListenable: controller.showText,
      builder: (context, value, child) {
        return AnimatedContainer(
            duration: 500.ms,
            padding: const EdgeInsets.all(5),
            height: 40.w,
            width: !value ? 85.w : 35.w,
            decoration: const BoxDecoration(
              color: Palette.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (
                    Widget child,
                    Animation<double> animation,
                  ) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: value
                      ? SvgPicture.asset(
                          '$svgPath/icon-grid.svg',
                          color: Colors.white,
                        )
                      : Text(
                          " $location",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                          ),
                        ).animate(autoPlay: true).fadeIn(
                            delay: 400.ms,
                          ),
                ),
              ],
            ));
      },
    ).animate(autoPlay: true).scale(
          delay: 1.seconds,
          begin: const Offset(0, 0),
          end: const Offset(1, 1),
        );
  }
}
