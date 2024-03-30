import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/features/personalization/controller/address_controller.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      appBar: EcoAppBar(
          showBackArrow: true,
          title: Text('Add new Address',
              style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(EcoSizes.defaultSpace),
          child: Form(
              key: controller.addressFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.name,
                    validator: (value) =>
                        EcoValidator.validateEmptyText('Name', value),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.user), labelText: 'Name'),
                  ),
                  const SizedBox(
                    height: EcoSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: controller.phoneNumber,
                    validator: EcoValidator.validatePhoneNumber,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.mobile),
                        labelText: 'Phone Number'),
                  ),
                  const SizedBox(
                    height: EcoSizes.spaceBtwInputFields,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller.street,
                          validator: (value) =>
                              EcoValidator.validateEmptyText('Street', value),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.building_31),
                              labelText: 'Street'),
                        ),
                      ),
                      const SizedBox(
                        width: EcoSizes.spaceBtwInputFields,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: controller.postalCode,
                          validator: (value) => EcoValidator.validateEmptyText(
                              'Postal Code', value),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.code),
                              labelText: 'Postal Code'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: EcoSizes.spaceBtwInputFields,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller.city,
                          validator: (value) =>
                              EcoValidator.validateEmptyText('City', value),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.building),
                              labelText: 'City'),
                        ),
                      ),
                      const SizedBox(
                        width: EcoSizes.spaceBtwInputFields,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: controller.state,
                          validator: (value) =>
                              EcoValidator.validateEmptyText('State', value),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.activity),
                              labelText: 'State'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: EcoSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: controller.country,
                    validator: (value) =>
                        EcoValidator.validateEmptyText('Country', value),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.global), labelText: 'Country'),
                  ),
                  const SizedBox(
                    height: EcoSizes.defaultSpace,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: controller.addNewAddress,
                      child: const Text('Save'),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
