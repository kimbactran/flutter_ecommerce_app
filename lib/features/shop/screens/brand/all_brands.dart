import 'package:ecommerce_app/common/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/brand/brand_card.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/screens/brand/brand_products.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EcoAppBar(
        title: Text("Brand", style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(EcoSizes.defaultSpace),
          child: Column(children: [
            /// Heading
            const EcoSectionHeading(
              title: 'Brand',
              showActionButton: false,
            ),
            const SizedBox(
              height: EcoSizes.spaceBtwSections,
            ),

            /// Brand
            EcoGridLayout(
                itemCount: 10,
                mainAxisExtent: 80,
                itemBuilder: (_, item) => EcoBrandCard(
                    showBorder: true,
                    onTap: () => Get.to(() => const BrandProducts())))
          ]),
        ),
      ),
    );
  }
}
