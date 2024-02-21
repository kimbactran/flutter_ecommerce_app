import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EcoRatingAndShare extends StatelessWidget {
  const EcoRatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Rating
        Row(
          children: [
            const Icon(Iconsax.star5, color: Colors.amber, size: 24),
            const SizedBox(width: EcoSizes.spaceBtwItems / 2),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: '5.0', style: Theme.of(context).textTheme.bodyLarge),
              const TextSpan(text: '(204)')
            ]))
          ],
        ),

        /// Share Button
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              size: EcoSizes.iconMd,
            ))
      ],
    );
  }
}
