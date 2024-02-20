import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class EcoCircularImage extends StatelessWidget {
  const EcoCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    required this.imageUrl,
    this.border,
    this.backgroundColor,
    this.overlayColor,
    this.fit = BoxFit.cover,
    this.padding = const EdgeInsets.all(EcoSizes.sm),
    this.isNetworkImage = false,
    this.onPressed,
  });

  final double? width, height;
  final String imageUrl;
  final BoxBorder? border;
  final Color? backgroundColor;
  final Color? overlayColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final darkMode = EcoHelperFunctions.isDarkMode(context);

    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
          color:
              backgroundColor ?? (darkMode ? EcoColors.black : EcoColors.white),
          borderRadius: BorderRadius.circular(100)),
      child: Center(
        child: Image(
          image: isNetworkImage
              ? NetworkImage(imageUrl)
              : AssetImage(imageUrl) as ImageProvider,
          fit: fit,
          color: overlayColor ?? (darkMode ? EcoColors.light : EcoColors.dark),
        ),
      ),
    );
  }
}
