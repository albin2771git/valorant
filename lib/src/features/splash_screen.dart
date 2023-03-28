import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:valorant/src/core/constants/app_colors.dart';

import 'Home/home_page.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
    super.initState();
  }

  final Widget svg = SvgPicture.asset(
    "assets/svg/valorant.svg",
    color: AppColors.primaryColor,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 150, height: 150, child: svg),
          const Text("Valorant",
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 29,
                  fontWeight: FontWeight.bold))
        ],
      )),
    );
  }
}
