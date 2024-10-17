import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import '../../../components/components.dart';
import '../../../core/core.dart';
import '../../auth/auth.dart';
import '../profile.dart';


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
  // final TextEditingController addressController = TextEditingController();
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
    //  addressController.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.watch(userProvider.notifier).getCurrentUserData();
      AppUser user = ref.watch(userProvider).value!;
      nameController.text = user.profile.displayName ?? "";
      ageController.text = user.profile.age.toString();

      if (user.profile.gender != null) {
        setState(() {
          selectedRadioValue = user.profile.gender!;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final userNotifier =
    ref.watch(userProvider.notifier);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomAppBar(
                  pageTitle: widget.isEditing!
                      ? "Edit Profile"
                      : "Tell us more\nabout you"),
              Visibility(
                visible: widget.isEditing!,
                child: EditableAvatar(
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
                          AppInputDecoration.inputDecoration(context)
                              .copyWith(hintText: "Names"),
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
                          AppInputDecoration.inputDecoration(context)
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
                            builder: (context) => AppBottomSheet(
                                  title: "Age",
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: ListWheelScrollViewPicker(
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

                    Row(
                      children: [
                        Expanded(
                          child: AppRadio<Gender>(
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
                          child: AppRadio<Gender>(
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
                    AppButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {

                            AppUser user = ref.watch(userProvider).value!;

                            user = user.copyWith(
                                profile: user.profile.copyWith(
                              name: nameController.text.trim(),
                              gender: selectedRadioValue,
                              age: int.tryParse(ageController.text.trim()),
                            ));

                            if (widget.isEditing!) {
                              ///Always update remote when the user is editing data.
                              ///But do not do that when the user is adding data because
                              ///the user is onboarding for the first time,
                              ///the data will be gathered and saved at the
                              ///end of the onboard process

                              await userNotifier.updateUserData(
                                  user: user, updateRemote: true);

                              ///Also show snack bars when making remote calls
                              if (context.mounted) {
                                if (userNotifier.isSuccessful) {
                                  showCustomSnackBar(
                                      context: context,
                                      message: "Profile Updated",
                                      mode: SnackBarMode.success);
                                } else {
                                  showCustomSnackBar(
                                      context: context,
                                      message: "Something went wrong",
                                      mode: SnackBarMode.error);
                                }
                              }
                            } else {
                              await userNotifier.addUserData(
                                  user: user, updateRemote: false);
                              if (context.mounted) {
                                context.pushNamed(ProfileVitalsInfoScreen.id);
                              }
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
