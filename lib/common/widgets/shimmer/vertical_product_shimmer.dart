import 'package:ecommerce_app/common/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/shimmer/shimmer.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EcoVerticalProductShimmer extends StatelessWidget {
  final int itemCount;

  const EcoVerticalProductShimmer({super.key, this.itemCount = 4});

  @override
  Widget build(BuildContext context) {
    return EcoGridLayout(
        itemCount: itemCount,
        itemBuilder: (_, __) => const SizedBox(
              width: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image
                  EcoShimmerEffect(width: 180, height: 180),
                  SizedBox(
                    height: EcoSizes.spaceBtwItems,
                  ),

                  // Text
                  EcoShimmerEffect(width: 160, height: 15),
                  SizedBox(
                    height: EcoSizes.spaceBtwItems / 2,
                  ),
                  EcoShimmerEffect(width: 110, height: 15)
                ],
              ),
            ));
  }
}
