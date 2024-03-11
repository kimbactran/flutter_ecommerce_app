import 'package:ecommerce_app/common/widgets/shimmer/shimmer.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class EcoCategoryShimmer extends StatelessWidget {
  const EcoCategoryShimmer({super.key, this.itemCount = 6});
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (_, __) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image
                EcoShimmerEffect(
                  width: 55,
                  height: 55,
                  radius: 55,
                ),
                SizedBox(
                  height: EcoSizes.spaceBtwItems / 2,
                ),

                // Text
                EcoShimmerEffect(width: 55, height: 8),
              ],
            );
          },
          separatorBuilder: (_, __) => const SizedBox(
                width: EcoSizes.spaceBtwItems,
              ),
          itemCount: itemCount),
    );
  }
}
