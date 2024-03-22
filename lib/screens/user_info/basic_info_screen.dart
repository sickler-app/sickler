import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sickler/screens/global_components/global_components.dart';

import '../../core/core.dart';
import 'components/sickler_radio.dart';

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

  Gender selectedRadioValue = Gender.male;
  final List<String> listData = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
  ];

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
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SicklerAppBar(pageTitle: "Tell us more\nabout you"),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Full Names", style: theme.textTheme.bodyMedium),
                        const Gap( 8),
                        TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          decoration:
                              SicklerInputDecoration.inputDecoration(context)
                                  .copyWith(hintText: "Email"),
                        ),
                        const Gap( 24),
                        Text("Age", style: theme.textTheme.bodyMedium),
                        const Gap( 8),
                        TextFormField(
                          readOnly: true,
                          showCursor: true,
                          controller: ageController,
                          keyboardType: TextInputType.number,
                          decoration:
                              SicklerInputDecoration.inputDecoration(context)
                                  .copyWith(
                            hintText: "Age",
                          ),
                          onTap: () async {
                            //Todo: Trigger Bottom Sheet
                            await showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) => SicklerBottomSheet(
                                      title: "Age",
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: SicklerListWheelScrollViewPicker(
                                        itemExtent: 48,
                                        onSelectedItemChanged: (selectedValue) {
                                          setState(() {
                                            ageController.text =
                                                selectedValue.toString();
                                          });
                                        },
                                        primaryInitialValue: 0,
                                        primaryFinalValue: 100,
                                      ),
                                    ));
                          },
                        ),
                        const Gap( 24),
                        Text("Address", style: theme.textTheme.bodyMedium),
                        const Gap( 8),
                        TextFormField(
                          controller: addressController,
                          keyboardType: TextInputType.streetAddress,
                          decoration:
                              SicklerInputDecoration.inputDecoration(context)
                                  .copyWith(
                            hintText: "Address",
                          ),
                        ),
                        const Gap( 24),
                        Text("Sex", style: theme.textTheme.bodyMedium),
                        const Gap( 8),

                        const Gap( 16),
                        Row(
                          children: [
                            Expanded(
                              child: SicklerRadio<Gender>(
                                label: "Female",
                                value: Gender.female,
                                groupValue: selectedRadioValue,
                                onChanged: (Gender? value) {
                                  setState(() {
                                    selectedRadioValue = value!;
                                  });
                                },
                              ),
                            ),
                            const Gap( 16),
                            Expanded(
                              child: SicklerRadio<Gender>(
                                label: "Male",
                                value: Gender.male,
                                groupValue: selectedRadioValue,
                                onChanged: (Gender? value) {
                                  setState(() {
                                    selectedRadioValue = value!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const Gap( 32),
                        const Spacer(),

                        ///Buttons
                        SicklerButton(
                            onPressed: () {
                              //Todo: Perform sign in action
                            },
                            label: "Continue"),

                        const Gap( 64),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
