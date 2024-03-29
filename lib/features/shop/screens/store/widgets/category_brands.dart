import 'package:ecommerce_app/common/widgets/brand/brand_showcase.dart';
import 'package:ecommerce_app/common/widgets/shimmer/boxes_shimmer.dart';
import 'package:ecommerce_app/common/widgets/shimmer/list_tile_shimmer.dart';
import 'package:ecommerce_app/features/shop/controllers/brand_controller.dart';
import 'package:ecommerce_app/features/shop/models/category_model.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getBrandsForCategory(category.id),
        builder: (context, snapshot) {
          // Handle Loader, No Record, or Error Message
          const loader = Column(
            children: [
              EcoListTileShimmer(),
              SizedBox(
                height: EcoSizes.spaceBtwItems,
              ),
              EcoBoxesShimmer(),
              SizedBox(
                height: EcoSizes.spaceBtwItems,
              )
            ],
          );

          final widget = EcoCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, loader: loader);
          if (widget != null) {
            return widget;
          }
          // Record Found!
          final brands = snapshot.data!;

          return ListView.builder(
            itemBuilder: (_, index) {
              final brand = brands[index];
              return FutureBuilder(
                  future:
                      controller.getBrandProducts(brandId: brand.id, limit: 3),
                  builder: (context, snapshot) {
                    // Handle loader, No Record, Or Error Message
                    final widget =
                        EcoCloudHelperFunctions.checkMultiRecordState(
                            snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    // Record Found!
                    final products = snapshot.data!;
                    return EcoBrandShowcase(
                      images:
                          products.map((product) => product.thumbnail).toList(),
                      brand: brand,
                    );
                  });
            },
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: brands.length,
          );
        });
  }
}
