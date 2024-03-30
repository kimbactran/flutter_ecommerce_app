import 'package:ecommerce_app/common/widgets/shimmer/shimmer.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EcoHorizontalProductShimmer extends StatelessWidget {
  const EcoHorizontalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: EcoSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, __) => const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Image
                  EcoShimmerEffect(width: 120, height: 120),
                  SizedBox(
                    width: EcoSizes.spaceBtwItems,
                  ),

                  // Text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: EcoSizes.spaceBtwItems / 2,
                      ),
                      EcoShimmerEffect(width: 120, height: 10),
                      SizedBox(
                        height: EcoSizes.spaceBtwItems / 2,
                      ),
                      EcoShimmerEffect(width: 60, height: 10),
                    ],
                  )
                ],
              ),
          separatorBuilder: (context, index) => const SizedBox(
                width: EcoSizes.spaceBtwItems,
              ),
          itemCount: itemCount),
    );
  }
}
