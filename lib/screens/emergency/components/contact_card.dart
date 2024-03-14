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
                    fixedSize: Size.square(100),
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
                        icon: Icon(FluentIcons.edit_16_regular)),
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
                                 isChipButton:true,
                                onPressed: () {},
                                label: "Cancel",
                                buttonType: SicklerButtonType.text,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Center(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        FluentIcons.delete_16_regular,
                                        color: theme.colorScheme.error,
                                      ),
                                      Gap(4),
                                      Text(
                                        "Delete",
                                        style: theme.textTheme.bodyMedium!
                                            .copyWith(
                                                color: theme.colorScheme.error),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              //  SicklerButton( isChipButton:true,
                              //   onPressed: () {
                              //     ///Todo:Delete contact
                              //   },
                              //   label: "Delete",
                              //   backgroundColor: theme.colorScheme.error,
                              //   color: SicklerColours.white,
                              //   iconPath: "assets/svg/delete.svg",
                              // ),
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
                Spacer(),
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/memoji.png"),
                  ),
                ),
                Spacer(),
                Text("Nuikweh Lewis", style: theme.textTheme.bodyMedium),
                Gap(2),
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
