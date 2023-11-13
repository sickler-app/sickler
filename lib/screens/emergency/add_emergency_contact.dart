import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sickler/core/constants.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/screens/meds/components/components.dart';

import '../global_components/global_components.dart';

class AddEmergencyContact extends StatefulWidget {
  const AddEmergencyContact({super.key});

  @override
  State<AddEmergencyContact> createState() => _AddEmergencyContactState();
}

class _AddEmergencyContactState extends State<AddEmergencyContact> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
      body: Form(
        child: Column(
          children: [
            SicklerAppBar(
              pageTitle: "Add Emergency\nContacts",
            ),
            Stack(
              children: [
                CircleAvatar(
                  radius: 56,
                  child: Image.asset("assets/image/memoji.png"),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: IconButton.filled(
                    color: theme.colorScheme.primary,
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/svg/edit.svg",
                        colorFilter: ColorFilter.mode(
                            SicklerColours.white, BlendMode.srcIn)),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 48,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  "assets/svg/person.svg",
                  colorFilter: ColorFilter.mode(
                      theme.colorScheme.primary, BlendMode.srcIn),
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "Name",
                  style: theme.textTheme.bodyMedium,
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            TextFormField(
              controller: nameController,
              decoration: SicklerInputDecoration.inputDecoration(context)
                  .copyWith(hintText: "Name"),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  "assets/svg/phone.svg",
                  colorFilter: ColorFilter.mode(
                      theme.colorScheme.primary, BlendMode.srcIn),
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "Phone",
                  style: theme.textTheme.bodyMedium,
                )
              ],
            ),
            TextFormField(
              controller: phoneController,
              decoration:
                  SicklerInputDecoration.inputDecoration(context).copyWith(
                hintText: "Phone Number",
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/svg/plus.svg",
                    colorFilter: ColorFilter.mode(
                        theme.iconTheme.color!, BlendMode.srcIn),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Wrap(
              children: [
                SicklerChip(
                  label: "6 77 77 77 77",
                  chipType: SicklerChipType.info,
                ),
                SicklerChip(
                    label: "6 77 77 77 77", chipType: SicklerChipType.info),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  "assets/svg/relationship.svg",
                  colorFilter: ColorFilter.mode(
                      theme.colorScheme.primary, BlendMode.srcIn),
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "Relation",
                  style: theme.textTheme.bodyMedium,
                ),
                Row(
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
          ],
        ),
      ),
    );
  }
}
