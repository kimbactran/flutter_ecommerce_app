import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/image/circular_image.dart';
import 'package:ecommerce_app/common/widgets/shimmer/shimmer.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/personalization/controller/user_controller.dart';
import 'package:ecommerce_app/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:ecommerce_app/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = EcoHelperFunctions.isDarkMode(context);
    final controller = UserController.instance;
    return Scaffold(
      appBar: const EcoAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(EcoSizes.defaultSpace),
          child: Column(children: [
            SizedBox(
              width: double.infinity,
              child: Column(children: [
                // Profile Picture
                Obx(() {
                  final networkImage = controller.user.value.profilePicture;
                  final image = networkImage.isNotEmpty
                      ? networkImage
                      : EcoImages.userDefault;

                  return controller.imageUploading.value
                      ? const EcoShimmerEffect(
                          width: 80,
                          height: 80,
                          radius: 80,
                        )
                      : EcoCircularImage(
                          backgroundColor:
                              darkMode ? EcoColors.light : EcoColors.darkGrey,
                          imageUrl: image,
                          isNetworkImage: networkImage.isNotEmpty,
                          width: 80,
                          height: 80,
                        );
                }),
                TextButton(
                    onPressed: () => controller.uploadUserProfilePicture(),
                    child: const Text('Change Profile Picture'))
              ]),
            ),
            const SizedBox(
              height: EcoSizes.spaceBtwItems / 2,
            ),
            const Divider(),
            const SizedBox(
              height: EcoSizes.spaceBtwItems,
            ),
            const EcoSectionHeading(
              title: 'Profile Infomation',
              showActionButton: false,
            ),
            const SizedBox(
              height: EcoSizes.spaceBtwItems,
            ),
            EcoProfileMenu(
              title: 'Name',
              value: controller.user.value.fullName,
              onPressed: () => Get.to(() => const ChangeName()),
            ),
            const SizedBox(
              height: EcoSizes.spaceBtwItems,
            ),
            EcoProfileMenu(
              title: 'Username',
              value: controller.user.value.username,
              onPressed: () {},
            ),
            const SizedBox(
              height: EcoSizes.spaceBtwItems,
            ),
            const Divider(),
            const SizedBox(
              height: EcoSizes.spaceBtwItems,
            ),
            const SizedBox(
              height: EcoSizes.spaceBtwItems,
            ),
            const EcoSectionHeading(
              title: 'Personal Infomation',
              showActionButton: false,
            ),
            const SizedBox(
              height: EcoSizes.spaceBtwItems,
            ),
            EcoProfileMenu(
              title: 'User ID',
              value: controller.user.value.id,
              onPressed: () {},
              icon: Iconsax.copy,
            ),
            const SizedBox(
              height: EcoSizes.spaceBtwItems,
            ),
            EcoProfileMenu(
              title: 'E-mail',
              value: controller.user.value.email,
              onPressed: () {},
            ),
            const SizedBox(
              height: EcoSizes.spaceBtwItems,
            ),
            EcoProfileMenu(
              title: 'Phone Number',
              value: controller.user.value.phoneNumber,
              onPressed: () {},
            ),
            const SizedBox(
              height: EcoSizes.spaceBtwItems,
            ),
            EcoProfileMenu(
              title: 'Gender',
              value: 'Female',
              onPressed: () {},
            ),
            const SizedBox(
              height: EcoSizes.spaceBtwItems,
            ),
            EcoProfileMenu(
              title: 'Date of Birth',
              value: '5 Oct, 2002',
              onPressed: () {},
            ),
            const SizedBox(
              height: EcoSizes.spaceBtwItems,
            ),
            const Divider(),
            Center(
                child: TextButton(
              onPressed: () => controller.deleteAccountWarningPopup(),
              child: Text('Close Account',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: EcoColors.error)),
            )),
          ]),

          // Details
        ),
      ),
    );
  }
}
