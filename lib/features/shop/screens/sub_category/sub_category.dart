import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/image/rounded_image.dart';
import 'package:ecommerce_app/common/widgets/product/product_cards/product_card_horizontal.dart';
import 'package:ecommerce_app/common/widgets/shimmer/horizontal_product_shimmer.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/controllers/category_controller.dart';
import 'package:ecommerce_app/features/shop/models/category_model.dart';
import 'package:ecommerce_app/features/shop/screens/all_products/all_products.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: EcoAppBar(
        title: Text(category.name,
            style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.all(EcoSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const EcoRoundedImage(
                imageUrl: EcoImages.promoBanner1,
                width: double.infinity,
                applyImageRadius: true,
              ),
              const SizedBox(
                height: EcoSizes.spaceBtwSections,
              ),

              /// Sub-Categories
              FutureBuilder(
                  future: controller.getSubCategories(category.id),
                  builder: (context, snapshot) {
                    const loader = EcoHorizontalProductShimmer();
                    final widget =
                        EcoCloudHelperFunctions.checkMultiRecordState(
                            snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    // Record found.
                    final subCategories = snapshot.data!;
                    return ListView.builder(
                      itemBuilder: (_, index) {
                        final subCategory = subCategories[index];
                        return FutureBuilder(
                            future: controller.getCategoryProducts(
                                categoryId: subCategory.id),
                            builder: (context, snapshot) {
                              final widget =
                                  EcoCloudHelperFunctions.checkMultiRecordState(
                                      snapshot: snapshot, loader: loader);
                              if (widget != null) return widget;
                              final products = snapshot.data!;
                              return Column(
                                children: [
                                  /// Heading
                                  /// Handle loader, no record, or error message
                                  EcoSectionHeading(
                                    title: subCategory.name,
                                    onPressed: () => Get.to(() => AllProducts(
                                          title: subCategory.name,
                                          featureMethod:
                                              controller.getCategoryProducts(
                                                  categoryId: subCategory.id,
                                                  limit: -1),
                                        )),
                                  ),
                                  const SizedBox(
                                    height: EcoSizes.spaceBtwItems,
                                  ),
                                  SizedBox(
                                    height: 120,
                                    child: ListView.separated(
                                        itemCount: products.length,
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                              width: EcoSizes.defaultSpace,
                                            ),
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return EcoProductCardHorizontal(
                                            product: products[index],
                                          );
                                        }),
                                  ),
                                ],
                              );
                            });
                      },
                      shrinkWrap: true,
                      itemCount: subCategories.length,
                      physics: const NeverScrollableScrollPhysics(),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
