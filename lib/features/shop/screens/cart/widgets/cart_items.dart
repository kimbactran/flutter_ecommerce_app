import 'package:ecommerce_app/common/widgets/product/cart/add_remove_button.dart';
import 'package:ecommerce_app/common/widgets/product/cart/cart_item.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EcoCartItems extends StatelessWidget {
  const EcoCartItems({super.key, this.showAddRemoveButtons = true});
  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) => Column(children: [
              const EcoCartItem(),
              if (showAddRemoveButtons)
                const SizedBox(
                  height: EcoSizes.spaceBtwItems,
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Add Remove Buttons
                  if (showAddRemoveButtons)
                    const Row(
                      children: [
                        SizedBox(width: 70),
                        EcoProductQuantityWithAddRemoveButton(),
                      ],
                    ),
                  const EcoProductPriceText(price: '364')
                ],
              )
            ]),
        separatorBuilder: (_, __) => const SizedBox(
              height: EcoSizes.spaceBtwSections,
            ),
        itemCount: 10);
  }
}
