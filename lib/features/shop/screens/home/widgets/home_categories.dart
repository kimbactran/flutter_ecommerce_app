import 'package:ecommerce_app/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:ecommerce_app/common/widgets/shimmer/category_shimmer.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/controllers/category_controller.dart';
import 'package:ecommerce_app/features/shop/screens/sub_category/sub_category.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EcoHomeCategories extends StatelessWidget {
  const EcoHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Padding(
      padding: const EdgeInsets.only(left: EcoSizes.defaultSpace),
      child: Column(
        children: [
          /// --- Heading
          const EcoSectionHeading(
            title: 'Popular Categories',
            showActionButton: false,
            textColor: EcoColors.white,
          ),
          const SizedBox(
            height: EcoSizes.spaceBtwItems,
          ),

          /// --- Categories
          Obx(() {
            if (categoryController.isLoading.value) {
              return const EcoCategoryShimmer();
            }

            if (categoryController.featuredCategories.isEmpty) {
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
            return SizedBox(
              height: 80,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: categoryController.featuredCategories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    final category =
                        categoryController.featuredCategories[index];
                    return EcoVerticalImageText(
                      isNetworkImage: true,
                      image: category.image,
                      title: category.name,
                      onTap: () =>
                          Get.to(() => SubCategoriesScreen(category: category)),
                    );
                  }),
            );
          })
        ],
      ),
    );
  }
}
