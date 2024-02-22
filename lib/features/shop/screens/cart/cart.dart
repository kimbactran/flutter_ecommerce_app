import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/product/cart/add_remove_button.dart';
import 'package:ecommerce_app/common/widgets/product/cart/cart_item.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EcoAppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(EcoSizes.defaultSpace),
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (_, index) => const Column(children: [
                  EcoCartItem(),
                  SizedBox(
                    height: EcoSizes.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Add Remove Buttons
                      Row(
                        children: [
                          SizedBox(width: 70),
                          EcoProductQuantityWithAddRemoveButton(),
                        ],
                      ),
                      EcoProductPriceText(price: '364')
                    ],
                  )
                ]),
            separatorBuilder: (_, __) => const SizedBox(
                  height: EcoSizes.spaceBtwSections,
                ),
            itemCount: 10),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(EcoSizes.defaultSpace),
        child: ElevatedButton(onPressed: () {}, child: const Text('CheckOut')),
      ),
    );
  }
}
