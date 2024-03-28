import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/product/sortable/sortable_product.dart';
import 'package:ecommerce_app/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:ecommerce_app/features/shop/controllers/product/all_products_controller.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProducts extends StatelessWidget {
  const AllProducts(
      {super.key, required this.title, this.query, this.featureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? featureMethod;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar: EcoAppBar(
        title: Text('Popular Products',
            style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(EcoSizes.defaultSpace),
          child: FutureBuilder(
              future: featureMethod ?? controller.fetchProductsByQuery(query),
              builder: (context, snapshot) {
                const loader = EcoVerticalProductShimmer();
                final widget = EcoCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot, loader: loader);

                // Return appropriate widget based ib snapshot state
                if (widget != null) return widget;

                // Product found!
                final products = snapshot.data!;

                return EcoSortableProduct(
                  products: products,
                );
              }),
        ),
      ),
    );
  }
}
