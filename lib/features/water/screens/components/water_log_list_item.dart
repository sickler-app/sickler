import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/core.dart';
import '../../water.dart';


class WaterLogListItem extends StatelessWidget {
  final WaterLog log;
  final Function(WaterLog log) onEditPressed;
  final VoidCallback onDeletePressed;
  const WaterLogListItem(
      {super.key,
      required this.log,
      required this.onEditPressed,
      required this.onDeletePressed});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: isDarkMode
                ? AppColours.neutral20
                : AppColours.neutral90,
          ),
          // color: isDarkMode
          //     ? SicklerColours.neutral20
          //     : SicklerColours.neutral95,
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: 8, horizontal: kPadding16),
        child: Row(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/svg/droplet-alt.svg",
                  colorFilter: const ColorFilter.mode(
                      AppColours.neutral50, BlendMode.srcIn),
                ),
                const Gap(kPadding8),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "${log.amount} ${log.unit.symbol}  ",
                      style: theme.textTheme.titleMedium),
                  TextSpan(
                      text:
                          TimeOfDay.fromDateTime(log.timestamp).format(context),
                      style: theme.textTheme.bodySmall!
                          .copyWith(color: AppColours.neutral50))
                ])),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      //Todo: Show a popup to edit the log, then update the log;
                      onEditPressed.call(log);
                    },
                    icon: const Icon(
                      FluentIcons.edit_24_regular,
                    )),
                IconButton(
                  onPressed: onDeletePressed,
                  icon: SvgPicture.asset(
                    "assets/svg/delete.svg",
                    colorFilter: ColorFilter.mode(
                        theme.colorScheme.error, BlendMode.srcIn),
                  ),

                  // Icon(
                  //   FluentIcons.delete_24_regular,
                  //   color: theme.colorScheme.error,
                  // ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
