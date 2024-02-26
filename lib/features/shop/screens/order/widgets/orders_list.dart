import 'package:ecommerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EcoOrderListItems extends StatelessWidget {
  const EcoOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = EcoHelperFunctions.isDarkMode(context);
    return ListView.separated(
        itemCount: 5,
        separatorBuilder: (_, index) =>
            const SizedBox(height: EcoSizes.spaceBtwItems),
        itemBuilder: (_, index) {
          return EcoRoundedContainer(
            showBorder: true,
            padding: const EdgeInsets.all(EcoSizes.md),
            backgroundColor: darkMode ? EcoColors.dark : EcoColors.light,
            child: Column(children: [
              Row(
                children: [
                  /// 1 - Icon
                  const Icon(Iconsax.ship),
                  const SizedBox(
                    width: EcoSizes.spaceBtwItems / 2,
                  ),

                  /// 2 - Status & Dates
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Processing",
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                              color: EcoColors.primary, fontWeightDelta: 1),
                        ),
                        Text(
                          '07 Nov 2023',
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
                    ),
                  ),

                  /// -- 3 - Icon
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Iconsax.arrow_right_34,
                        size: EcoSizes.iconSm,
                      ))
                ],
              ),
              const SizedBox(
                height: EcoSizes.spaceBtwItems,
              ),

              /// -- Row 2
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        /// 1 - Icon
                        const Icon(Iconsax.tag),
                        const SizedBox(
                          width: EcoSizes.spaceBtwItems / 2,
                        ),

                        /// 2 - Status & Dates
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Order",
                                  style:
                                      Theme.of(context).textTheme.labelMedium),
                              Text(
                                '[#256f2]',
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        /// 1 - Icon
                        const Icon(Iconsax.calendar),
                        const SizedBox(
                          width: EcoSizes.spaceBtwItems / 2,
                        ),

                        /// 2 - Status & Dates
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Shipping date",
                                  style:
                                      Theme.of(context).textTheme.labelMedium),
                              Text(
                                '03 Feb 2023',
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          );
        });
  }
}
