import 'package:ecommerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce_app/utils/helpers/pricing_calculator.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';

class EcoBillingAmountSection extends StatelessWidget {
  const EcoBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
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
              '\$$subTotal',
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
              '\$${EcoPricingCalculator.calculateShippingCost(subTotal, 'VI')}',
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
              '\$${EcoPricingCalculator.calculateTax(subTotal, 'VI')}',
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
              '\$${EcoPricingCalculator.calculateTotalPrice(subTotal, 'VI')}',
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
