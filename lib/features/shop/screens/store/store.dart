import 'package:ecommerce_app/common/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/appbar/tabbar.dart';
import 'package:ecommerce_app/common/widgets/brand/brand_card.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecommerce_app/common/widgets/product/cart/cart_menu_icon.dart';
import 'package:ecommerce_app/common/widgets/shimmer/brand_shimmer.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/controllers/brand_controller.dart';
import 'package:ecommerce_app/features/shop/controllers/category_controller.dart';
import 'package:ecommerce_app/features/shop/screens/brand/all_brands.dart';
import 'package:ecommerce_app/features/shop/screens/brand/brand_products.dart';
import 'package:ecommerce_app/features/shop/screens/cart/cart.dart';
import 'package:ecommerce_app/features/shop/screens/store/widgets/category_tab.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final darkMode = EcoHelperFunctions.isDarkMode(context);
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: EcoAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            EcoCartCounterIcon(
              onPressed: () => Get.to(() => const CartScreen()),
              iconColor: EcoColors.white,
            )
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    backgroundColor:
                        darkMode ? EcoColors.black : EcoColors.white,
                    expandedHeight: 440,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.all(EcoSizes.defaultSpace),
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          /// -- Search bar
                          const SizedBox(
                            height: EcoSizes.spaceBtwItems,
                          ),
                          const EcoSearchContainer(
                            text: 'Search in Store',
                            showBackground: false,
                            padding: EdgeInsets.zero,
                          ),
                          const SizedBox(
                            height: EcoSizes.spaceBtwSections,
                          ),

                          /// -- Featured Brands
                          EcoSectionHeading(
                            title: 'Featured Brands',
                            onPressed: () =>
                                Get.to(() => const AllBrandsScreen()),
                          ),
                          const SizedBox(
                            height: EcoSizes.spaceBtwItems / 1.5,
                          ),

                          Obx(() {
                            if (brandController.isLoading.value)
                              return const EcoBrandsShimmer();

                            if (brandController.featuredBrands.isEmpty) {
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
                                itemCount:
                                    brandController.featuredBrands.length,
                                mainAxisExtent: 80,
                                itemBuilder: (_, index) {
                                  final brand =
                                      brandController.featuredBrands[index];
                                  return EcoBrandCard(
                                    brand: brand,
                                    showBorder: true,
                                    onTap: () => Get.to(() => BrandProducts(
                                          brand: brand,
                                        )),
                                  );
                                });
                          })
                        ],
                      ),
                    ),

                    /// Tabs
                    bottom: EcoTabBar(
                        tabs: categories
                            .map((category) => Tab(
                                  child: Text(category.name),
                                ))
                            .toList()))
              ];
            },
            body: TabBarView(
                children: categories
                    .map((category) => EcoTabCategory(category: category))
                    .toList())),
      ),
    );
  }
}
