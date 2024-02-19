import 'package:ecommerce_app/common/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecommerce_app/common/widgets/image/circular_image.dart';
import 'package:ecommerce_app/common/widgets/product/cart/cart_menu_icon.dart';
import 'package:ecommerce_app/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = EcoHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: EcoAppBar(
        title: Text(
          'Store',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [EcoCartCounterIcon(onPressed: () {})],
      ),
      body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: darkMode ? EcoColors.black : EcoColors.white,
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
                        onPressed: () {},
                      ),
                      const SizedBox(
                        height: EcoSizes.spaceBtwItems / 1.5,
                      ),

                      EcoGridLayout(
                          itemCount: 4,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: EcoRoundedContainer(
                                padding: const EdgeInsets.all(EcoSizes.sm),
                                showBorder: true,
                                backgroundColor: Colors.transparent,
                                child: Row(
                                  children: [
                                    /// -- Icon
                                    const Flexible(
                                      child: EcoCircularImage(
                                        isNetworkImage: false,
                                        imageUrl: EcoImages.clothIcon,
                                        backgroundColor: Colors.transparent,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: EcoSizes.spaceBtwItems / 2,
                                    ),

                                    /// -- Text
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const EcoBrandTitleWithVerifiedIcon(
                                              title: 'Nike'),
                                          Text(
                                            '246 products',
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          })
                    ],
                  ),
                ),
              )
            ];
          },
          body: Container()),
    );
  }
}
