import 'package:flutter/material.dart';
import 'package:sickler/screens/global_components/global_components.dart';

import '../../core/core.dart';

class BasicInfoScreen extends StatefulWidget {
  const BasicInfoScreen({super.key});

  @override
  State<BasicInfoScreen> createState() => _BasicInfoScreenState();
}

class _BasicInfoScreenState extends State<BasicInfoScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    ageController.dispose();
    addressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SicklerAppBar(pageTitle: "Tell us more\nabout you"),
                  Text("Full Names", style: theme.textTheme.bodyMedium),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    decoration: SicklerInputDecoration.inputDecoration(context)
                        .copyWith(hintText: "Email"),
                  ),
                  const SizedBox(height: 24),
                  Text("Password", style: theme.textTheme.bodyMedium),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: SicklerInputDecoration.inputDecoration(context)
                        .copyWith(
                      hintText: "Age",
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text("Address", style: theme.textTheme.bodyMedium),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: addressController,
                    keyboardType: TextInputType.streetAddress,
                    decoration: SicklerInputDecoration.inputDecoration(context)
                        .copyWith(
                      hintText: "Address",
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text("Sex", style: theme.textTheme.bodyMedium),
                  const SizedBox(height: 8),
                  TextFormField(
                    keyboardType: TextInputType.streetAddress,
                    decoration: SicklerInputDecoration.inputDecoration(context)
                        .copyWith(
                      hintText: "Sex",
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Spacer(),

                  ///Buttons
                  SicklerButton(
                      onPressed: () {
                        //Todo: Perform sign in action
                      },
                      label: "Continue"),

                  const SizedBox(height: 64)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
