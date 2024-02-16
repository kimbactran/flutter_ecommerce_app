import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecommerce_app/common/widgets/image/rounded_image.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/home_categoreis.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

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
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(EcoSizes.defaultSpace),
              child: EcoPromoSlider(
                banners: [
                  EcoImages.promoBanner1,
                  EcoImages.promoBanner2,
                  EcoImages.promoBanner3,
                  EcoImages.promoBanner3,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
