import 'package:ecommerce_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecommerce_app/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/home_categoreis.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/device/device_utility.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            EcoPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// -- AppBar
                  EcoHomeAppBar(),
                  SizedBox(
                    height: EcoSizes.spaceBtwSections,
                  ),

                  /// -- SearchBar
                  EcoSearchContainer(
                    text: 'Search in Store',
                  ),
                  SizedBox(
                    height: EcoSizes.spaceBtwSections,
                  ),

                  /// -- Categories
                  EcoHomeCategories()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
