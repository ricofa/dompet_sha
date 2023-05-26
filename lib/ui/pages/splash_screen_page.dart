import 'dart:async';

import 'package:dompet_sha/shared/theme.dart';
import 'package:dompet_sha/ui/pages/onboarding_page.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, '/onboarding', (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: Center(
        child: Container(
          height: 50,
          width: 155,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/img_logo_white.png'))),
        ),
      ),
    );
  }
}
