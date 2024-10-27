import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;
  
  const GradientBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.white, // Light peachy color
            Color(0xFFFFE0B2), // Slightly darker warm beige
          ],
          stops: [0.2, 1.0],
        ),
      ),
      child: child,
    );
  }
}