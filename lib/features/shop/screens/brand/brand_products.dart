import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/brand/brand_card.dart';
import 'package:ecommerce_app/common/widgets/product/sortable/sortable_product.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EcoAppBar(
        title: Text(
          'Nike',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(EcoSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Detail
              EcoBrandCard(showBorder: true),
              SizedBox(
                height: EcoSizes.spaceBtwSections,
              ),
              EcoSortableProduct(
                products: [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
