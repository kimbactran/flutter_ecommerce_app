import 'package:ecommerce_app/common/widgets/chips/choice_chip.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/controllers/product/variation_controller.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EcoProductAttribute extends StatelessWidget {
  const EcoProductAttribute({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final darkMode = EcoHelperFunctions.isDarkMode(context);
    return Obx(
      () => Column(
        children: [
          // Selected Attribute Pricing & Description
          // Display variation price and stock when some variation is selected.
          if (controller.selectedVariation.value.id.isNotEmpty)
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
                            Row(
                              children: [
                                const EcoProductTitleText(
                                  title: 'Price: ',
                                  smallSize: true,
                                ),
                                const SizedBox(width: EcoSizes.spaceBtwItems),
                                // Actual Price
                                if (controller
                                        .selectedVariation.value.salePrice >
                                    0)
                                  Text(
                                    '\$${controller.selectedVariation.value.price}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .apply(
                                            decoration:
                                                TextDecoration.lineThrough),
                                  ),
                                const SizedBox(width: EcoSizes.spaceBtwItems),
                                // Sale Price
                                EcoProductPriceText(
                                  price: controller.getVariationPrice(),
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
                                  controller.variationStockStatus.value,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                    /// Variation Description
                    EcoProductTitleText(
                      title:
                          controller.selectedVariation.value.description ?? '',
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
            children: product.productAttributes!
                .map(
                  (attribute) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EcoSectionHeading(
                        title: attribute.name ?? '',
                        showActionButton: false,
                      ),
                      const SizedBox(
                        height: EcoSizes.spaceBtwItems / 2,
                      ),
                      Obx(
                        () => Wrap(
                            spacing: 8,
                            children: attribute.values!.map((attributeValue) {
                              final isSelected = controller
                                      .selectedAttributes[attribute.name] ==
                                  attributeValue;
                              final available = controller
                                  .getAttributesAvailabilityInVariation(
                                      product.productVariations!,
                                      attribute.name!)
                                  .contains(attributeValue);

                              return EcoChoiceChip(
                                  text: attributeValue,
                                  selected: isSelected,
                                  onSelected: available
                                      ? (selected) {
                                          if (selected && available) {
                                            controller.onAttributeSelected(
                                                product,
                                                attribute.name ?? '',
                                                attributeValue);
                                          }
                                        }
                                      : null);
                            }).toList()),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
