import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/device/device_utility.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class EcoTabBar extends StatelessWidget implements PreferredSizeWidget {
  const EcoTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final darkMode = EcoHelperFunctions.isDarkMode(context);
    return Material(
      color: darkMode ? EcoColors.black : EcoColors.white,
      child: TabBar(
          isScrollable: true,
          indicatorColor: EcoColors.primary,
          unselectedLabelColor: EcoColors.darkGrey,
          labelColor: darkMode ? EcoColors.white : EcoColors.primary,
          tabs: tabs),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(EcoDeviceUtils.getAppBarHeight());
}
