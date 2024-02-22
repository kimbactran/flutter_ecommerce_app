import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class EcoRatingBarIndicator extends StatelessWidget {
  const EcoRatingBarIndicator({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        rating: rating,
        itemSize: 20,
        unratedColor: EcoColors.grey,
        itemBuilder: (_, __) => const Icon(
              Iconsax.star1,
              color: EcoColors.primary,
            ));
  }
}
