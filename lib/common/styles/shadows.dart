import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class EcoShadowStyle {
  static final verticalProductShadow = BoxShadow(
      color: EcoColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));

  static final horizontalProductShadow = BoxShadow(
      color: EcoColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
}
