import 'package:ecommerce_app/common/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/brand/brand_showcase.dart';
import 'package:ecommerce_app/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:ecommerce_app/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/controllers/category_controller.dart';
import 'package:ecommerce_app/features/shop/models/category_model.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/features/shop/screens/all_products/all_products.dart';
import 'package:ecommerce_app/features/shop/screens/store/widgets/category_brands.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class EcoTabCategory extends StatelessWidget {
  const EcoTabCategory({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(EcoSizes.defaultSpace),
            child: Column(children: [
              /// -- Brands
              CategoryBrands(category: category),
              const SizedBox(
                height: EcoSizes.spaceBtwItems,
              ),
              FutureBuilder(
                  future:
                      controller.getCategoryProducts(categoryId: category.id),
                  builder: (context, snapshot) {
                    final widget =
                        EcoCloudHelperFunctions.checkMultiRecordState(
                            snapshot: snapshot,
                            loader: const EcoVerticalProductShimmer());
                    if (widget != null) {
                      return widget;
                    }

                    final products = snapshot.data!;
                    return Column(
                      children: [
                        EcoSectionHeading(
                          title: 'You might like',
                          onPressed: () => Get.to(AllProducts(
                            title: category.name,
                            featureMethod: controller.getCategoryProducts(
                                categoryId: category.id, limit: -1),
                          )),
                        ),
                        const SizedBox(height: EcoSizes.spaceBtwItems),
                        EcoGridLayout(
                          itemCount: products.length,
                          itemBuilder: (_, index) => EcoProductCardVertical(
                            product: products[index],
                          ),
                        )
                      ],
                    );
                  }),

              /// -- Products
            ]),
          ),
        ]);
  }
}
