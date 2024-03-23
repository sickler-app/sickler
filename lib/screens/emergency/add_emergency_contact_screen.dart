import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/screens/meds/components/components.dart';
import 'package:sickler/screens/meds/components/meds_type_item.dart';

import '../global_components/global_components.dart';

class AddEmergencyContactScreen extends StatefulWidget {
  const AddEmergencyContactScreen({super.key});

  @override
  State<AddEmergencyContactScreen> createState() =>
      _AddEmergencyContactScreenState();
}

class _AddEmergencyContactScreenState extends State<AddEmergencyContactScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              const SicklerAppBar(
                pageTitle: "Add Emergency\nContacts",
              ),
              SicklerEditableAvatar(
                  imagePath: "assets/images/memoji.png", onEditPressed: () {}),
              const Gap(
                48,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(FluentIcons.person_24_regular,
                            color: theme.colorScheme.primary),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Name",
                          style: theme.textTheme.bodyMedium,
                        )
                      ],
                    ),
                    const Gap(
                      12,
                    ),
                    TextFormField(
                      controller: nameController,
                      decoration:
                          SicklerInputDecoration.inputDecoration(context)
                              .copyWith(hintText: "Name"),
                    ),
                    const Gap(
                      24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(FluentIcons.call_24_regular,
                            color: theme.colorScheme.primary),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Phone",
                          style: theme.textTheme.bodyMedium,
                        )
                      ],
                    ),
                    const Gap(8),
                    TextFormField(
                      controller: phoneController,
                      decoration:
                          SicklerInputDecoration.inputDecoration(context)
                              .copyWith(
                        hintText: "Phone Number",
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            FluentIcons.add_24_regular,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                    const Gap(12),
                    const Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 16,
                      children: [
                        SicklerChip(
                          label: "6 77 77 77 77",
                          chipType: SicklerChipType.info,
                        ),
                        SicklerChip(
                            label: "6 77 77 77 77",
                            chipType: SicklerChipType.info),
                      ],
                    ),
                    const Gap(24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          FluentIcons.people_24_regular,
                          color: theme.colorScheme.primary,
                        ),
                        const Gap(
                          4,
                        ),
                        Text(
                          "Relation",
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    const Gap(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///Todo: Replace with the actual relations
                        MedsTypeItem(
                            medicationType: MedicationType.droplets,
                            onPressed: () {}),
                        MedsTypeItem(
                            medicationType: MedicationType.droplets,
                            onPressed: () {}),
                        MedsTypeItem(
                            medicationType: MedicationType.droplets,
                            onPressed: () {}),
                        MedsTypeItem(
                            medicationType: MedicationType.droplets,
                            onPressed: () {}),
                      ],
                    )
                  ],
                ),
              ),
              const Gap(64),
            ],
          ),
        ),
      ),
    );
  }
}

