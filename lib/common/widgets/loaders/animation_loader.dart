import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// A widget for displaying an animated loading indicator with optional text and action button
class EcoAnimationLoaderWidget extends StatelessWidget {
  /// Default constructor for the EcoAnimationLoaderWidget.
  ///
  /// Parameters:
  /// - text: The text to be displayed below the animation.
  /// - animation: The path to the Lottie animation file
  /// - showAction: Whether to show an action button below the text.
  /// - actionText: The text to be displayed on the action button
  /// - onActionPressed: Callback function to be executed when the action button on pressed.
  const EcoAnimationLoaderWidget(
      {super.key,
      required this.text,
      required this.animation,
      this.showAction = true,
      this.actionText,
      this.onActionPressed});

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation,
              width: MediaQuery.of(context).size.width *
                  0.8), // Display Lottie animation
          const SizedBox(
            height: EcoSizes.defaultSpace,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: EcoSizes.defaultSpace,
          ),
          showAction
              ? SizedBox(
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    style: OutlinedButton.styleFrom(
                        backgroundColor: EcoColors.dark),
                    child: Text(
                      actionText!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: EcoColors.light),
                    ),
                  ),
                  width: 250,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
