import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mc_queen_courier/Pages/Splash/splash_screen_mixin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SplashScreenMixin {
  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF001220),
        body: Center(
          child: Image.asset(
            "images/app_icon.png",
            width: 250.w,
            height: 250.h,
          ),
        ),
      ),
    );
  }
}
