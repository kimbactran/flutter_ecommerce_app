import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EcoLoginForm extends StatelessWidget {
  const EcoLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: EcoSizes.spaceBtwSections),
      child: Column(
        children: [
          // Email
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: EcoTexts.email),
          ),
          const SizedBox(
            height: EcoSizes.spaceBtwInputFields,
          ),

          // Password
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: EcoTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash)),
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
                  Checkbox(value: true, onChanged: (value) {}),
                  const Text(EcoTexts.rememberMe),
                ],
              ),

              // Forget Password
              TextButton(
                  onPressed: () {}, child: const Text(EcoTexts.forgetPassword)),
            ],
          ),
          const SizedBox(
            height: EcoSizes.spaceBtwSections,
          ),

          // Sign In Button
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {}, child: const Text(EcoTexts.signIn))),
          const SizedBox(
            height: EcoSizes.spaceBtwSections,
          ),

          // Create Account Button
          SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () {}, child: const Text(EcoTexts.createAccount))),
          const SizedBox(
            height: EcoSizes.spaceBtwSections,
          ),
        ],
      ),
    ));
  }
}
