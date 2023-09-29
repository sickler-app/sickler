import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sickler/screens/global_components/global_components.dart';

import '../../core/core.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isGenotypeKnown = false;

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SicklerAppBar(
                    pageTitle: "Personal\nInfo",
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
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/svg/ruler.svg",
                        colorFilter: ColorFilter.mode(
                            theme.colorScheme.primary, BlendMode.srcIn),
                      ),
                      const SizedBox(width: 4),
                      Text("Your Height", style: theme.textTheme.bodyMedium),
                    ],
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: heightController,
                    keyboardType: TextInputType.number,
                    decoration: SicklerInputDecoration.inputDecoration(context)
                        .copyWith(hintText: "Height"),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/svg/weight.svg",
                        colorFilter: ColorFilter.mode(
                            theme.colorScheme.primary, BlendMode.srcIn),
                      ),
                      const SizedBox(width: 4),
                      Text("Your Weight", style: theme.textTheme.bodyMedium),
                    ],
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    decoration: SicklerInputDecoration.inputDecoration(context)
                        .copyWith(
                      hintText: "Weight",
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/svg/dna.svg",
                        colorFilter: ColorFilter.mode(
                            theme.colorScheme.primary, BlendMode.srcIn),
                      ),
                      const SizedBox(width: 4),
                      Text("Your Genotype", style: theme.textTheme.bodyMedium),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 64,
                    width: 64,
                    color: SicklerColours.neutral90,
                  ),
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

                  const SizedBox(height: 32),
                  const Spacer(),

                  ///Buttons
                  SicklerButton(
                      onPressed: () {
                        //Todo: Continue
                      },
                      label: "Continue"),

                  const SizedBox(height: 64)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
