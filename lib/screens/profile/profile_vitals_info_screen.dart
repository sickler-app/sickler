import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sickler/models/models.dart';
import 'package:sickler/providers/providers.dart';
import 'package:sickler/screens/global_components/global_components.dart';
import 'package:sickler/screens/profile/profile_medical_info_screen.dart';

import '../../core/core.dart';
import 'components/components.dart';

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
  void dispose() {
    super.dispose();
    heightController.dispose();
    weightController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final userInfoProviderNotifier = ref.watch(userInfoProvider.notifier);
    final userInfoState = ref.watch(userInfoProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SicklerAppBar(
                  pageTitle:
                      widget.isEditing! ? "Edit Vitals" : "Personal\nInfo",
                  actions: !widget.isEditing!
                      ? [
                          SicklerButton(
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
                            SicklerInputDecoration.inputDecoration(context)
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
                            SicklerInputDecoration.inputDecoration(context)
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
                  child: SicklerButton(
                      icon: widget.isEditing!
                          ? FluentIcons.checkmark_24_regular
                          : null,
                      onPressed: () {
                        //Todo: Continue
                        if (_formKey.currentState!.validate()) {
                          ///Save Data to State and continue in the next page

                          final SicklerUserInfo updatedUserInfo =
                              userInfoState.value!.copyWith(
                            height:
                                double.tryParse(heightController.text.trim()),
                            weight:
                                double.tryParse(weightController.text.trim()),
                            genotype: selectedGenotype.toString().toUpperCase(),
                          );

                          //Save data to state
                          userInfoProviderNotifier
                              .saveDataToState(updatedUserInfo);
                          context.pushNamed(ProfileMedicalInfoScreen.id);
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
