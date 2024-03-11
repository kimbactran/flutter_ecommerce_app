import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/product/cart/cart_menu_icon.dart';
import 'package:ecommerce_app/common/widgets/shimmer/shimmer.dart';
import 'package:ecommerce_app/features/personalization/controller/user_controller.dart';
import 'package:ecommerce_app/features/shop/screens/cart/cart.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EcoHomeAppBar extends StatelessWidget {
  const EcoHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return EcoAppBar(
      title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          EcoTexts.homeAppBarTitle,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .apply(color: EcoColors.grey),
        ),
        Obx(() {
          if (controller.profileLoading.value) {
            // Display a shimmer loader while user profile is being loaded.
            return const EcoShimmerEffect(
              width: 80,
              height: 15,
            );
          } else {
            return Text(
              controller.user.value.fullName,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: EcoColors.white),
            );
          }
        }),
      ]),
      actions: [
        EcoCartCounterIcon(
          onPressed: () => Get.to(() => const CartScreen()),
          iconColor: EcoColors.white,
        )
      ],
    );
  }
}
