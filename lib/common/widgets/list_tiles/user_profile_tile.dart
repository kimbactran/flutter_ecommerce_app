import 'package:ecommerce_app/common/widgets/image/circular_image.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EcoUserProfileTile extends StatelessWidget {
  const EcoUserProfileTile({
    super.key,
    this.title,
    this.subTitle,
    this.imageUrl,
  });

  final String? title, subTitle;
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const EcoCircularImage(
        imageUrl: EcoImages.userDefault,
        width: 50,
        height: 50,
      ),
      title: Text(
        'Kiba Trn',
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: EcoColors.white),
      ),
      subtitle: Text(
        'kimbactrancutebaby@gmail.com',
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .apply(color: EcoColors.white),
      ),
      trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Iconsax.edit,
            color: EcoColors.white,
          )),
    );
  }
}
