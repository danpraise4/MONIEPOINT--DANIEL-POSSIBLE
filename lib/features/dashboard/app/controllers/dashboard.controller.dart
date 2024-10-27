import 'package:flutter/material.dart';

class DashboardController {
  BuildContext? context;


  DashboardController();

  ValueNotifier<int> selectedIndex = ValueNotifier<int>(2);
  PageController pageController = PageController(initialPage: 2);
  String mapStyle = '';

  void setContext(BuildContext context) {
    this.context = context;
  }
  void onPageChange(int index) {
    selectedIndex.value = index;
    pageController.jumpToPage(index);
  }
}
