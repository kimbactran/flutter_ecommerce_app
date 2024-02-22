import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/product/ratings/rating_bar_indicator.dart';
import 'package:ecommerce_app/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:ecommerce_app/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EcoProductReviewsScreen extends StatelessWidget {
  const EcoProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- AppBar
      appBar: EcoAppBar(
        title: Text(
          'Reviews & Ratings',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(EcoSizes.defaultSpace),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
                'Ratings and reviews are verified and are from people who use the same type of device that you use.'),
            const SizedBox(
              height: EcoSizes.spaceBtwItems,
            ),

            /// Overall Product Ratings
            const EcoOverallProductRating(),
            const EcoRatingBarIndicator(
              rating: 4.8,
            ),
            Text(
              '12,477',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: EcoSizes.spaceBtwSections,
            ),
            // User Reviews List
            const UserReviewCard(),
            const UserReviewCard(),
            const UserReviewCard(),
          ]),
        ),
      ),
    );
  }
}
