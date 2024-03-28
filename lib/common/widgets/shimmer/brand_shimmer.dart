import 'package:ecommerce_app/common/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class EcoBrandsShimmer extends StatelessWidget {
  const EcoBrandsShimmer({super.key, this.itemCount = 4});
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return EcoGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const EcoShimmerEffect(width: 300, height: 80),
      mainAxisExtent: 80,
    );
  }
}
