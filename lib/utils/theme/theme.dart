import 'package:ecommerce_app/utils/theme/custome_themes/appbar_theme.dart';
import 'package:ecommerce_app/utils/theme/custome_themes/bottom_sheet_theme.dart';
import 'package:ecommerce_app/utils/theme/custome_themes/checkbox_theme.dart';
import 'package:ecommerce_app/utils/theme/custome_themes/chip_theme.dart';
import 'package:ecommerce_app/utils/theme/custome_themes/elevated_button_theme.dart';
import 'package:ecommerce_app/utils/theme/custome_themes/outlined_button_theme.dart';
import 'package:ecommerce_app/utils/theme/custome_themes/text_field_theme.dart';
import 'package:ecommerce_app/utils/theme/custome_themes/text_theme.dart';
import 'package:flutter/material.dart';

class EcoAppTheme {
  EcoAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: EcoTextTheme.lightTextTheme,
    chipTheme: EcoChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: EcoAppBarTheme.lightAppBarTheme,
    checkboxTheme: EcoCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: EcoBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: EcoElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: EcoOutlinedButtonTheme.lightOutlineButtonTheme,
    inputDecorationTheme: EcoTextFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: EcoTextTheme.darkTextTheme,
    chipTheme: EcoChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: EcoAppBarTheme.darkAppBarTheme,
    checkboxTheme: EcoCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: EcoBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: EcoElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: EcoOutlinedButtonTheme.darkOutlineButtonTheme,
    inputDecorationTheme: EcoTextFieldTheme.darkInputDecorationTheme,
  );
}
