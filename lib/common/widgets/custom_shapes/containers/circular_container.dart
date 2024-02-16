import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class EcoCircularContainer extends StatelessWidget {
  const EcoCircularContainer(
      {super.key,
      this.width,
      this.height,
      required this.radius,
      required this.padding,
      this.child,
      this.backgroundColor = EcoColors.white});

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final Widget? child;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
