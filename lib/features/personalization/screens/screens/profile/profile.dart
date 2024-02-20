import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/image/circular_image.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/personalization/screens/screens/profile/widgets/profile_menu.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = EcoHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: EcoAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(EcoSizes.defaultSpace),
          child: Column(children: [
            SizedBox(
              width: double.infinity,
              child: Column(children: [
                // Profile Picture
                EcoCircularImage(
                  backgroundColor:
                      darkMode ? EcoColors.light : EcoColors.darkGrey,
                  imageUrl: EcoImages.userDefault,
                  width: 80,
                  height: 80,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text('Change Profile Picture'))
              ]),
            ),
            const SizedBox(
              height: EcoSizes.spaceBtwItems / 2,
            ),
            Divider(),
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
              value: 'Kiba Trn',
              onPressed: () {},
            ),
            const SizedBox(
              height: EcoSizes.spaceBtwItems,
            ),
            EcoProfileMenu(
              title: 'Username',
              value: 'kiba_trn',
              onPressed: () {},
            ),
            const SizedBox(
              height: EcoSizes.spaceBtwItems,
            ),
            Divider(),
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
              value: '048474',
              onPressed: () {},
            ),
            const SizedBox(
              height: EcoSizes.spaceBtwItems,
            ),
            EcoProfileMenu(
              title: 'E-mail',
              value: 'kimbactrancutebaby@gmail.com',
              onPressed: () {},
            ),
            const SizedBox(
              height: EcoSizes.spaceBtwItems,
            ),
            EcoProfileMenu(
              title: 'Phone Number',
              value: '0399523244',
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
            Divider(),
            Center(
                child: TextButton(
              onPressed: () {},
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
