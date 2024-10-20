import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class EditableAvatar extends StatelessWidget {
  final VoidCallback onEditPressed;
  final String imagePath;
  final double? radius;
  const EditableAvatar(
      {super.key,
      required this.onEditPressed,
      required this.imagePath,
      this.radius});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Stack(
      children: [
        CircleAvatar(
          radius: radius ?? 64,
          backgroundImage: AssetImage(imagePath),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: IconButton.filled(
              color: theme.colorScheme.primary,
              onPressed: onEditPressed,
              icon: const Icon(
                FluentIcons.edit_24_regular,
                color: Colors.white,
              )),
        )
      ],
    );
  }
}
