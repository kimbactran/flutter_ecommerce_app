import 'package:ecommerce_app/common/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/brand/brand_card.dart';
import 'package:ecommerce_app/common/widgets/shimmer/brand_shimmer.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/controllers/brand_controller.dart';
import 'package:ecommerce_app/features/shop/screens/brand/brand_products.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
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
            Obx(() {
              if (controller.isLoading.value) return const EcoBrandsShimmer();

              if (controller.allBrands.isEmpty) {
                return Center(
                  child: Text(
                    'No Data Found!',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(color: Colors.white),
                  ),
                );
              }
              return EcoGridLayout(
                  itemCount: controller.allBrands.length,
                  mainAxisExtent: 80,
                  itemBuilder: (_, index) {
                    final brand = controller.allBrands[index];
                    return EcoBrandCard(
                      brand: brand,
                      showBorder: true,
                      onTap: () => Get.to(() => BrandProducts(
                            brand: brand,
                          )),
                    );
                  });
            })
          ]),
        ),
      ),
    );
  }
}
