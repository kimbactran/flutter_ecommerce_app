import 'package:ecommerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce_app/features/personalization/controller/address_controller.dart';
import 'package:ecommerce_app/features/personalization/models/address_model.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EcoSingleAddress extends StatelessWidget {
  const EcoSingleAddress(
      {super.key, required this.address, required this.onTap});

  final AddressModel address;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final darkMode = EcoHelperFunctions.isDarkMode(context);
    final controller = AddressController.instance;
    return Obx(() {
      final selectedAddressId = controller.selectedAddress.value.id;
      final selectedAddress = selectedAddressId == address.id;
      return InkWell(
        onTap: onTap,
        child: EcoRoundedContainer(
          padding: const EdgeInsets.all(EcoSizes.md),
          width: double.infinity,
          showBorder: true,
          backgroundColor: selectedAddress
              ? EcoColors.primary.withOpacity(0.5)
              : Colors.transparent,
          borderColor: selectedAddress
              ? Colors.transparent
              : darkMode
                  ? EcoColors.darkerGrey
                  : EcoColors.grey,
          margin: const EdgeInsets.only(bottom: EcoSizes.spaceBtwItems),
          child: Stack(children: [
            Positioned(
              right: 5,
              top: 0,
              child: Icon(
                selectedAddress ? Iconsax.tick_circle5 : null,
                color: selectedAddress
                    ? darkMode
                        ? EcoColors.light
                        : EcoColors.dark
                    : null,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  address.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: EcoSizes.sm / 2,
                ),
                Text(
                  address.phoneNumber,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: EcoSizes.sm / 2,
                ),
                Text(
                  address.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: EcoSizes.sm / 2,
                )
              ],
            )
          ]),
        ),
      );
    });
  }
}
