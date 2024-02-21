import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/personalization/screens/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:ecommerce_app/features/personalization/screens/screens/product_details/widgets/product_attributes.dart';
import 'package:ecommerce_app/features/personalization/screens/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:ecommerce_app/features/personalization/screens/screens/product_details/widgets/product_meta_data.dart';
import 'package:ecommerce_app/features/personalization/screens/screens/product_details/widgets/rating_share_widget.dart';
import 'package:ecommerce_app/features/personalization/screens/screens/product_reviews/product_reviews.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const EcoBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 - Product Image Slider
            const EcoProductImageSlider(),

            /// 2 - Product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: EcoSizes.defaultSpace,
                  left: EcoSizes.defaultSpace,
                  bottom: EcoSizes.defaultSpace),
              child: Column(children: [
                /// - Rating & Share
                const EcoRatingAndShare(),

                /// - Price, Title, Stock & Brand
                const EcoProductMetaData(),

                /// Attributes
                const EcoProductAttribute(),
                const SizedBox(
                  height: EcoSizes.spaceBtwSections,
                ),

                /// CheckOut Button
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Checkout')))

                /// Description
                ,
                const EcoSectionHeading(title: 'Description'),
                const SizedBox(
                  height: EcoSizes.spaceBtwItems,
                ),
                const ReadMoreText(
                  'This is a Product description for Acer less vest. There are more things that can be added but i am..',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: ' Show more',
                  trimExpandedText: ' Less',
                  moreStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  lessStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                ),

                /// Reviews
                const Divider(),
                const SizedBox(
                  height: EcoSizes.spaceBtwSections,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const EcoSectionHeading(
                      title: 'Reviews (199)',
                      showActionButton: true,
                    ),
                    IconButton(
                        onPressed: () =>
                            Get.to(() => const EcoProductReviewsScreen()),
                        icon: const Icon(
                          Iconsax.arrow_right_3,
                          size: 18,
                        ))
                  ],
                ),
                const SizedBox(
                  height: EcoSizes.spaceBtwSections,
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
