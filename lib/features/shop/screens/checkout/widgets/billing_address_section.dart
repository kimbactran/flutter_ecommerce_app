import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EcoBillingAddressSection extends StatelessWidget {
  const EcoBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EcoSectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        Text(
          'David',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: EcoSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            const Icon(
              Icons.phone,
              color: Colors.grey,
              size: 16,
            ),
            const SizedBox(
              width: EcoSizes.spaceBtwItems,
            ),
            Text(
              '+92-317-8059525',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        const SizedBox(
          height: EcoSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            const Icon(
              Icons.location_history,
              color: Colors.grey,
              size: 16,
            ),
            const SizedBox(
              width: EcoSizes.spaceBtwItems,
            ),
            Text(
              'South Liana, Maine 87695 USA',
              style: Theme.of(context).textTheme.bodyMedium,
              softWrap: true,
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
