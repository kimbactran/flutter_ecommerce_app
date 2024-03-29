import 'package:ecommerce_app/common/widgets/shimmer/shimmer.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EcoBoxesShimmer extends StatelessWidget {
  const EcoBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: EcoShimmerEffect(width: 150, height: 110)),
            SizedBox(
              width: EcoSizes.spaceBtwItems,
            ),
            Expanded(child: EcoShimmerEffect(width: 150, height: 110)),
            SizedBox(
              width: EcoSizes.spaceBtwItems,
            ),
            Expanded(child: EcoShimmerEffect(width: 150, height: 110)),
          ],
        )
      ],
    );
  }
}
