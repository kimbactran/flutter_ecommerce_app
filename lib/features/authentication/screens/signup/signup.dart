import 'package:ecommerce_app/common/widgets/login_signup/form_divider.dart';
import 'package:ecommerce_app/common/widgets/login_signup/social_button.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_string.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(EcoSizes.defaultSpace),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // Title
              Text(
                EcoTexts.signUpTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: EcoSizes.spaceBtwSections,
              ),
              // Form
              const EcoSignUpForm(),

              const SizedBox(
                height: EcoSizes.spaceBtwSections,
              ),
              // Divider
              const EcoFormDivider(dividerText: EcoTexts.orSignUpWith),
              const SizedBox(
                height: EcoSizes.spaceBtwSections,
              ),
              // -- Footer
              const EcoSocialButtons(),
            ]),
          ),
        ));
  }
}
