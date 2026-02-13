import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../ui/utilitis/app_assets.dart';
import '../../ui/utilitis/app_routs.dart';
import '../../ui/utilitis/providers/theme_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(context, AppRouts.navigationScreen);
    });
  }
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of(context);
    return Scaffold(
      body: Image.asset(
        themeProvider.isLightMode
            ? AppAssets.splashLight
            : AppAssets.splashDark,
      ),
    );
  }
}
