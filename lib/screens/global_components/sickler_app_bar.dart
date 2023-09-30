import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SicklerAppBar extends StatelessWidget {
  final String pageTitle;
  final List<Widget>? actions;
  final bool? showTitle;

  const SicklerAppBar(
      {super.key,
      required this.pageTitle,
      this.actions,
      this.showTitle = true});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 64),
        Row(
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/svg/chevron-back.svg",
                colorFilter:
                    ColorFilter.mode(theme.iconTheme.color!, BlendMode.srcIn),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Visibility(
                visible: actions != null ? true : false,
                child: Row(
                  children: actions ?? [],
                ),
              ),
            )
          ],
        ),
        Visibility(
          visible: showTitle!,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(pageTitle, style: theme.textTheme.displaySmall),
          ),
        ),
        const SizedBox(height: 48),
      ],
    );
  }
}
