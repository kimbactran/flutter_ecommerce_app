import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EcoShimmerEffect extends StatelessWidget {
  const EcoShimmerEffect(
      {super.key,
      required this.width,
      this.radius = 15,
      required this.height,
      this.color});

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final darkMode = EcoHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
        baseColor: darkMode ? Colors.grey[850]! : Colors.grey[300]!,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color ?? (darkMode ? EcoColors.darkGrey : EcoColors.white),
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        highlightColor: darkMode ? Colors.grey[700]! : Colors.grey[100]!);
  }
}
