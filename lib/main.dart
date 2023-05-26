import 'package:dompet_sha/ui/pages/auth/sign_in_page.dart';
import 'package:dompet_sha/ui/pages/auth/sign_up_page.dart';
import 'package:dompet_sha/ui/pages/auth/sign_up_set_idcard.dart';
import 'package:dompet_sha/ui/pages/auth/sign_up_set_profile.dart';
import 'package:dompet_sha/ui/pages/auth/sign_up_success_page.dart';
import 'package:dompet_sha/ui/pages/home/home_page.dart';
import 'package:dompet_sha/ui/pages/onboarding_page.dart';
import 'package:dompet_sha/ui/pages/splash_screen_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => const SplashScreenPage(),
        '/onboarding' : (context) => const OnboardingPage(),
        '/sign-in' : (context) => const SignInPage(),
        '/sign-up' : (context) => const SignUpPage(),
        '/sign-up-set-profile' : (context) => const SignUpSetProfile(),
        '/sign-up-set-idcard' : (context) => const SignUpSetIdCard(),
        '/sign-up-success' : (context) => const SignUpSuccessPage(),
        '/home' : (context) => const HomePage(),
      },
    );
  }
}
