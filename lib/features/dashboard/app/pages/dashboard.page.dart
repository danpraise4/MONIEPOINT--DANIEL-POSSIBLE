import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:possible/core/theme/colors.dart';
import 'package:possible/core/widgets/bottom_nav.dart';
import 'package:possible/features/dashboard/app/controllers/dashboard.controller.dart';
import 'package:possible/features/dashboard/app/pages/home.page.dart';
import 'package:possible/features/dashboard/app/pages/search.page.dart';
import 'package:possible/features/dashboard/data/constants/constants.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final DashboardController _controller = DashboardController();

  @override
  void initState() {
    super.initState();
    _controller.setContext(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: _controller.pageController,
        onPageChanged: (index) => _controller.onPageChange(index),
        children: const [
          Search(),
          Center(child: Text('Messages')),
          Home(),
          Center(child: Text('Favorites')),
          Center(child: Text('Profile')),
        ],
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _controller.selectedIndex,
        builder: (context, value, child) => AppNavigationBar(
          items: navItems,
          selectedItemColor: Palette.primary,
          unselectedItemColor: Palette.secondaryDark,
          backgroundColor: Palette.secondary,
          selectedIndex: _controller.selectedIndex.value,
          height: 60,
          onTap: (index) => _controller.onPageChange(index),
        ),
      )
          .animate(
            autoPlay: true,
          )
          .move(
            duration: 1000.ms,
            delay: 4.seconds,
            curve: Curves.easeInOut,
            begin: const Offset(0, 100),
            end: const Offset(0, 1),
          ),
    );
  }
}
