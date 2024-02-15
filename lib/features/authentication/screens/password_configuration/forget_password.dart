import 'package:ecommerce_app/common/styles/spacing_styles.dart';
import 'package:ecommerce_app/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(EcoSizes.defaultSpace),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            /// Headings
            Text(
              EcoTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: EcoSizes.spaceBtwItems,
            ),
            Text(
              EcoTexts.forgetPasswordSubtitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: EcoSizes.spaceBtwSections * 2,
            ),

            /// Text field
            TextFormField(
              decoration: const InputDecoration(
                  labelText: EcoTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right)),
            ),

            /// Submit Button
            const SizedBox(
              height: EcoSizes.spaceBtwSections,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.off(() => const ResetPassword()),
                  child: const Text(EcoTexts.submit),
                ))
          ]),
        ),
      ),
    );
  }
}
