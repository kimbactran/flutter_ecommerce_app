import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';

class EcoBillingAmountSection extends StatelessWidget {
  const EcoBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// SubTotal
        Row(
          children: [
            Expanded(
              child: Text(
                'Subtotal',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Text(
              '\$374.3',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        const SizedBox(
          height: EcoSizes.spaceBtwItems / 2,
        ),

        /// Shipping Fee
        Row(
          children: [
            Expanded(
              child: Text(
                'Shipping Fee',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Text(
              '\$374.3',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        const SizedBox(
          height: EcoSizes.spaceBtwItems / 2,
        ),

        /// Tax Fee
        Row(
          children: [
            Expanded(
              child: Text(
                'Tax Fee',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Text(
              '\$374.3',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        const SizedBox(
          height: EcoSizes.spaceBtwItems / 2,
        ),

        /// OrderTotal
        Row(
          children: [
            Expanded(
              child: Text(
                'OrderTotal',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Text(
              '\$374.3',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        const SizedBox(
          height: EcoSizes.spaceBtwItems / 2,
        ),
      ],
    );
  }
}
