import 'package:ecommerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce_app/features/shop/controllers/product/checkout_controller.dart';
import 'package:ecommerce_app/features/shop/models/payment_method_model.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EcoPaymentTile extends StatelessWidget {
  const EcoPaymentTile({
    super.key,
    required this.payment,
  });

  final PaymentMethodModel payment;

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    final darkMode = EcoHelperFunctions.isDarkMode(context);
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        controller.selectedPaymentMethod.value = payment;
        Get.back();
      },
      leading: EcoRoundedContainer(
        width: 60,
        height: 35,
        backgroundColor: darkMode ? EcoColors.light : EcoColors.white,
        padding: const EdgeInsets.all(EcoSizes.sm),
        child: Image(
          image: AssetImage(payment.image),
          fit: BoxFit.contain,
        ),
      ),
      title: Text(
        payment.name,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      trailing: const Icon(Iconsax.arrow_right_34),
    );
  }
}
