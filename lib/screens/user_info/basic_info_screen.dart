import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  bool radioValue = false;
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
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Full Names", style: theme.textTheme.bodyMedium),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          decoration:
                              SicklerInputDecoration.inputDecoration(context)
                                  .copyWith(hintText: "Email"),
                        ),
                        const SizedBox(height: 24),
                        Text("Age", style: theme.textTheme.bodyMedium),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: ageController,
                          keyboardType: TextInputType.number,
                          decoration:
                              SicklerInputDecoration.inputDecoration(context)
                                  .copyWith(
                            hintText: "Age",
                          ),
                          onTap: () async {
                            //Todo: Trigger Bottom Sheet
                            int age = await showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) => Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          height: 200,
                                          width: double.infinity,
                                          child:
                                              ListWheelScrollView.useDelegate(
                                                  itemExtent: 48,
                                                  childDelegate:
                                                      ListWheelChildBuilderDelegate(
                                                          builder: (BuildContext
                                                                  context,
                                                              int index) {
                                                    return Text(
                                                        listData[index]);
                                                  })),
                                        ),
                                        Text("Bottom Sheet"),
                                        SizedBox(
                                          height: 64,
                                        )
                                      ],
                                    ));

                            setState(() {
                              ageController.text = age.toString();
                            });
                          },
                        ),
                        const SizedBox(height: 24),
                        Text("Address", style: theme.textTheme.bodyMedium),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: addressController,
                          keyboardType: TextInputType.streetAddress,
                          decoration:
                              SicklerInputDecoration.inputDecoration(context)
                                  .copyWith(
                            hintText: "Address",
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text("Sex", style: theme.textTheme.bodyMedium),
                        const SizedBox(height: 8),

                        SizedBox(height: 16),
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
                            SizedBox(width: 16),
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
                        SizedBox(height: 32),
                        Spacer(),

                        ///Buttons
                        SicklerButton(
                            onPressed: () {
                              //Todo: Perform sign in action
                            },
                            label: "Continue"),

                        const SizedBox(height: 64),
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

class CupertinoPickerTestScreen extends StatelessWidget {
  CupertinoPickerTestScreen({super.key});

  List<String> listData = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "6",
    "6",
    "6",
    "6",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SicklerAppBar(pageTitle: "Cupertino Picker\nTest Screen"),
          CupertinoTimerPicker(
              minuteInterval: 30,
              mode: CupertinoTimerPickerMode.hm,
              itemExtent: 48,
              onTimerDurationChanged: (Duration duration) {}),
          SicklerListWheelScrollViewPicker(
            // primaryInitialValue: 0,
            // primaryFinalValue: 50,
            // secondaryInitialValue: 0,
            // secondaryFinalValue: 10,
            // secondaryValueInterval: 1,
            itemExtent: 50,
            onSelectedItemIndexChanged: (index) {},
            mode: SicklerListWheelScrollViewPickerMode.text,
            textDataValuesList: [
              "Text 1",
              "Text 2",
              "Text 3",
              "Text 4",
              "Text 5",
            ],

            scrollViewToLabelPadding: 16,
            //  primaryUnitLabels: ["Kg", "Hours", "short", "extra long"],
          )
        ],
      ),
    );
  }
}
