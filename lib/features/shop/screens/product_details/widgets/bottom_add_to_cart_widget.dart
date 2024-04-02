import 'package:ecommerce_app/common/widgets/icons/circular_icon.dart';
import 'package:ecommerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EcoBottomAddToCart extends StatelessWidget {
  const EcoBottomAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    final darkMode = EcoHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: EcoSizes.defaultSpace,
          vertical: EcoSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: darkMode ? EcoColors.darkerGrey : EcoColors.light,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(EcoSizes.cardRadiusLg),
            topRight: Radius.circular(EcoSizes.cardRadiusLg),
          )),
      child: Obx(
        () => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              EcoCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: EcoColors.darkGrey,
                width: 40,
                height: 40,
                color: EcoColors.white,
                onPressed: () => controller.productQuantityInCart.value < 1
                    ? null
                    : controller.productQuantityInCart.value -= 1,
              ),
              const SizedBox(
                width: EcoSizes.spaceBtwItems,
              ),
              Text(
                controller.productQuantityInCart.value.toString(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                width: EcoSizes.spaceBtwItems,
              ),
              EcoCircularIcon(
                icon: Iconsax.add,
                backgroundColor: EcoColors.black,
                width: 40,
                height: 40,
                color: EcoColors.white,
                onPressed: () => controller.productQuantityInCart.value += 1,
              ),
            ],
          ),
          ElevatedButton(
              onPressed: controller.productQuantityInCart.value < 1
                  ? null
                  : () => controller.addToCart(product),
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(EcoSizes.md),
                  backgroundColor: darkMode ? EcoColors.white : EcoColors.black,
                  side: const BorderSide(color: EcoColors.black)),
              child: const Text('Add to Cart'))
        ]),
      ),
    );
  }
}
