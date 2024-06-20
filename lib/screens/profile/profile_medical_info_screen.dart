import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sickler/models/models.dart';

import '../../core/core.dart';
import '../../providers/providers.dart';
import '../global_components/global_components.dart';
import '../water/suggested_water_daily_goal_screen.dart';

class ProfileMedicalInfoScreen extends ConsumerStatefulWidget {
  static const String id = "medical_info";
  const ProfileMedicalInfoScreen({super.key});

  @override
  ConsumerState<ProfileMedicalInfoScreen> createState() =>
      _ProfileMedicalInfoScreenState();
}

class _ProfileMedicalInfoScreenState
    extends ConsumerState<ProfileMedicalInfoScreen> {
  final TextEditingController allergiesController = TextEditingController();
  final TextEditingController medicalConditionsController =
      TextEditingController();

  bool labelSelected = false;
  List<String> medicalConditions = [];
  List<String> allergies = [];
  List<String> crisisFrequency = [];

  @override
  void dispose() {
    allergiesController.dispose();
    medicalConditionsController.dispose();
    super.dispose();
  }

  // void _showSnackBar(String message) {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text(message),
  //     ));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final userInfoProviderNotifier = ref.watch(userInfoProvider.notifier);
    final userInfoState = ref.watch(userInfoProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SicklerAppBar(
              pageTitle: "Medical\nInfo",
              actions: [
                SicklerButton(
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
                  Text(
                    "Crises frequency",
                    style: theme.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.w800),
                  ),
                  const Gap(16),
                  Text(
                    "How often do you experience a Sickle Cell crises?",
                    style: theme.textTheme.bodyMedium,
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 12,
                    runSpacing: 4,
                    children: [
                      SicklerChip(
                        label: "Daily",
                        onSelected: (value) {},
                      ),
                      SicklerChip(
                        label: "Weekly",
                        onSelected: (value) {},
                      ),
                      SicklerChip(
                        label: "Monthly",
                        onSelected: (value) {},
                      ),
                      SicklerChip(
                        label: "Custom",
                        onSelected: (value) {},
                      ),
                    ],
                  ),
                  const Gap(16),
                  Text(
                    "Pain Severity?",
                    style: theme.textTheme.bodyMedium,
                  ),

                  ///Todo: Make a Sickler Slider component
                  Slider(min: 0, max: 10, value: 7, onChanged: (value) {}),
                  const Gap(24),
                  Text(
                    "Allergies",
                    style: theme.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.w800),
                  ),
                  const Gap(12),

                  TextFormField(
                    controller: allergiesController,
                    textCapitalization: TextCapitalization.sentences,
                    onFieldSubmitted: (String value) {
                      setState(() {
                        allergies.add(allergiesController.text.trim());
                        allergiesController.clear();
                      });
                    },
                    decoration: SicklerInputDecoration.inputDecoration(context)
                        .copyWith(
                      hintText: "e.g. Peanuts",
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              allergies.add(allergiesController.text.trim());
                              allergiesController.clear();
                            });
                          },
                          icon: const Icon(
                            FluentIcons.checkmark_24_filled,
                          )),
                    ),
                  ),
                  const Gap(12),
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 12,
                    runSpacing: 4,
                    children: [
                      for (String allergy in allergies)
                        SicklerChip(
                          label: allergy,
                          chipType: SicklerChipType.info,
                          onDeleted: () {
                            setState(() {
                              allergies.remove(allergy);
                            });
                          },
                        ),
                    ],
                  ),
                  const Gap(24),
                  Text(
                    "Medical Conditions",
                    style: theme.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.w800),
                  ),
                  const Gap(12),

                  TextFormField(
                    controller: medicalConditionsController,
                    textCapitalization: TextCapitalization.sentences,
                    onFieldSubmitted: (String value) {
                      setState(() {
                        medicalConditions
                            .add(medicalConditionsController.text.trim());
                        medicalConditionsController.clear();
                      });
                    },
                    decoration: SicklerInputDecoration.inputDecoration(context)
                        .copyWith(
                      hintText: "e.g. Acute Chest Syndrome",
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              medicalConditions
                                  .add(medicalConditionsController.text.trim());
                              medicalConditionsController.clear();
                            });
                          },
                          icon: const Icon(
                            FluentIcons.checkmark_24_filled,
                          )),
                    ),
                  ),
                  const Gap(12),
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 12,
                    runSpacing: 4,
                    children: [
                      for (String medicalCondition in medicalConditions)
                        SicklerChip(
                          label: medicalCondition,
                          chipType: SicklerChipType.info,
                          onDeleted: () {
                            setState(() {
                              medicalConditions.remove(medicalCondition);
                            });
                          },
                        ),
                    ],
                  ),
                  const Gap(32),
                  SicklerButton(
                      onPressed: () async {
                        ///Todo: add the rest of the health data;
                        ///

                        ref
                            .watch(userPreferencesProvider.notifier)
                            .getUserPreferences()
                            .then((_) async {
                          //Update User Preferences
                          final UserPreferences finalPrefs = ref
                              .watch(userPreferencesProvider)
                              .value!
                              .copyWith(
                                isOnboardingComplete: true,
                              );
                          //Save updated preferences to local
                          await ref
                              .watch(userPreferencesProvider.notifier)
                              .addUserPreferencesToLocal(finalPrefs);

                          //Add updated preferences to user data going to firebase
                          final SicklerUserInfo updatedUserInfo =
                              userInfoState.value!.copyWith(
                                  allergies: allergies,
                                  medicalConditions: medicalConditions,
                                  bmi: userInfoState.value!.calculateBMI(),
                                  preferences: finalPrefs);

                          //Send data to firebase
                          await userInfoProviderNotifier
                              .addUserData(updatedUserInfo)
                              .then((_) {
                            if (userInfoState.hasValue &&
                                !userInfoState.hasError) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      content: Text(
                                "success",
                                style: theme.textTheme.bodyMedium!
                                    .copyWith(color: Colors.green),
                              )));
                            }
                          });
                        });

                        // if (userInfoState.hasError) {
                        //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //       content: Text(
                        //     (userInfoState.error as Failure).errorMessage ??
                        //         "error occurred",
                        //     style: theme.textTheme.bodyMedium!
                        //         .copyWith(color: theme.colorScheme.error),
                        //   )));
                        // }
                        //
                        // if (userInfoState.isLoading) {
                        //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //       content: Text(
                        //     "loading",
                        //     style: theme.textTheme.bodyMedium!
                        //         .copyWith(color: theme.colorScheme.secondary),
                        //   )));
                        // }

                        ///Todo: perform proper error and state notification;
                        ///Todo: navigate to the page for showing recommended water goal
                        if (context.mounted) {
                          context.pushNamed(SuggestedWaterDailyGoalScreen.id);
                        }
                      },
                      label: "Continue"),
                  const Gap(64)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
