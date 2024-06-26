import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/loaders/loaders.dart';
import 'package:ecommerce_app/common/widgets/product/cart/coupon_widget.dart';
import 'package:ecommerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce_app/features/shop/controllers/product/order_controller.dart';
import 'package:ecommerce_app/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:ecommerce_app/utils/helpers/pricing_calculator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final darkMode = EcoHelperFunctions.isDarkMode(context);
    final orderController = Get.put(OrderController());
    final totalAmount =
        EcoPricingCalculator.calculateTotalPrice(subTotal, 'VI');
    return Scaffold(
      appBar: EcoAppBar(
        showBackArrow: true,
        title: Text(
          'Order Reviews',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(EcoSizes.defaultSpace),
          child: Column(children: [
            // Items in cart
            const EcoCartItems(
              showAddRemoveButtons: false,
            ),
            const SizedBox(
              height: EcoSizes.spaceBtwSections,
            ),

            // Coupon TextField
            const EcoCouponCode(),
            const SizedBox(
              height: EcoSizes.spaceBtwSections,
            ),
            // Billing Section
            EcoRoundedContainer(
              padding: const EdgeInsets.all(EcoSizes.md),
              showBorder: true,
              backgroundColor: darkMode ? EcoColors.black : EcoColors.white,
              child: const Column(
                children: [
                  /// Pricing
                  EcoBillingAmountSection(),
                  SizedBox(
                    height: EcoSizes.spaceBtwItems,
                  ),

                  /// Divider
                  Divider(),
                  SizedBox(
                    height: EcoSizes.spaceBtwSections,
                  ),

                  /// Payment Methods
                  EcoBillingPaymentSection(),
                  SizedBox(
                    height: EcoSizes.spaceBtwSections,
                  ),

                  /// Address
                  EcoBillingAddressSection(),
                ],
              ),
            )
          ]),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(EcoSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: subTotal > 0
                ? () => orderController.processOrder(totalAmount)
                : () => EcoLoader.warningSnackBar(
                    title: 'Empty Cart',
                    message: 'Add items in the cart in order to proceed.'),
            child: Text('CheckOut \$$totalAmount')),
      ),
    );
  }
}
