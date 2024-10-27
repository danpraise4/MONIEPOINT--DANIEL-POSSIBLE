// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:possible/core/theme/colors.dart';
import 'package:possible/features/dashboard/data/models/navitem.model.dart';

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({
    super.key,
    required this.items,
    required this.onTap,
    required this.selectedItemColor,
    required this.unselectedItemColor,
    required this.backgroundColor,
    required this.height,
    required this.selectedIndex,
  });

  final List<NavigartorModel> items;
  final Function(int) onTap;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final Color backgroundColor;
  final double height;
  final int selectedIndex;
  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(100),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 7),
      height: widget.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: widget.items.map((e) => _item(e)).toList(),
      ),
    );
  }

  Widget _item(NavigartorModel item) {
    return GestureDetector(
      onTap: () => widget.onTap(widget.items.indexOf(item)),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding:  EdgeInsets.all(isSelected(item) ? 13 : 12),
        decoration: BoxDecoration(
          color: isSelected(item) ? widget.selectedItemColor : widget.unselectedItemColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: SvgPicture.asset(item.icon, color: Palette.white, width: 20, height: 20),
      ),
    );
  }

  bool isSelected(NavigartorModel item) {
    return widget.items.indexOf(item) == widget.selectedIndex;
  }
}
