import 'package:ecommerce_app/bindings/general_bindings.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const Scaffold(
        backgroundColor: EcoColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: EcoAppTheme.lightTheme,
      darkTheme: EcoAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
    );
  }
}
