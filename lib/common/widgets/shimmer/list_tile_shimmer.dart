import 'package:ecommerce_app/common/widgets/shimmer/shimmer.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EcoListTileShimmer extends StatelessWidget {
  const EcoListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            EcoShimmerEffect(
              width: 50,
              height: 50,
              radius: 50,
            ),
            SizedBox(
              width: EcoSizes.spaceBtwItems,
            ),
            Column(
              children: [
                EcoShimmerEffect(width: 100, height: 15),
                SizedBox(
                  width: EcoSizes.spaceBtwItems / 2,
                ),
                EcoShimmerEffect(width: 80, height: 12),
              ],
            )
          ],
        )
      ],
    );
  }
}
