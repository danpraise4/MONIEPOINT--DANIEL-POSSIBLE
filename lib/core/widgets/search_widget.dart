import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    super.key,
    required this.controller,
    this.onChanged,
    this.hint,
    this.prefixIcon,
  });

  final IconData? prefixIcon;
  final TextEditingController controller;
  final void Function(String value)? onChanged;
  final String? hint;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      child: TextField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: widget.hint,
          prefixIcon: widget.prefixIcon != null
              ? Icon(widget.prefixIcon, color: Colors.grey.shade600 ,size: 20.r,)
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}