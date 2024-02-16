import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/product/cart/cart_menu_icon.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/text_string.dart';
import 'package:flutter/material.dart';

class EcoHomeAppBar extends StatelessWidget {
  const EcoHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return EcoAppBar(
      title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          EcoTexts.homeAppBarTitle,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .apply(color: EcoColors.grey),
        ),
        Text(
          EcoTexts.homeAppBarSubTitle,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: EcoColors.white),
        ),
      ]),
      actions: [
        EcoCartCounterIcon(
          onPressed: () {},
          iconColor: EcoColors.white,
        )
      ],
    );
  }
}
