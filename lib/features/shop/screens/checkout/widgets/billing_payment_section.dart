import 'package:ecommerce_app/common/widgets/texts/payment_tile_text.dart';
import 'package:ecommerce_app/features/shop/controllers/product/checkout_controller.dart';
import 'package:ecommerce_app/features/shop/models/payment_method_model.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:get/get.dart';

class EcoBillingPaymentSection extends StatelessWidget {
  const EcoBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    return Column(
      children: [
        EcoSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          onPressed: () => controller.selectPaymentMethod(context),
        ),
        const SizedBox(
          height: EcoSizes.spaceBtwSections,
        ),
        Obx(
          () => EcoPaymentTile(
            payment: PaymentMethodModel(
                name: controller.selectedPaymentMethod.value.name,
                image: controller.selectedPaymentMethod.value.image),
          ),
        ),
      ],
    );
  }
}
