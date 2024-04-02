import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/features/personalization/controller/address_controller.dart';
import 'package:ecommerce_app/features/personalization/screens/address/add_new_address.dart';
import 'package:ecommerce_app/features/personalization/screens/address/widgets/single_address.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());

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
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(EcoSizes.defaultSpace),
              child: Obx(
                () => FutureBuilder(
                    key: Key(controller.refreshData.value.toString()),
                    future: controller.getAllUserAddress(),
                    builder: (context, snapshot) {
                      final response =
                          EcoCloudHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot);
                      if (response != null) return response;

                      // Data Found
                      final addresses = snapshot.data!;

                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: addresses.length,
                          itemBuilder: (_, index) {
                            return EcoSingleAddress(
                              address: addresses[index],
                              onTap: () =>
                                  controller.selectedAddress(addresses[index]),
                            );
                          });
                    }),
              )),
        ));
  }
}
