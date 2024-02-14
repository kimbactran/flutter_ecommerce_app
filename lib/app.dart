import 'package:ecommerce_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ecommerce_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const OnBoardingScreen(),
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: EcoAppTheme.lightTheme,
      darkTheme: EcoAppTheme.darkTheme,
    );
  }
}
