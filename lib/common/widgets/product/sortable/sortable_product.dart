import 'package:ecommerce_app/common/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:ecommerce_app/features/shop/controllers/product/all_products_controller.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EcoSortableProduct extends StatelessWidget {
  const EcoSortableProduct({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(children: [
      /// Dropbox
      DropdownButtonFormField(
        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
        onChanged: (value) {
          // Sort products based on the selected option
          controller.sortProducts(value!);
        },
        value: controller.selectedSortOption.value,
        items: [
          'Name',
          'Higher Price',
          'Lower Price',
          'Sale',
          'Newest',
          'Popularity'
        ]
            .map((option) =>
                DropdownMenuItem(value: option, child: Text(option)))
            .toList(),
      ),
      const SizedBox(height: EcoSizes.spaceBtwSections),
      Obx(
        () => EcoGridLayout(
            itemCount: controller.products.length,
            itemBuilder: (_, index) => EcoProductCardVertical(
                  product: controller.products[index],
                )),
      ),
    ]);
  }
}
