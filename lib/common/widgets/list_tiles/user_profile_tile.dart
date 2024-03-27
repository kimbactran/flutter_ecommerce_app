import 'package:ecommerce_app/common/widgets/image/circular_image.dart';
import 'package:ecommerce_app/features/personalization/controller/user_controller.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EcoUserProfileTile extends StatelessWidget {
  const EcoUserProfileTile({
    super.key,
    this.title,
    this.subTitle,
    this.imageUrl,
    this.onPressed,
  });

  final String? title, subTitle;
  final String? imageUrl;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: EcoCircularImage(
        isNetworkImage: true,
        imageUrl: controller.user.value.profilePicture,
        width: 50,
        height: 50,
      ),
      title: Text(
        controller.user.value.fullName,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: EcoColors.white),
      ),
      subtitle: Text(
        controller.user.value.email,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .apply(color: EcoColors.white),
      ),
      trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Iconsax.edit,
            color: EcoColors.white,
          )),
    );
  }
}
