import 'package:ecommerce_app/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EcoHomeCategories extends StatelessWidget {
  const EcoHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: EcoSizes.defaultSpace),
      child: Column(
        children: [
          /// --- Heading
          EcoSectionHeading(
            title: 'Popular Categories',
            showActionButton: false,
            textColor: EcoColors.white,
          ),
          SizedBox(
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
                    onTap: () {},
                  );
                }),
          )
        ],
      ),
    );
  }
}
