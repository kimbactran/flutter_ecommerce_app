import 'package:ecommerce_app/common/widgets/product/cart/add_remove_button.dart';
import 'package:ecommerce_app/common/widgets/product/cart/cart_item.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EcoCartItems extends StatelessWidget {
  const EcoCartItems({super.key, this.showAddRemoveButtons = true});
  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Obx(
      () => ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) => Obx(() {
                final item = controller.cartItems[index];
                return Column(children: [
                  EcoCartItem(
                    cartItem: item,
                  ),
                  if (showAddRemoveButtons)
                    const SizedBox(
                      height: EcoSizes.spaceBtwItems,
                    ),
                  if (showAddRemoveButtons)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Add Remove Buttons
                        if (showAddRemoveButtons)
                          Row(
                            children: [
                              const SizedBox(width: 70),
                              EcoProductQuantityWithAddRemoveButton(
                                quantity: item.quantity,
                                add: () => controller.addOneToCart(item),
                                remove: () =>
                                    controller.removeOneFromCart(item),
                              ),
                            ],
                          ),
                        EcoProductPriceText(
                            price:
                                (item.price * item.quantity).toStringAsFixed(1))
                      ],
                    )
                ]);
              }),
          separatorBuilder: (_, __) => const SizedBox(
                height: EcoSizes.spaceBtwSections,
              ),
          itemCount: controller.cartItems.length),
    );
  }
}
