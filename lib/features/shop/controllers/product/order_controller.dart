import 'package:ecommerce_app/common/widgets/loaders/loaders.dart';
import 'package:ecommerce_app/common/widgets/success_screen/success_screen.dart';
import 'package:ecommerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_app/data/repositories/order/order_repository.dart';
import 'package:ecommerce_app/features/personalization/controller/address_controller.dart';
import 'package:ecommerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce_app/features/shop/controllers/product/checkout_controller.dart';
import 'package:ecommerce_app/features/shop/models/order_model.dart';
import 'package:ecommerce_app/navigation_menu.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  // Variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  // Fetch user's order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      EcoLoader.warningSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  // Add methods for order processing
  void processOrder(double totalAmount) async {
    try {
      // Start loader
      EcoFullScreenLoader.openLoadingDialog(
          'Processing your order', EcoImages.docerAnimation);

      // Get user authentication Id
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) return;

      // Add Details
      final order = OrderModel(
          // Generate a unique ID for the order
          id: UniqueKey().toString(),
          userId: userId,
          status: OrderStatus.pending,
          items: cartController.cartItems.toList(),
          paymentMethod: checkoutController.selectedPaymentMethod.value.name,
          address: addressController.selectedAddress.value,
          totalAmount: totalAmount,
          deliveryDate: DateTime.now(),
          orderDate: DateTime.now());
      // Save the order to FireStore
      await orderRepository.saveOrder(order, userId);

      // Update the cart status
      cartController.clearCart();

      // Show Success Screen
      Get.off(() => SuccessScreen(
            image: EcoImages.orderSuccess,
            title: 'Payment Success!',
            subTitle: 'Your item will be shipped soon!',
            onPressed: () => Get.offAll(() => const NavigationMenu()),
          ));
    } catch (e) {
      EcoLoader.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
