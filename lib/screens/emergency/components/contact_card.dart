import 'dart:io';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sickler/screens/global_components/global_components.dart';

import '../../../core/core.dart';

class ContactCard extends StatelessWidget {
  final bool showAddContactButton;
  const ContactCard({super.key, this.showAddContactButton = false});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;
    return Container(
      width: 180,
      height: 220,
      padding: const EdgeInsets.only(top: 0, right: 0, left: 12, bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDarkMode ? theme.cardColor : SicklerColours.neutral90,
        ),
      ),
      child: showAddContactButton
          ? Center(
              child: IconButton.filled(
                  style: IconButton.styleFrom(
                    fixedSize: const Size.square(100),
                    elevation: 0,
                    foregroundColor: theme.cardColor,
                    backgroundColor: theme.cardColor,
                  ),
                  splashRadius: 40,
                  onPressed: () {},
                  icon: Icon(
                    FluentIcons.add_16_regular,
                    color: theme.colorScheme.primary,
                  )),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Brother", style: theme.textTheme.bodyMedium),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(FluentIcons.edit_16_regular)),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => SicklerAlertDialog(
                            title: "Delete Contact",
                            message:
                                "Are you sure you want to delete this emergency contact?",
                            actions: [
                              SicklerButton(
                                isChipButton: true,
                                onPressed: () {},
                                label: "Cancel",
                                buttonType: SicklerButtonType.text,
                              ),
                              SicklerButton(
                                isChipButton: true,
                                onPressed: () {
                                  ///Todo:Delete contact
                                },
                                label: "Delete",
                                icon: FluentIcons.delete_16_regular,
                                color: Platform.isIOS
                                    ? theme.colorScheme.error
                                    : Colors.white,
                                backgroundColor: Platform.isIOS
                                    ? null
                                    : theme.colorScheme.error,
                                buttonType: Platform.isIOS
                                    ? SicklerButtonType.text
                                    : SicklerButtonType.primary,
                              ),
                            ],
                          ),
                        );
                      },
                      icon: Icon(
                        FluentIcons.delete_16_regular,
                        color: theme.colorScheme.error,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/memoji.png"),
                  ),
                ),
                const Spacer(),
                Text("Nuikweh Lewis", style: theme.textTheme.bodyMedium),
                const Gap(2),
                Text(
                  "6 77 77 77 77",
                  style: theme.textTheme.bodyMedium!
                      .copyWith(fontWeight: FontWeight.w800),
                ),
              ],
            ),
    );
  }
}
