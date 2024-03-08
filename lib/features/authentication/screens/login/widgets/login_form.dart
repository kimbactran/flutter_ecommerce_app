import 'package:ecommerce_app/features/authentication/controllers/login/login_controller.dart';
import 'package:ecommerce_app/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/signup.dart';
import 'package:ecommerce_app/navigation_menu.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_string.dart';
import 'package:ecommerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EcoLoginForm extends StatelessWidget {
  const EcoLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
        key: controller.loginFormKey,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: EcoSizes.spaceBtwSections),
          child: Column(
            children: [
              // Email
              TextFormField(
                controller: controller.email,
                validator: (value) => EcoValidator.validateEmail(value),
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: EcoTexts.email),
              ),
              const SizedBox(
                height: EcoSizes.spaceBtwInputFields,
              ),

              // Password
              Obx(
                () => TextFormField(
                  controller: controller.password,
                  validator: (value) => EcoValidator.validatePassword(value),
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check),
                      labelText: EcoTexts.password,
                      suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value =
                              !controller.hidePassword.value,
                          icon: Icon(controller.hidePassword.value
                              ? Iconsax.eye_slash
                              : Iconsax.eye))),
                ),
              ),
              const SizedBox(
                height: EcoSizes.spaceBtwInputFields / 2,
              ),

              // Remember Me & Forget Password
              Row(
                children: [
                  // Remember Me
                  Row(
                    children: [
                      Obx(() => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value =
                              !controller.rememberMe.value)),
                      const Text(EcoTexts.rememberMe),
                    ],
                  ),

                  // Forget Password
                  TextButton(
                      onPressed: () => Get.to(() => const ForgetPassword()),
                      child: const Text(EcoTexts.forgetPassword)),
                ],
              ),
              const SizedBox(
                height: EcoSizes.spaceBtwSections,
              ),

              // Sign In Button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.emailAndPasswordSignIn,
                      child: const Text(EcoTexts.signIn))),
              const SizedBox(
                height: EcoSizes.spaceBtwSections,
              ),

              // Create Account Button
              SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () => Get.to(() => const SignUpScreen()),
                      child: const Text(EcoTexts.createAccount))),
              const SizedBox(
                height: EcoSizes.spaceBtwSections,
              ),
            ],
          ),
        ));
  }
}
