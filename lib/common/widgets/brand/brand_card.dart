import 'package:ecommerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/image/circular_image.dart';
import 'package:ecommerce_app/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EcoBrandCard extends StatelessWidget {
  const EcoBrandCard({
    super.key,
    required this.showBorder,
  });

  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: EcoRoundedContainer(
        padding: const EdgeInsets.all(EcoSizes.sm),
        showBorder: showBorder,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const EcoBrandTitleWithVerifiedIcon(title: 'Nike'),
                  Text(
                    '246 products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
