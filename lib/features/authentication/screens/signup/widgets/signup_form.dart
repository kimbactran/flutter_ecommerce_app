import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EcoSignUpForm extends StatelessWidget {
  const EcoSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        // First & Last Name
        Row(
          children: [
            Expanded(
              child: TextFormField(
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
          expands: false,
          decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct), labelText: EcoTexts.email),
        ),
        // Phone Number
        const SizedBox(
          height: EcoSizes.spaceBtwInputFields,
        ),
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.call), labelText: EcoTexts.phoneNo),
        ),
        // Password
        const SizedBox(
          height: EcoSizes.spaceBtwInputFields,
        ),
        TextFormField(
          decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.password_check),
              labelText: EcoTexts.password,
              suffixIcon: Icon(Iconsax.eye_slash)),
        ),
        const SizedBox(
          height: EcoSizes.spaceBtwInputFields,
        ),

        const SizedBox(
          height: EcoSizes.spaceBtwSections,
        ),
      ],
    ));
  }
}
