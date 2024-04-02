import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

/// A widget for displaying an animated loading indicator with optional text and action button
class EcoCircularLoading extends StatelessWidget {
  /// Default constructor for the EcoCircularLoading.
  ///
  /// Parameters:
  /// - text: The text to be displayed below the animation.
  /// - animation: The path to the Lottie animation file
  /// - showAction: Whether to show an action button below the text.
  /// - actionText: The text to be displayed on the action button
  /// - onActionPressed: Callback function to be executed when the action button on pressed.
  const EcoCircularLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Image(image: AssetImage(EcoImages.loadingCircular)));
  }
}
