import 'package:ecommerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/product/ratings/rating_bar_indicator.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = EcoHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(EcoImages.userDefault),
                ),
                const SizedBox(
                  width: EcoSizes.spaceBtwItems,
                ),
                Text(
                  'John Doe',
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),

        const SizedBox(
          height: EcoSizes.spaceBtwItems,
        ),

        /// Review
        Row(
          children: [
            const EcoRatingBarIndicator(
              rating: 4.0,
            ),
            Text(
              '01 Nov, 2023',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),

        const SizedBox(
          height: EcoSizes.spaceBtwItems,
        ),
        const ReadMoreText(
          'If sixes could be handed out in this review section then it would happen, but the universe would probably implode if we started doing that. Each issue of the journal features art, fiction and poetry, as well as articles and interviews, plus a generous review section. ',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: '  show less',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: EcoColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: EcoColors.primary),
          trimCollapsedText: ' show more',
        ),
        const SizedBox(
          height: EcoSizes.spaceBtwItems,
        ),
        // Company Review
        EcoRoundedContainer(
          backgroundColor: darkMode ? EcoColors.darkerGrey : EcoColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(EcoSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Store',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '02 Nov, 2023',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
                const SizedBox(
                  height: EcoSizes.spaceBtwItems,
                ),
                const ReadMoreText(
                  'If sixes could be handed out in this review section then it would happen, but the universe would probably implode if we started doing that. Each issue of the journal features art, fiction and poetry, as well as articles and interviews, plus a generous review section. ',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: '  show less',
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: EcoColors.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: EcoColors.primary),
                  trimCollapsedText: ' show more',
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: EcoSizes.spaceBtwSections,
        )
      ],
    );
  }
}
