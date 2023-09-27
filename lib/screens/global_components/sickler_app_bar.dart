import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SicklerAppBar extends StatelessWidget {
  final String pageTitle;
  final bool? showAction;
  final String? actionIconLink;

  const SicklerAppBar(
      {super.key,
      required this.pageTitle,
      this.showAction = false,
      this.actionIconLink});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    if (showAction == true && actionIconLink == null) {
      throw ErrorHint(
          "Did you forget to provide an icon link for the action? Please provide a path for the action icon");
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 64),
        Row(
          children: [
            IconButton(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/svg/chevron-back.svg",
                colorFilter:
                    ColorFilter.mode(theme.iconTheme.color!, BlendMode.srcIn),
              ),
            ),
            const Spacer(),
            Visibility(
              visible: showAction!,
              child: IconButton(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/svg/chevron-back.svg",
                  colorFilter:
                      ColorFilter.mode(theme.iconTheme.color!, BlendMode.srcIn),
                ),
              ),
            ),
          ],
        ),
        Text(pageTitle, style: theme.textTheme.displaySmall),
        const SizedBox(height: 48),
      ],
    );
  }
}
