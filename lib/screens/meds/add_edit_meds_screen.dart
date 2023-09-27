import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/core.dart';
import '../global_components/global_components.dart';
import 'components/components.dart';

class AddMedsScreen extends StatefulWidget {
  final bool isEditing;
  const AddMedsScreen({super.key, this.isEditing = false});

  @override
  State<AddMedsScreen> createState() => _AddMedsScreenState();
}

class _AddMedsScreenState extends State<AddMedsScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  bool isTakingMedsPermanently = false;
  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SicklerAppBar(
                pageTitle:
                    widget.isEditing ? "Edit\nMedication" : "Add\nMedication",
                actions: [
                  SicklerChipButton(
                    onPressed: () {
                      //Todo: Skip Page
                    },
                    label: "Skip",
                    buttonType: SicklerButtonType.text,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      "Name",
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: nameController,
                      decoration:
                          SicklerInputDecoration.inputDecoration(context)
                              .copyWith(
                        hintText: "Hydroxyl Urea",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please provide a medication name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Description",
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      maxLines: 3,
                      controller: descriptionController,
                      decoration:
                          SicklerInputDecoration.inputDecoration(context)
                              .copyWith(
                        hintText: "Description",
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text("What type of medication are you taking?"),
                    const SizedBox(height: 12),
                    MedicationTypeSelector(selectedMedication:
                        (MedicationType selectedMedicationType) {
                      ///Todo: Add selected Medication to state
                    }),
                    const SizedBox(height: 24),
                    const Text("What's the dose of your medication "),
                    const SizedBox(height: 12),
                    Wrap(
                      direction: Axis.horizontal,
                      spacing: 12,
                      runSpacing: 4,
                      children: [
                        SicklerChip(
                          onSelected: (value) {},
                          chipType: SicklerChipType.filter,
                          label: "50mg",
                        ),
                        SicklerChip(
                          onSelected: (value) {},
                          chipType: SicklerChipType.filter,
                          label: "100mg",
                        ),
                        SicklerChip(
                          onSelected: (value) {},
                          chipType: SicklerChipType.filter,
                          label: "250mg",
                        ),
                        SicklerChip(
                          onSelected: (value) {},
                          chipType: SicklerChipType.filter,
                          label: "500mg",
                        ),
                        SicklerChip(
                          onSelected: (value) async {
                            /// Select Dose Bottom Sheet
                            await showModalBottomSheet(
                              context: context,
                              builder: (context) => SicklerBottomSheet(
                                title: "Select Dose",
                                onPressed: () {
                                  ///Todo: pop and add dose to state
                                },
                                child: SicklerListWheelScrollViewPicker(
                                  primaryInitialValue: 50,
                                  primaryFinalValue: 1000,
                                  primaryValueInterval: 50,
                                  primaryUnitLabels: const ["mg"],
                                  scrollViewToLabelPadding: 24,
                                  onSelectedItemChanged: (selectedValue) {
                                    ///Todo: update selected value
                                  },
                                ),
                              ),
                            );
                          },
                          chipType: SicklerChipType.filter,
                          label: "Custom",
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const Text(
                        "How often do you take your medication in a day?"),
                    const SizedBox(height: 12),
                    Wrap(
                      direction: Axis.horizontal,
                      spacing: 12,
                      runSpacing: 4,
                      children: [
                        SicklerChip(
                          onSelected: (value) {},
                          chipType: SicklerChipType.filter,
                          label: "Once",
                        ),
                        SicklerChip(
                          onSelected: (value) {},
                          chipType: SicklerChipType.filter,
                          label: "Twice",
                        ),
                        SicklerChip(
                          onSelected: (value) {},
                          chipType: SicklerChipType.filter,
                          label: "3 Times",
                        ),
                        SicklerChip(
                          onSelected: (value) {},
                          chipType: SicklerChipType.filter,
                          label: "Custom Occurrence",
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "What time(s) do you take your medication?",
                      style: theme.textTheme.bodyMedium,
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      spacing: 12,
                      runSpacing: 4,
                      children: [
                        const SicklerChip(
                          chipType: SicklerChipType.info,
                          label: "8:00 AM",
                        ),
                        const SicklerChip(
                          chipType: SicklerChipType.info,
                          label: "3:00 PM",
                        ),
                        Container(
                          height: 42,
                          width: 42,
                          padding: EdgeInsets.zero,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: theme.cardColor,
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () async {
                              await showModalBottomSheet(
                                  context: context,
                                  builder: (context) => SicklerBottomSheet(
                                        title: "Select Time",
                                        onPressed: () {
                                          ///Todo: Add to the list of times
                                        },
                                        child: SicklerListWheelScrollViewPicker(
                                          scrollViewToLabelPadding: 12,
                                          mode:
                                              SicklerListWheelScrollViewPickerMode
                                                  .time,
                                          itemExtent: 48,
                                          onSelectedItemChanged:
                                              (selectedValue) {
                                            ///Todo: set selected time to a time var,
                                          },
                                        ),
                                      ));
                            },
                            icon: SvgPicture.asset(
                              "assets/svg/plus.svg",
                              colorFilter: ColorFilter.mode(
                                  !isDarkMode
                                      ? theme.colorScheme.primary
                                      : theme.iconTheme.color!,
                                  BlendMode.srcIn),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    // const Text(
                    //     "How long have you been taking this medication?"),
                    // const SizedBox(height: 12),
                    // Wrap(
                    //   direction: Axis.horizontal,
                    //   spacing: 12,
                    //   runSpacing: 4,
                    //   children: [
                    //     SicklerChip(
                    //       onSelected: (value) {},
                    //       chipType: SicklerChipType.filter,
                    //       label: "1 Week",
                    //     ),
                    //     SicklerChip(
                    //       onSelected: (value) {},
                    //       chipType: SicklerChipType.filter,
                    //       label: "2 Weeks",
                    //     ),
                    //     SicklerChip(
                    //       onSelected: (value) {},
                    //       chipType: SicklerChipType.filter,
                    //       label: "A month",
                    //     ),
                    //     SicklerChip(
                    //       onSelected: (value) {},
                    //       chipType: SicklerChipType.filter,
                    //       label: "6 months",
                    //     ),
                    //     SicklerChip(
                    //       onSelected: (value) {},
                    //       chipType: SicklerChipType.filter,
                    //       label: "Custom",
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(
                    //   height: 24,
                    // ),
                    Row(
                      children: [
                        const Text("I am taking this medication permanently"),
                        const Spacer(),
                        Switch(
                            value: isTakingMedsPermanently,
                            onChanged: (value) {
                              setState(() {
                                isTakingMedsPermanently = value;
                              });
                            })
                      ],
                    ),
                    const SizedBox(height: 12),
                    Visibility(
                      visible: !isTakingMedsPermanently,
                      child: Row(
                        children: [
                          widget.isEditing
                              ? Text("End of Medication",
                                  style: theme.textTheme.bodyMedium)
                              : const SizedBox(),
                          widget.isEditing ? const Spacer() : const SizedBox(),
                          SicklerChipButton(
                              buttonType: SicklerButtonType.secondary,
                              showIcon: true,
                              onPressed: () {},
                              label: widget.isEditing
                                  ? "12/05/2023"
                                  : "Select End Date",
                              iconPath: "assets/svg/calendar.svg"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    SicklerButton(
                        onPressed: () {},
                        label: widget.isEditing
                            ? "Save Medication"
                            : "Add Medication",
                        showIcon: true,
                        iconPath: "assets/svg/check.svg"),
                    Visibility(
                        visible: !widget.isEditing,
                        child: const SizedBox(height: 16)),
                    Visibility(
                      visible: !widget.isEditing,
                      child: SicklerButton(
                          onPressed: () {},
                          label: "Done",
                          buttonType: SicklerButtonType.outline),
                    ),
                    const SizedBox(
                      height: 64,
                    )
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
