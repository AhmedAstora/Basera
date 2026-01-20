import 'package:flutter/material.dart';

import 'onboarding_screen.dart';


class SplashScreen extends StatelessWidget {


  void _goNext(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // نستدعي التنقل بعد بناء الشاشة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _goNext(context);
    });
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/Splash.png",
        ),
      ),
    );
  }
}
