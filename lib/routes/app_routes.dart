import 'package:ecommerce_app/features/authentication/screens/login/login.dart';
import 'package:ecommerce_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ecommerce_app/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/signup.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce_app/features/personalization/screens/profile/profile.dart';
import 'package:ecommerce_app/features/personalization/screens/settings/settings.dart';
import 'package:ecommerce_app/features/shop/screens/address/address.dart';
import 'package:ecommerce_app/features/shop/screens/cart/cart.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/checkout.dart';
import 'package:ecommerce_app/features/shop/screens/home/home.dart';
import 'package:ecommerce_app/features/shop/screens/order/order.dart';
import 'package:ecommerce_app/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:ecommerce_app/features/shop/screens/store/store.dart';
import 'package:ecommerce_app/features/shop/screens/wishlist/wishlist.dart';
import 'package:ecommerce_app/routes/routes.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: EcoRoutes.home, page: () => const HomeScreen()),
    GetPage(name: EcoRoutes.store, page: () => const StoreScreen()),
    GetPage(name: EcoRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: EcoRoutes.settings, page: () => const SettingsScreen()),
    GetPage(
        name: EcoRoutes.productReviews,
        page: () => const EcoProductReviewsScreen()),
    GetPage(name: EcoRoutes.order, page: () => const OrderScreen()),
    GetPage(name: EcoRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: EcoRoutes.cart, page: () => const CartScreen()),
    GetPage(name: EcoRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: EcoRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: EcoRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: EcoRoutes.signUp, page: () => const SignUpScreen()),
    GetPage(name: EcoRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: EcoRoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: EcoRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}
