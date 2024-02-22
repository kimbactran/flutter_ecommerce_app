import 'package:ecommerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class EcoCouponCode extends StatelessWidget {
  const EcoCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = EcoHelperFunctions.isDarkMode(context);
    return EcoRoundedContainer(
      showBorder: true,
      backgroundColor: darkMode ? EcoColors.dark : EcoColors.white,
      padding: EdgeInsets.only(
          top: EcoSizes.sm,
          bottom: EcoSizes.sm,
          right: EcoSizes.sm,
          left: EcoSizes.md),
      child: Row(
        children: [
          Flexible(
              child: TextFormField(
            decoration: InputDecoration(
                hintText: 'Have a promo code? Enter here!',
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none),
          )),
          // Button
          SizedBox(
              width: 80,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: darkMode
                          ? EcoColors.white.withOpacity(0.5)
                          : EcoColors.light.withOpacity(0.5),
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      side: BorderSide(color: Colors.grey.withOpacity(0.1))),
                  onPressed: () {},
                  child: Text(
                    'Apply',
                    style: Theme.of(context).textTheme.bodySmall,
                  )))
        ],
      ),
    );
  }
}
