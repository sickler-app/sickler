import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:sickler/screens/global_components/global_components.dart';

import '../../core/core.dart';
import 'components/genotype_selector.dart';

class ProfileVitalsInfoScreen extends StatefulWidget {
  final bool? isEditing;
  const ProfileVitalsInfoScreen({super.key, this.isEditing = false});

  @override
  State<ProfileVitalsInfoScreen> createState() =>
      _ProfileVitalsInfoScreenState();
}

class _ProfileVitalsInfoScreenState extends State<ProfileVitalsInfoScreen> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isGenotypeKnown = false;
  Map<int, bool> isGenotypeSelected = {0: true};
  List<Genotype> genotypeData = Genotype.values;

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

                      SizedBox(
                        height: 72,
                        child: ListView.separated(
                          padding: EdgeInsets.zero,
                          itemCount: genotypeData.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            isGenotypeSelected.putIfAbsent(
                                index, () => false);

                            return GenotypeSelector(
                              onPressed: () {
                                HapticFeedback.mediumImpact();
                                Feedback.forTap(context);
                                isGenotypeSelected
                                    .updateAll((key, value) => false);
                                isGenotypeSelected.update(index,
                                        (value) => !isGenotypeSelected[index]!);
                                setState(() {});
                              },
                              isSelected: isGenotypeSelected[index]!,
                              genotype: genotypeData[index],
                            );
                          },
                          separatorBuilder:
                              (BuildContext context, int index) {
                            return const Gap(16);
                          },
                        ),
                      ),
                      const Gap(16),
                      Row(
                        children: [
                          Text("I don't know my genotype",
                              style: theme.textTheme.bodyMedium),
                          const Spacer(),
                          Switch(
                            value: _isGenotypeKnown,
                            onChanged: (value) {
                              setState(() {
                                _isGenotypeKnown = value;
                              });
                            },
                          ),
                        ],
                      ),

                    ],
                  ),

                ),

                const Spacer(),
                ///Buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SicklerButton(
                    icon: widget.isEditing!? FluentIcons.checkmark_24_regular : null,
                      onPressed: () {
                        //Todo: Continue
                      },
                      label: widget.isEditing!? "Save": "Continue"),
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
