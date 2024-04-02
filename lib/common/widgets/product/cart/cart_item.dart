import 'package:ecommerce_app/common/widgets/image/rounded_image.dart';
import 'package:ecommerce_app/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_app/features/shop/models/cart_item_model.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class EcoCartItem extends StatelessWidget {
  const EcoCartItem({
    super.key,
    required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    final darkMode = EcoHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        // Image
        EcoRoundedImage(
          imageUrl: cartItem.image ?? '',
          isNetworkImage: true,
          width: 60,
          height: 60,
          // padding: EdgeInsets.all(EcoSizes.sm),
          backgroundColor: darkMode ? EcoColors.darkGrey : EcoColors.light,
        ),
        const SizedBox(
          width: EcoSizes.spaceBtwItems,
        ),
        // Title, Price & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EcoBrandTitleWithVerifiedIcon(title: cartItem.brandName ?? ''),
              Flexible(
                child: EcoProductTitleText(
                  title: cartItem.title,
                  maxLines: 1,
                ),
              ),

              // Attributes
              Text.rich(TextSpan(
                  children: (cartItem.selectedVariation ?? {})
                      .entries
                      .map((e) => TextSpan(children: [
                            TextSpan(
                              text: ' ${e.key} ',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            TextSpan(
                              text: ' ${e.value} ',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ]))
                      .toList()))
            ],
          ),
        )
      ],
    );
  }
}
