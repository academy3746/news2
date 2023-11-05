import 'package:flutter/material.dart';
import 'package:news2/constants/gaps.dart';
import 'package:news2/constants/sizes.dart';
import 'package:news2/features/screens/main_screen/main_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static String routeName = "/";

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, MainScreen.routeName);
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size20,
          horizontal: Sizes.size20,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/splash.png",
                width: Sizes.size100 + Sizes.size80,
                height: Sizes.size100 + Sizes.size80,
              ),
              Gaps.v32,
              const Text(
                "API뉴스",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Sizes.size40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
