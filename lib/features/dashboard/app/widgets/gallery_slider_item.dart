import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';
import 'package:possible/core/extension/number.extention.dart';
import 'package:possible/core/theme/colors.dart';

class ExpandingContainer extends StatefulWidget {
  final String text;
  final bool smaller;

  const ExpandingContainer(
      {super.key, required this.text, this.smaller = true});

  @override
  State<ExpandingContainer> createState() => _ExpandingContainerState();
}

class _ExpandingContainerState extends State<ExpandingContainer>
    with TickerProviderStateMixin {
  bool _showText = false;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    // add dey of 500 ms
    Future.delayed(4.seconds, () {
      addedDelay();
    });
  }

  void addedDelay() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        setState(
          () {
            _showText = false;
            _isExpanded = true;
          },
        );

        // Wait for container to finish expanding before showing text
        Future.delayed(const Duration(milliseconds: 1200), () {
          if (mounted && _isExpanded) {
            setState(() => _showText = true);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 2000), // Slightly slower expansion
      curve: Curves.easeOutCubic, // Smoother animation curve
      width: _isExpanded ? MediaQuery.of(context).size.width : 46,
      height: 46,
      decoration: BoxDecoration(
        borderRadius: (50).radius,
      ),
      child: GlassContainer(
        border: 0,
        radius: 50,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_isExpanded)
                  Expanded(
                    child: Center(
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                        opacity: _showText ? 1.0 : 0.0,
                        child: Text(
                          widget.text,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Palette.black,
                            fontSize: widget.smaller ? 12.sp : 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: widget.smaller ? 8.r : 10.r,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
