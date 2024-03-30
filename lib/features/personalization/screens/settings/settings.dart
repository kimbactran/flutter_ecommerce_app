import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:ecommerce_app/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:ecommerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_app/features/personalization/screens/address/address.dart';
import 'package:ecommerce_app/features/personalization/screens/profile/profile.dart';
import 'package:ecommerce_app/features/shop/screens/order/order.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// - Header
            EcoPrimaryHeaderContainer(
                child: Column(
              children: [
                EcoAppBar(
                  title: Text(
                    'Account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: EcoColors.white),
                  ),
                ),

                /// User Profile card
                EcoUserProfileTile(
                  onPressed: () => Get.to(() => const ProfileScreen()),
                ),
                const SizedBox(
                  height: EcoSizes.spaceBtwSections,
                ),
              ],
            )),
            //// --- Body
            Padding(
              padding: const EdgeInsets.all(EcoSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Account Sections
                  const EcoSectionHeading(
                    title: 'Account Setting',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: EcoSizes.spaceBtwItems,
                  ),
                  EcoSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subTitle: 'Add, remove products and move to checkout',
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  EcoSettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subTitle: 'In-progress and Completed Orders',
                    onTap: () {},
                  ),
                  EcoSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subTitle: 'Withdraw balance to registered bank account',
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  EcoSettingsMenuTile(
                    icon: Iconsax.bank,
                    title: 'My Account',
                    subTitle: 'List of all the discounted coupons',
                    onTap: () {},
                  ),
                  EcoSettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subTitle: 'Set shopping delivery address',
                    onTap: () {},
                  ),
                  EcoSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notification',
                    subTitle: 'Set any kind of notification message',
                    onTap: () {},
                  ),
                  EcoSettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subTitle: 'Manage data usage and connected accounts',
                    onTap: () {},
                  ),

                  /// -- App Settings
                  const EcoSectionHeading(
                    title: 'App Setting',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: EcoSizes.spaceBtwItems,
                  ),
                  EcoSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subTitle: 'Upload Data to your Cloud Firebase',
                    onTap: () {},
                  ),
                  EcoSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Location',
                    subTitle: 'Set recommendation based on location',
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                      activeColor: EcoColors.primary,
                      inactiveTrackColor: EcoColors.primary.withOpacity(0.6),
                    ),
                  ),
                  EcoSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all ages',
                    trailing: Switch(
                        activeColor: EcoColors.primary,
                        inactiveTrackColor: EcoColors.primary.withOpacity(0.6),
                        value: false,
                        onChanged: (value) {}),
                  ),
                  EcoSettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subTitle: 'Set image quality to be seen',
                    trailing: Switch(
                        value: true,
                        activeColor: EcoColors.primary,
                        inactiveTrackColor: EcoColors.primary.withOpacity(0.6),
                        onChanged: (value) {}),
                  ),

                  /// Logout Button
                  const SizedBox(
                    height: EcoSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: Theme.of(context).outlinedButtonTheme.style,
                      child: const Text('Logout'),
                      onPressed: () =>
                          AuthenticationRepository.instance.logout(),
                    ),
                  ),
                  const SizedBox(
                    height: EcoSizes.spaceBtwSections,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
