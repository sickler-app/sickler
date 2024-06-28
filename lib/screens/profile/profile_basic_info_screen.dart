import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sickler/providers/providers.dart';
import 'package:sickler/screens/global_components/global_components.dart';
import 'package:sickler/screens/profile/profile_vitals_info_screen.dart';

import '../../core/core.dart';
import '../../models/models.dart';
import 'components/sickler_radio.dart';

class ProfileBasicInfoScreen extends ConsumerStatefulWidget {
  static const String id = "basic_info";
  final bool? isEditing;

  const ProfileBasicInfoScreen({super.key, this.isEditing = false});

  @override
  ConsumerState<ProfileBasicInfoScreen> createState() =>
      _ProfileBasicInfoScreenState();
}

class _ProfileBasicInfoScreenState
    extends ConsumerState<ProfileBasicInfoScreen> {
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
  void initState() {
    nameController.text =
        ref.read(authStateChangesStreamProvider).value!.displayName ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userInfoProviderNotifier = ref.watch(userInfoProvider.notifier);

    final SicklerUser? currentUser =
        ref.watch(authStateChangesStreamProvider).value;

    final userPreferencesProviderNotifier =
        ref.watch(userPreferencesProvider.notifier);
    final userPreferencesState = ref.watch(userPreferencesProvider);

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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your age";
                        }
                        return null;
                      },
                      onTap: () async {
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
                    // Text("Address", style: theme.textTheme.bodyMedium),
                    // const Gap(8),
                    // TextFormField(
                    //   controller: addressController,
                    //   keyboardType: TextInputType.streetAddress,
                    //   decoration:
                    //       SicklerInputDecoration.inputDecoration(context)
                    //           .copyWith(
                    //     hintText: "Address",
                    //   ),
                    // ),
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
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final SicklerUserInfo userInfo = SicklerUserInfo(
                                uid: currentUser!.uid,
                                age: int.parse(ageController.text.trim()),
                                gender: selectedRadioValue.toString(),
                                fullName: nameController.text.trim(),
                                displayName: currentUser.displayName!);
                            //Save Data to Set
                            userInfoProviderNotifier.saveDataToState(userInfo);

                            //Mark User as Onboarded since the other pages are shippable
                            //and we don't want the user to repeat the whole onboarding
                            // process because he skipped it the first time,
                            //they can always do that later
                            final UserPreferences userPreferences =
                                userPreferencesState.value!;
                            if (!widget.isEditing!) {
                              await userPreferencesProviderNotifier
                                  .addUserPreferencesToLocal(
                                      userPreferences.copyWith(
                                          uid: currentUser.uid,
                                          isOnboardingComplete: false));
                            }

                            if (context.mounted) {
                              context.pushNamed(ProfileVitalsInfoScreen.id);
                            }
                          }
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
