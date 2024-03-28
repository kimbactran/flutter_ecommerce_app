import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/common/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecommerce_app/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:ecommerce_app/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/controllers/product/product_controller.dart';
import 'package:ecommerce_app/features/shop/screens/all_products/all_products.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/home_categoreis.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const EcoPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// -- AppBar
                  EcoHomeAppBar(),
                  SizedBox(
                    height: EcoSizes.spaceBtwSections,
                  ),

                  /// -- SearchBar
                  EcoSearchContainer(
                    text: 'Search in Store',
                  ),
                  SizedBox(
                    height: EcoSizes.spaceBtwSections,
                  ),

                  /// -- Categories
                  EcoHomeCategories(),
                  SizedBox(
                    height: EcoSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(EcoSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Promo Slider
                  const EcoPromoSlider(),
                  const SizedBox(
                    height: EcoSizes.spaceBtwSections,
                  ),

                  /// -- Heading
                  EcoSectionHeading(
                    title: 'Popular Products',
                    onPressed: () => Get.to(() => AllProducts(
                          title: 'Popular Products',
                          featureMethod: controller.fetchAllFeaturedProducts(),
                        )),
                  ),
                  const SizedBox(
                    height: EcoSizes.spaceBtwItems,
                  ),

                  /// -- Popular Products
                  Obx(() {
                    if (controller.isLoading.value)
                      return const EcoVerticalProductShimmer();
                    if (controller.featuredProducts.isEmpty) {
                      return Center(
                        child: Text(
                          'No data Found!',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    }
                    return EcoGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) => EcoProductCardVertical(
                          product: controller.featuredProducts[index]),
                    );
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
