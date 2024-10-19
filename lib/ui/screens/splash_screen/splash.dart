import 'package:flutter/material.dart';
import 'package:islami_app/ui/screens/home_screen/home.dart';
import '../../../utils/assets.dart';

class Splash extends StatelessWidget {
  static String routeName = "splash";
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, Home.routeName);
    });
    return Scaffold(
      body: Image.asset(AssetsApp.splash),
    );
  }
}