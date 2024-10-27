import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possible/core/extension/number.extention.dart';
import 'package:possible/core/resources/strings.dart';
import 'package:possible/core/theme/colors.dart';
import 'package:possible/features/dashboard/app/widgets/animated_text.dart';
import 'package:possible/features/dashboard/app/widgets/gallery_item.dart';
import 'package:possible/features/dashboard/app/widgets/gradient_background.dart';
import 'package:possible/features/dashboard/app/widgets/search_appbar.dart';
import 'package:possible/features/dashboard/data/constants/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: SearchAppBar(
          location: 'Saint petersburg',
          profileImageUrl: '$imagePath/image-pf-1.jpeg'),
      body: contentUI(),
    );
  }

  Widget contentUI() {
    return GradientBackground(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            100.height,
            textHeadUI(),
            25.height,
            numberHeadUI(),
            20.height,
            listUI()
          ],
        ),
      ),
    );
  }

  Widget numberHeadUI() {
    Widget itemUI(title, int value, Color color) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: color,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              10.height,
              AnimatedNumber(
                startValue: 0,
                endValue: value,
                duration: 4.seconds,
                isFloatingPoint: false,
                style: TextStyle(
                  color: color,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'offers',
                style: TextStyle(
                  color: color,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        );

    // end of itemUI
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 160.w,
            height: 160.w,
            decoration: BoxDecoration(
              color: Palette.primary,
              borderRadius: 75.radius,
            ),
            child: itemUI('BUY', 1034, Palette.white),
          )
              .animate(
                autoPlay: true,
              )
              .scale(
                delay: 2.seconds,
                duration: 1500.ms,
                curve: Curves.easeInOut,
                begin: const Offset(0, 0),
                end: const Offset(1, 1),
              ),
          10.width,
          Container(
            width: 160.w,
            height: 160.w,
            decoration: BoxDecoration(
              color: Palette.white,
              borderRadius: 20.radius,
            ),
            child: itemUI('RENT', 2212, Palette.secondaryLight),
          )
              .animate(
                autoPlay: true,
              )
              .scale(
                delay: 2.seconds,
                duration: 1500.ms,
                curve: Curves.easeInOut,
                begin: const Offset(0, 0),
                end: const Offset(1, 1),
              )
        ],
      ),
    );
  }

  Widget textHeadUI() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi, Mirana',
            style: TextStyle(
              color: Palette.secondaryLight,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'let\'s select your\nperfect place',
            style: TextStyle(
              color: Palette.black,
              fontSize: 30.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    )
        .animate(
          autoPlay: true,
        )
        .move(
          duration: 1500.ms,
          delay: 1.seconds,
          curve: Curves.easeInOut,
          begin: const Offset(0, 100),
          end: const Offset(0, 0),
        )
        .fadeIn(
          duration: 1500.ms,
          curve: Curves.easeInOut,
        );
  }

  Widget listUI() {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: const BoxDecoration(
        color: Palette.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          GalleryItem(
            url: galleryUrl1,
            location: 'Gladcova 24, St',
            smaller: false,
          ),
          Row(
            children: [
              Expanded(
                  child: GalleryItem(
                url: galleryUrl2,
                isExtended: true,
                location: 'Tadcova 24, St',
              )),
              Expanded(
                  child: Column(
                children: [
                  GalleryItem(
                    url: galleryUrl3,
                    location: 'Gladcova 24, St',
                  ),
                  GalleryItem(
                    url: galleryUrl3,
                    location: 'Gladcova 24, St',
                  ),
                ],
              ))
            ],
          ),
          20.height,
        ],
      ),
    )
        .animate(
          autoPlay: true,
        )
        .move(
          duration: 1500.ms,
          delay: 2.5.seconds,
          curve: Curves.easeInOut,
          begin: const Offset(0, 100),
          end: const Offset(0, 0),
        )
        .fadeIn(
          duration: 1500.ms,
          curve: Curves.easeInOut,
        );
  }
}
