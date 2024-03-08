import 'package:ecommerce_app/common/widgets/login_signup/term_policy_check.dart';
import 'package:ecommerce_app/features/authentication/controllers/signup/signup_controller.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_string.dart';
import 'package:ecommerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EcoSignUpForm extends StatelessWidget {
  const EcoSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpController = Get.put(SignupController());
    return Form(
        key: signUpController.signupFormKey,
        child: Column(
          children: [
            // First & Last Name
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: signUpController.firstName,
                    validator: (value) =>
                        EcoValidator.validateEmptyText('First name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                        labelText: EcoTexts.firstName),
                  ),
                ),
                const SizedBox(
                  width: EcoSizes.spaceBtwInputFields,
                ),
                Expanded(
                  child: TextFormField(
                    controller: signUpController.lastName,
                    validator: (value) =>
                        EcoValidator.validateEmptyText('Last name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                        labelText: EcoTexts.lastName),
                  ),
                ),
              ],
            ),
            // Username
            const SizedBox(
              height: EcoSizes.spaceBtwInputFields,
            ),
            TextFormField(
              controller: signUpController.username,
              validator: (value) =>
                  EcoValidator.validateEmptyText('Username', value),
              expands: false,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.user_edit),
                  labelText: EcoTexts.username),
            ),
            // Email
            const SizedBox(
              height: EcoSizes.spaceBtwInputFields,
            ),
            TextFormField(
              controller: signUpController.email,
              validator: (value) => EcoValidator.validateEmail(value),
              expands: false,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct), labelText: EcoTexts.email),
            ),
            // Phone Number
            const SizedBox(
              height: EcoSizes.spaceBtwInputFields,
            ),
            TextFormField(
              controller: signUpController.phoneNumber,
              validator: (value) => EcoValidator.validatePhoneNumber(value),
              expands: false,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.call), labelText: EcoTexts.phoneNo),
            ),
            // Password
            const SizedBox(
              height: EcoSizes.spaceBtwInputFields,
            ),
            Obx(
              () => TextFormField(
                controller: signUpController.password,
                validator: (value) => EcoValidator.validatePassword(value),
                obscureText: signUpController.hidePassword.value,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.password_check),
                    labelText: EcoTexts.password,
                    suffixIcon: IconButton(
                        onPressed: () => signUpController.hidePassword.value =
                            !signUpController.hidePassword.value,
                        icon: Icon(signUpController.hidePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye))),
              ),
            ),
            const SizedBox(
              height: EcoSizes.spaceBtwInputFields,
            ),

            const SizedBox(
              height: EcoSizes.spaceBtwSections,
            ),
            // Term&Condition checkout
            const EcoTermsAndConditionCheckbox(),
            const SizedBox(
              height: EcoSizes.spaceBtwSections,
            ),
            // Sign Up Button
            // Create Account Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => signUpController.signup(),
                    child: const Text(EcoTexts.createAccount))),
          ],
        ));
  }
}
