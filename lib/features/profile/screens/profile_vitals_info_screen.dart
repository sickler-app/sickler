import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../../auth/auth.dart';
import '../profile.dart';


class ProfileVitalsInfoScreen extends ConsumerStatefulWidget {
  static const String id = "vitals";
  final bool? isEditing;
  const ProfileVitalsInfoScreen({super.key, this.isEditing = false});

  @override
  ConsumerState<ProfileVitalsInfoScreen> createState() =>
      _ProfileVitalsInfoScreenState();
}

class _ProfileVitalsInfoScreenState
    extends ConsumerState<ProfileVitalsInfoScreen> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Genotype selectedGenotype = Genotype.na;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.watch(userProvider.notifier).getCurrentUserData();
      AppUser user = ref.watch(userProvider).value!;
      heightController.text = user.profile.height.toString();
      weightController.text = user.profile.weight.toString();

      if (user.profile.genotype != null) {
        setState(() {
          selectedGenotype = user.profile.genotype!;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    heightController.dispose();
    weightController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomAppBar(
                  pageTitle:
                      widget.isEditing! ? "Edit Vitals" : "Personal\nInfo",
                  actions: !widget.isEditing!
                      ? [
                          AppButton(
                            isChipButton: true,
                            onPressed: () {
                              //Todo: Skip Page
                            },
                            label: "Skip",
                            buttonType: SicklerButtonType.text,
                          )
                        ]
                      : null,
                ),

                ///Content
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/svg/ruler.svg",
                            colorFilter: ColorFilter.mode(
                                theme.colorScheme.primary, BlendMode.srcIn),
                          ),
                          const Gap(4),
                          Text("Your Height",
                              style: theme.textTheme.bodyMedium),
                        ],
                      ),
                      const Gap(8),
                      TextFormField(
                        controller: heightController,
                        keyboardType: TextInputType.number,
                        decoration:
                            AppInputDecoration.inputDecoration(context)
                                .copyWith(hintText: "Height"),
                      ),
                      const Gap(24),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/svg/weight.svg",
                            colorFilter: ColorFilter.mode(
                                theme.colorScheme.primary, BlendMode.srcIn),
                          ),
                          const Gap(4),
                          Text("Your Weight",
                              style: theme.textTheme.bodyMedium),
                        ],
                      ),
                      const Gap(8),
                      TextFormField(
                        controller: weightController,
                        keyboardType: TextInputType.number,
                        decoration:
                            AppInputDecoration.inputDecoration(context)
                                .copyWith(
                          hintText: "Weight",
                        ),
                      ),
                      const Gap(24),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/svg/dna.svg",
                            colorFilter: ColorFilter.mode(
                                theme.colorScheme.primary, BlendMode.srcIn),
                          ),
                          const Gap(4),
                          Text("Your Genotype",
                              style: theme.textTheme.bodyMedium),
                        ],
                      ),
                      const Gap(8),
                      GenotypeSelector(
                        onGenotypeSelect: (Genotype genotype) {
                          setState(() {
                            selectedGenotype = genotype;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                ///Buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: AppButton(
                      icon: widget.isEditing!
                          ? FluentIcons.checkmark_24_regular
                          : null,
                      onPressed: () async {
                        //Todo: Continue
                        if (_formKey.currentState!.validate()) {
                          final userNotifier = ref.watch(userProvider.notifier);
                          AppUser user = ref.watch(userProvider).value!;

                          user = user.copyWith(
                              profile: user.profile.copyWith(
                                  height: double.tryParse(
                                      heightController.text.trim()),
                                  weight: double.tryParse(
                                      weightController.text.trim()),
                                  genotype: selectedGenotype));

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
                          }

                          if (context.mounted) {
                            ///Todo: Add parameters for isEditing to know if it is editing or not
                            context.pushNamed(ProfileMedicalInfoScreen.id);
                          }
                        }
                      },
                      label: widget.isEditing! ? "Save" : "Continue"),
                ),
                const Gap(64),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
