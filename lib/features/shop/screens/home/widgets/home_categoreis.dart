import 'package:ecommerce_app/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/screens/sub_category/sub_category.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EcoHomeCategories extends StatelessWidget {
  const EcoHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          SizedBox(
            height: 80,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, item) {
                  return EcoVerticalImageText(
                    image: EcoImages.shoeIcon,
                    title: "Shoes",
                    onTap: () => Get.to(() => SubCategoriesScreen()),
                  );
                }),
          )
        ],
      ),
    );
  }
}
