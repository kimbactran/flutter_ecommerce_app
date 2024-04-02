import 'package:ecommerce_app/common/widgets/texts/payment_tile_text.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/models/payment_method_model.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value =
        PaymentMethodModel(image: 'Paypal', name: EcoImages.paypal);
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(EcoSizes.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const EcoSectionHeading(
                      title: 'Select Payment Method',
                      showActionButton: false,
                    ),
                    const SizedBox(
                      height: EcoSizes.spaceBtwSections,
                    ),
                    EcoPaymentTile(
                      payment: PaymentMethodModel(
                          name: 'Paypal', image: EcoImages.paypal),
                    ),
                    const SizedBox(
                      height: EcoSizes.spaceBtwItems / 2,
                    ),
                    EcoPaymentTile(
                      payment: PaymentMethodModel(
                          name: 'Google Pay', image: EcoImages.googlePay),
                    ),
                    const SizedBox(
                      height: EcoSizes.spaceBtwItems / 2,
                    ),
                    EcoPaymentTile(
                      payment: PaymentMethodModel(
                          name: 'Apple Pay', image: EcoImages.applePay),
                    ),
                    const SizedBox(
                      height: EcoSizes.spaceBtwItems / 2,
                    ),
                    EcoPaymentTile(
                      payment: PaymentMethodModel(
                          name: 'VISA', image: EcoImages.visa),
                    ),
                    const SizedBox(
                      height: EcoSizes.spaceBtwItems / 2,
                    ),
                    EcoPaymentTile(
                      payment: PaymentMethodModel(
                          name: 'Master Card', image: EcoImages.mastercard),
                    ),
                    const SizedBox(
                      height: EcoSizes.spaceBtwItems / 2,
                    ),
                    EcoPaymentTile(
                      payment: PaymentMethodModel(
                          name: 'Paytm', image: EcoImages.payTm),
                    ),
                    const SizedBox(
                      height: EcoSizes.spaceBtwItems / 2,
                    ),
                    EcoPaymentTile(
                      payment: PaymentMethodModel(
                          name: 'Paystack', image: EcoImages.payStack),
                    ),
                    const SizedBox(
                      height: EcoSizes.spaceBtwItems / 2,
                    ),
                    EcoPaymentTile(
                      payment: PaymentMethodModel(
                          name: 'Credit Card', image: EcoImages.creditCard),
                    ),
                    const SizedBox(
                      height: EcoSizes.spaceBtwItems / 2,
                    ),
                    EcoPaymentTile(
                      payment: PaymentMethodModel(
                          name: 'Payment On Delivery',
                          image: EcoImages.paymentOnDelivery),
                    ),
                    const SizedBox(
                      height: EcoSizes.spaceBtwItems / 2,
                    ),
                  ],
                ),
              ),
            ));
  }
}
