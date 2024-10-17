import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import '../../../components/components.dart';
import '../../../core/core.dart';
import '../meds.dart';

class AddMedsScreen extends StatefulWidget {
  static const String id = "add_meds";
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
              CustomAppBar(
                pageTitle:
                    widget.isEditing ? "Edit\nMedication" : "Add\nMedication",
                actions: [
                  AppButton(
                    isChipButton: true,
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
                    const Gap(16),
                    Text(
                      "Name",
                      style: theme.textTheme.bodyMedium,
                    ),
                    const Gap(12),
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
                    const Gap(16),
                    Text(
                      "Description",
                      style: theme.textTheme.bodyMedium,
                    ),
                    const Gap(12),
                    TextFormField(
                      maxLines: 3,
                      controller: descriptionController,
                      decoration:
                          SicklerInputDecoration.inputDecoration(context)
                              .copyWith(
                        hintText: "Description",
                      ),
                    ),
                    const Gap(24),
                    const Text("What type of medication are you taking?"),
                    const Gap(12),
                    MedicationTypeSelector(selectedMedication:
                        (MedicationType selectedMedicationType) {
                      ///Todo: Add selected Medication to state
                    }),
                    const Gap(24),
                    const Text("What's the dose of your medication "),
                    const Gap(12),
                    Wrap(
                      direction: Axis.horizontal,
                      spacing: 12,
                      runSpacing: 4,
                      children: [
                        AppChip(
                          onSelected: (value) {},
                          chipType: SicklerChipType.filter,
                          label: "50mg",
                        ),
                        AppChip(
                          onSelected: (value) {},
                          chipType: SicklerChipType.filter,
                          label: "100mg",
                        ),
                        AppChip(
                          onSelected: (value) {},
                          chipType: SicklerChipType.filter,
                          label: "250mg",
                        ),
                        AppChip(
                          onSelected: (value) {},
                          chipType: SicklerChipType.filter,
                          label: "500mg",
                        ),
                        AppChip(
                          onSelected: (value) async {
                            /// Select Dose Bottom Sheet
                            await showModalBottomSheet(
                              context: context,
                              builder: (context) => AppBottomSheet(
                                title: "Select Dose",
                                onPressed: () {
                                  ///Todo: pop and add dose to state
                                },
                                child: ListWheelScrollViewPicker(
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
                    const Gap(24),
                    const Text(
                        "How often do you take your medication in a day?"),
                    const Gap(12),
                    Wrap(
                      direction: Axis.horizontal,
                      spacing: 12,
                      runSpacing: 4,
                      children: [
                        AppChip(
                          onSelected: (value) {},
                          chipType: SicklerChipType.filter,
                          label: "Once",
                        ),
                        AppChip(
                          onSelected: (value) {},
                          chipType: SicklerChipType.filter,
                          label: "Twice",
                        ),
                        AppChip(
                          onSelected: (value) {},
                          chipType: SicklerChipType.filter,
                          label: "3 Times",
                        ),
                        AppChip(
                          onSelected: (value) {},
                          chipType: SicklerChipType.filter,
                          label: "Custom Occurrence",
                        ),
                      ],
                    ),
                    const Gap(24),
                    Text(
                      "What time(s) do you take your medication?",
                      style: theme.textTheme.bodyMedium,
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      spacing: 12,
                      runSpacing: 4,
                      children: [
                        const AppChip(
                          chipType: SicklerChipType.info,
                          label: "8:00 AM",
                        ),
                        const AppChip(
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
                                  builder: (context) => AppBottomSheet(
                                        title: "Select Time",
                                        onPressed: () {
                                          ///Todo: Add to the list of times
                                        },
                                        child: ListWheelScrollViewPicker(
                                          scrollViewToLabelPadding: 12,
                                          mode:
                                              AppListWheelScrollViewPickerMode
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
                    const Gap(24),
                    // const Text(
                    //     "How long have you been taking this medication?"),
                    // Gap( 12),
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
                    const Gap(12),
                    Visibility(
                      visible: !isTakingMedsPermanently,
                      child: Row(
                        children: [
                          widget.isEditing
                              ? Text("End of Medication",
                                  style: theme.textTheme.bodyMedium)
                              : const SizedBox(),
                          widget.isEditing ? const Spacer() : const SizedBox(),
                          AppButton(
                            isChipButton: true,
                            buttonType: SicklerButtonType.secondary,
                            onPressed: () {},
                            icon: FluentIcons.calendar_20_regular,
                            label: widget.isEditing
                                ? "12/05/2023"
                                : "Select End Date",
                          ),
                        ],
                      ),
                    ),
                    const Gap(32),
                    AppButton(
                        onPressed: () {},
                        label: widget.isEditing
                            ? "Save Medication"
                            : "Add Medication",
                        icon: FluentIcons.checkmark_24_regular),
                    Visibility(
                        visible: !widget.isEditing, child: const Gap(16)),
                    Visibility(
                      visible: !widget.isEditing,
                      child: AppButton(
                          onPressed: () {
                            context.pop();
                          },
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
