import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sickler/screens/global_components/global_components.dart';

import '../../core/core.dart';
import 'components/sickler_radio.dart';

class ProfileBasicInfoScreen extends StatefulWidget {
  static const String id = "basic_info";
  final bool? isEditing;

  const ProfileBasicInfoScreen({super.key, this.isEditing = false});

  @override
  State<ProfileBasicInfoScreen> createState() => _ProfileBasicInfoScreenState();
}

class _ProfileBasicInfoScreenState extends State<ProfileBasicInfoScreen> {
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SicklerAppBar(
                  pageTitle: widget.isEditing!
                      ? "Edit Profile"
                      : "Tell us more\nabout you"),
              Visibility(
                visible: widget.isEditing!,
                child: SicklerEditableAvatar(
                  onEditPressed: () {
                    ///Todo: Implement on Edit Pressed;
                  },
                  imagePath: "assets/images/memoji2.jpg",
                ),
              ),
              const Gap(32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Full Names", style: theme.textTheme.bodyMedium),
                    const Gap(8),
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      decoration:
                          SicklerInputDecoration.inputDecoration(context)
                              .copyWith(hintText: "Email"),
                    ),
                    const Gap(24),
                    Text("Age", style: theme.textTheme.bodyMedium),
                    const Gap(8),
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
                    const Gap(24),
                    Text("Address", style: theme.textTheme.bodyMedium),
                    const Gap(8),
                    TextFormField(
                      controller: addressController,
                      keyboardType: TextInputType.streetAddress,
                      decoration:
                          SicklerInputDecoration.inputDecoration(context)
                              .copyWith(
                        hintText: "Address",
                      ),
                    ),
                    const Gap(24),
                    Text("Sex", style: theme.textTheme.bodyMedium),
                    const Gap(8),

                    const Gap(16),
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
                        const Gap(16),
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
                    const Gap(64),

                    ///Buttons
                    SicklerButton(
                        onPressed: () {
                          //Todo: Perform sign in action
                        },
                        label: "Continue"),

                    const Gap(64),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
