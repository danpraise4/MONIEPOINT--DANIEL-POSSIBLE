import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possible/core/theme/theme.dart';
import 'package:possible/features/dashboard/app/pages/dashboard.page.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    // Tool bar color
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return ScreenUtilInit(
        ensureScreenSize: true,
        designSize: const Size(375, 810),
        builder: (context, child) {
          return MaterialApp(
            title: 'Take Home Test',
            debugShowCheckedModeBanner: false,
            theme: themeData(context),
            home: const Dashboard(),
          );
        });
    ;
  }
}
