import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/core.dart';
import '../global_components/global_components.dart';

class AddMedsScreen extends StatefulWidget {
  const AddMedsScreen({super.key});

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SicklerAppBar(
              pageTitle: "Add\nMedication",
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
                    decoration: SicklerInputDecoration.inputDecoration(context)
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
                    decoration: SicklerInputDecoration.inputDecoration(context)
                        .copyWith(
                      hintText: "Description",
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text("What type of medication are you taking?"),
                  const SizedBox(height: 12),

                  ///Todo: add medication type widgets
                  const SizedBox(height: 24),
                  const Text("How oftern do you take your medication in a day?"),
                  const SizedBox(height: 12),

                  ///Todo: add medication type widgets

                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 12,
                    runSpacing: 4,
                    children: [
                      SicklerChip(
                        onSelected: (value) {},
                        chipType: SicklerChipType.filter,
                        labelText: "Once",
                      ),
                      SicklerChip(
                        onSelected: (value) {},
                        chipType: SicklerChipType.filter,
                        labelText: "Twice",
                      ),
                      SicklerChip(
                        onSelected: (value) {},
                        chipType: SicklerChipType.filter,
                        labelText: "3 Times",
                      ),
                      SicklerChip(
                        onSelected: (value) {},
                        chipType: SicklerChipType.filter,
                        labelText: "Custom",
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
                        labelText: "8:00 AM",
                      ),
                      const SicklerChip(
                        chipType: SicklerChipType.info,
                        labelText: "3:00 PM",
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
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            "assets/svg/plus.svg",
                            colorFilter: ColorFilter.mode(
                                theme.brightness == Brightness.light
                                    ? theme.colorScheme.primary
                                    : theme.iconTheme.color!,
                                BlendMode.srcIn),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 24),

                  const Text("How long have you been taking this medication?"),
                  const SizedBox(height: 12),
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 12,
                    runSpacing: 4,
                    children: [
                      SicklerChip(
                        onSelected: (value) {},
                        chipType: SicklerChipType.filter,
                        labelText: "1 Week",
                      ),
                      SicklerChip(
                        onSelected: (value) {},
                        chipType: SicklerChipType.filter,
                        labelText: "2 Weeks",
                      ),
                      SicklerChip(
                        onSelected: (value) {},
                        chipType: SicklerChipType.filter,
                        labelText: "A month",
                      ),
                      SicklerChip(
                        onSelected: (value) {},
                        chipType: SicklerChipType.filter,
                        labelText: "6 months",
                      ),
                      SicklerChip(
                        onSelected: (value) {},
                        chipType: SicklerChipType.filter,
                        labelText: "Custom",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
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
                    child: SicklerChipButton(
                        buttonType: SicklerButtonType.secondary,
                        showIcon: true,
                        onPressed: () {},
                        label: "Select End Date",
                        iconPath: "assets/svg/calendar.svg"),
                  ),
                  const SizedBox(height: 32),
                  SicklerButton(
                      onPressed: () {},
                      label: "Add Medication",
                      showIcon: true,
                      iconPath: "assets/svg/check.svg"),
                  const SizedBox(height: 16),
                  SicklerButton(
                      onPressed: () {},
                      label: "Done",
                      buttonType: SicklerButtonType.outline),
                  const SizedBox(
                    height: 64,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
