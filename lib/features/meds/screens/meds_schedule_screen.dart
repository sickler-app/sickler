import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:sickler/screens/global_components/components.dart';
import 'package:sickler/screens/meds/components/sickler_calendar_day_selector.dart';
import 'package:sickler/screens/profile/components/sickler_radio.dart';

import '../../../core/core.dart';

class MedsScheduleScreen extends StatefulWidget {
  static const String id = "meds_schedule";
  const MedsScheduleScreen({super.key});

  @override
  State<MedsScheduleScreen> createState() => _MedsScheduleScreenState();
}

class _MedsScheduleScreenState extends State<MedsScheduleScreen> {
  final TextEditingController repeatCountController = TextEditingController();
  final TextEditingController repeatIntervalController =
      TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController afterNumberOfOccurrencesController =
      TextEditingController();
  MedsScheduleEndingState selectedRadioValue = MedsScheduleEndingState.never;

  @override
  void dispose() {
    repeatCountController.dispose();
    endDateController.dispose();
    afterNumberOfOccurrencesController.dispose();
    repeatIntervalController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(pageTitle: "Edit\nOccurrences"),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Repeats every"),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 46,
                            child: TextFormField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                controller: repeatCountController,
                                decoration:
                                    SicklerInputDecoration.inputDecoration(
                                            context)
                                        .copyWith(hintText: "1")),
                          ),
                          const Gap(16),
                          Expanded(
                            child: TextFormField(
                              controller: repeatIntervalController,
                              decoration:
                                  SicklerInputDecoration.inputDecoration(
                                          context)
                                      .copyWith(
                                          hintText: "Week",
                                          suffixIcon: IconButton(
                                              onPressed: () {},
                                              icon: SvgPicture.asset(
                                                "assets/svg/chevron-down.svg",
                                                colorFilter: ColorFilter.mode(
                                                    theme.iconTheme.color!,
                                                    BlendMode.srcIn),
                                              ))),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const Gap(24),
                      SicklerCalendarDaySelector(selectedDays: (selectedDay) {
                        ///Todo:Add the selected day to state;
                      }),
                      const Gap(24),
                      const Text("Ends on"),
                      const Gap(24),
                      SicklerRadio<MedsScheduleEndingState>(
                        showBorder: false,
                        unselectedBackgroundColor: Colors.transparent,
                        selectedBackgroundColor: Colors.transparent,
                        label: "Never",
                        value: MedsScheduleEndingState.never,
                        groupValue: selectedRadioValue,
                        onChanged: (MedsScheduleEndingState? value) {
                          setState(() {
                            selectedRadioValue = value!;
                          });
                        },
                      ),
                      const Gap(12),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: SicklerRadio<MedsScheduleEndingState>(
                              showBorder: false,
                              unselectedBackgroundColor: Colors.transparent,
                              selectedBackgroundColor: Colors.transparent,
                              label: "On",
                              value: MedsScheduleEndingState.onDate,
                              groupValue: selectedRadioValue,
                              onChanged: (MedsScheduleEndingState? value) {
                                setState(() {
                                  selectedRadioValue = value!;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: endDateController,
                              decoration:
                                  SicklerInputDecoration.inputDecoration(
                                          context)
                                      .copyWith(
                                hintText: "Today",
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const Gap(12),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: SicklerRadio<MedsScheduleEndingState>(
                              showBorder: false,
                              unselectedBackgroundColor: Colors.transparent,
                              selectedBackgroundColor: Colors.transparent,
                              label: "After",
                              value: MedsScheduleEndingState
                                  .afterNumberOfOccurrences,
                              groupValue: selectedRadioValue,
                              onChanged: (MedsScheduleEndingState? value) {
                                setState(() {
                                  selectedRadioValue = value!;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: afterNumberOfOccurrencesController,
                              decoration:
                                  SicklerInputDecoration.inputDecoration(
                                          context)
                                      .copyWith(
                                hintText: "1 Occurrence(s)",
                              ),
                              onTap: () {
                                ///Todo: call date picker method
                              },
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const Spacer(),
                      AppButton(
                          onPressed: () {
                            ///Todo: save data, add to state and pop
                          },
                          label: "Continue"),
                      const Gap(64),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
