import 'package:ecommerce_app/common/styles/spacing_styles.dart';
import 'package:ecommerce_app/common/widgets/login_signup/form_divider.dart';
import 'package:ecommerce_app/features/authentication/screens/login/widgets/login_form.dart';
import 'package:ecommerce_app/features/authentication/screens/login/widgets/login_header.dart';
import 'package:ecommerce_app/common/widgets/login_signup/social_button.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_string.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EcoSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            // -- Header: Logo, Title & Sub-Title
            EcoLoginHeader(),
            // -- Form
            EcoLoginForm(),
            // -- Divider
            EcoFormDivider(dividerText: EcoTexts.orSignInWith),
            SizedBox(
              height: EcoSizes.spaceBtwSections,
            ),
            // -- Footer
            EcoSocialButtons(),
          ],
        ),
      ),
    ));
  }
}
