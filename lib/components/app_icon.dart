import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///A Versatile Icon that can either take in an IconData
///as input or a path to an SVG and display without
///having to do a bunch of if or else's 😉
///
class AppIcon extends StatelessWidget {
  ///Might rename this to something more general
  final IconData? icon;
  final String? iconPath;
  final Color? color;
  final double? size;
  const AppIcon({super.key, this.icon, this.iconPath, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    if (icon == null && iconPath == null) {
      throw ArgumentError(
          "Must add either and `icon` or an `iconPath` property");
    }
    if (icon != null && iconPath != null) {
      throw ArgumentError(
          "Cannot set both an `icon` and an `iconPath` property simultaneously, consider removing one");
    }
    final ThemeData theme = Theme.of(context);
    return icon != null
        ? Icon(
            icon,
            color: color ?? theme.iconTheme.color,
            size: size,
          )
        : SvgPicture.asset(iconPath ?? "",
            width: size,
            colorFilter: ColorFilter.mode(
                color ?? theme.iconTheme.color!, BlendMode.srcIn));
  }
}
