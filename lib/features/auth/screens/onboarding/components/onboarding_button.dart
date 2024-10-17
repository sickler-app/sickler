import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/core.dart';


class OnboardingButton extends StatelessWidget {
  const OnboardingButton(
      {super.key, required this.onPressed, this.backgroundColour, this.colour});
  final VoidCallback onPressed;
  final Color? backgroundColour;
  final Color? colour;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColour ?? theme.colorScheme.primary,
          fixedSize: const Size(84, 84),
          shape: const CircleBorder()),
      child: Center(
        child: SvgPicture.asset(
          "assets/svg/arrow-right.svg",
          colorFilter:
              ColorFilter.mode(colour ?? AppColours.white, BlendMode.srcIn),
        ),
      ),
    );
  }
}
