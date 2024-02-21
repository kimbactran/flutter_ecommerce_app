import 'package:ecommerce_app/common/widgets/chips/choice_chip.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class EcoProductAttribute extends StatelessWidget {
  const EcoProductAttribute({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = EcoHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        // Selected Attribute Pricing & Description
        EcoRoundedContainer(
          backgroundColor: darkMode ? EcoColors.darkerGrey : EcoColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(EcoSizes.defaultSpace),
            child: Column(
              children: [
                // Title, Price and Stock Status
                Row(
                  children: [
                    const EcoSectionHeading(
                      title: 'Variation',
                      showActionButton: false,
                    ),
                    const SizedBox(
                      width: EcoSizes.spaceBtwItems,
                    ),

                    /// -- Attributes
                    Column(
                      // Price
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            EcoProductTitleText(
                              title: 'Price: ',
                              smallSize: true,
                            ),
                            SizedBox(width: EcoSizes.spaceBtwItems),
                            // Actual Price
                            EcoProductPriceText(
                              price: '25',
                              lineThrough: true,
                            ),
                            SizedBox(width: EcoSizes.spaceBtwItems),
                            // Sale Price
                            EcoProductPriceText(
                              price: '20',
                              lineThrough: false,
                            )
                          ],
                        ),

                        /// Stock
                        Row(
                          children: [
                            const EcoProductTitleText(
                              title: 'Stock: ',
                              smallSize: true,
                            ),
                            Text(
                              'In Stock',
                              style: Theme.of(context).textTheme.titleMedium,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                /// Variation Description
                const EcoProductTitleText(
                  title:
                      'This is the Description of the Product and it can go up to max 4 lines',
                  smallSize: true,
                  maxLines: 4,
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: EcoSizes.spaceBtwItems,
        ),

        /// -- Attribute
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const EcoSectionHeading(
              title: 'Colors',
              showActionButton: false,
            ),
            const SizedBox(
              height: EcoSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                EcoChoiceChip(
                  text: 'Green',
                  selected: true,
                  onSelected: (value) {},
                ),
                EcoChoiceChip(
                    text: 'Blue', selected: false, onSelected: (value) {}),
                EcoChoiceChip(
                    text: 'Yellow', selected: false, onSelected: (value) {}),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const EcoSectionHeading(
              title: 'Size',
              showActionButton: false,
            ),
            const SizedBox(
              height: EcoSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                EcoChoiceChip(
                    text: '36', selected: true, onSelected: (value) {}),
                EcoChoiceChip(
                    text: '37', selected: false, onSelected: (value) {}),
                EcoChoiceChip(
                    text: '38', selected: false, onSelected: (value) {}),
              ],
            ),
          ],
        )
      ],
    );
  }
}
