import 'package:ecommerce_app/common/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EcoSortableProduct extends StatelessWidget {
  const EcoSortableProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      /// Dropbox
      DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
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
          onChanged: (value) {}),
      const SizedBox(height: EcoSizes.spaceBtwSections),
      EcoGridLayout(
          itemCount: 10,
          itemBuilder: (_, index) => EcoProductCardVertical(
                product: ProductModel.empty(),
              )),
    ]);
  }
}
