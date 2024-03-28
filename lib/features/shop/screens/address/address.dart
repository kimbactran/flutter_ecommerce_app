import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/features/shop/screens/address/add_new_address.dart';
import 'package:ecommerce_app/features/shop/screens/address/widgets/single_address.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.to(() => const AddNewAddressScreen()),
          backgroundColor: EcoColors.primary,
          child: const Icon(
            Iconsax.add,
            color: EcoColors.white,
          ),
        ),
        appBar: EcoAppBar(
          showBackArrow: true,
          title: Text(
            'Address',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(EcoSizes.defaultSpace),
            child: Column(children: [
              EcoSingleAddress(selectedAddress: true),
              EcoSingleAddress(selectedAddress: false)
            ]),
          ),
        ));
  }
}
