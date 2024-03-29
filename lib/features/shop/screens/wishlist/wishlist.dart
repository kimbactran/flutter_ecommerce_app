import 'package:ecommerce_app/common/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/icons/circular_icon.dart';
import 'package:ecommerce_app/common/widgets/loaders/animation_loader.dart';
import 'package:ecommerce_app/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:ecommerce_app/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:ecommerce_app/features/shop/controllers/product/favourites_controller.dart';
import 'package:ecommerce_app/navigation_menu.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouriteController.instance;
    return Scaffold(
      appBar: EcoAppBar(
        title:
            Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          EcoCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.offAll(() => const NavigationMenu()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(EcoSizes.defaultSpace),
          child: Obx(() => FutureBuilder(
              future: controller.favoriteProducts(),
              builder: (context, snapshot) {
                // Nothing Found Widget
                final emptyWidget = EcoAnimationLoaderWidget(
                  text: 'Whoops! Wishlist is Empty...',
                  animation: EcoImages.pencilAnimation,
                  showAction: true,
                  actionText: 'Let\'s add some',
                  onActionPressed: () =>
                      Get.offAll(() => const NavigationMenu()),
                );
                const loader = EcoVerticalProductShimmer(
                  itemCount: 6,
                );
                final widget = EcoCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot,
                    loader: loader,
                    nothingFound: emptyWidget);
                if (widget != null) return widget;

                // Found Data!
                final product = snapshot.data!;
                return EcoGridLayout(
                    itemCount: product.length,
                    itemBuilder: (_, index) => EcoProductCardVertical(
                          product: product[index],
                        ));
              })),
        ),
      ),
    );
  }
}
