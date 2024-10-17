import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';

class EditDailyGoalScreen extends StatefulWidget {
  static const String id = "edit_daily_goal";
  const EditDailyGoalScreen({super.key});

  @override
  State<EditDailyGoalScreen> createState() => _EditDailyGoalScreenState();
}

class _EditDailyGoalScreenState extends State<EditDailyGoalScreen> {
  final TextEditingController volumeController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController timeIntervalController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isReminderKnown = false;
  Map<int, bool> isReminderSelected = {0: true};
  Gender selectedRadioValue = Gender.male;
  final List<String> listData = [
    "hour",
    "hours",
  ];

  @override
  void dispose() {
    super.dispose();
    volumeController.dispose();
    ageController.dispose();
    timeIntervalController.dispose();
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
                const CustomAppBar(pageTitle: "Set your\ndaily goal"),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Volume", style: theme.textTheme.bodyMedium),
                        const Gap(8),
                        TextFormField(
                          controller: volumeController,
                          keyboardType: TextInputType.name,
                          decoration:
                              AppInputDecoration.inputDecoration(context)
                                  .copyWith(hintText: "1000ml"),
                        ),
                        const Gap(24),
                        Row(
                          children: [
                            Text("Enable reminders for this goal",
                                style: theme.textTheme.bodyMedium),
                            const Spacer(),
                            Switch(
                              value: _isReminderKnown,
                              onChanged: (value) {
                                setState(() {
                                  _isReminderKnown = value;
                                });
                              },
                            ),
                          ],
                        ),
                        const Gap(24),
                        Text("Notification Interval",
                            style: theme.textTheme.bodyMedium),
                        const Gap(8),
                        TextFormField(
                          readOnly: true,
                          controller: timeIntervalController,
                          keyboardType: TextInputType.streetAddress,
                          onTap: () async {
                            await showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) => AppBottomSheet(
                                      title: "Time",
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: ListWheelScrollViewPicker(
                                        itemExtent: 48,
                                        onSelectedItemChanged: (selectedValue) {
                                          setState(() {
                                            timeIntervalController.text =
                                                selectedValue.toString();
                                          });
                                        },
                                        primaryUnitLabels: listData,
                                        primaryInitialValue: 0,
                                        primaryFinalValue: 100,
                                      ),
                                    ));
                          },
                          decoration:
                              AppInputDecoration.inputDecoration(context)
                                  .copyWith(
                            hintText: "Notification Interval",
                          ),
                        ),
                        const Gap(24),
                        Text(
                            "We will send you reminder every ${timeIntervalController.text} hours to help you achieve this goal",
                            style: theme.textTheme.bodyMedium),

                        const Spacer(),

                        ///Buttons
                        AppButton(
                            onPressed: () async {
                              //Todo: Perform sign in action
                            },
                            label: "Save Goal"),

                        const Gap(64),
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
