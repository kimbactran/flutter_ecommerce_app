import 'package:ecommerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/product_detail.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EcoProductCardAddToCartButton extends StatelessWidget {
  const EcoProductCardAddToCartButton({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return InkWell(
      onTap: () {
        // If the product have variations then show the product Details for variation selection.
        // Else add product to the cart.
        if (product.productType == ProductType.single.toString()) {
          final cartItem = controller.convertToCartItem(product, 1);
          controller.addOneToCart(cartItem);
        } else {
          Get.to(() => ProductDetailScreen(product: product));
        }
      },
      child: Obx(() {
        final productQuantityInCart =
            controller.getProductQuantityInCart(product.id);
        return Container(
          decoration: BoxDecoration(
              color: productQuantityInCart > 0
                  ? EcoColors.primary
                  : EcoColors.dark,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(EcoSizes.cardRadiusMd),
                  bottomRight: Radius.circular(EcoSizes.productImageRadius))),
          child: SizedBox(
              width: EcoSizes.iconLg * 1.2,
              height: EcoSizes.iconLg * 1.2,
              child: Center(
                  child: productQuantityInCart > 0
                      ? Text(
                          productQuantityInCart.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .apply(color: EcoColors.white),
                        )
                      : const Icon(
                          Iconsax.add,
                          color: EcoColors.white,
                        ))),
        );
      }),
    );
  }
}
