import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screens/global_components/snackbar.dart';
import '../screens/shared/components_global/components.dart';
import 'core.dart';

class SnackBarNotifier extends ConsumerWidget {
  final Widget child;
  final AsyncNotifierProvider provider;

  const SnackBarNotifier({
    super.key,
    required this.child,
    required this.provider,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(provider, (previous, next) {
      next.when(
        data: (user) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(
              context: context,
              message: "Success",
              mode: SnackBarMode.success,
            ),
          );
        },
        error: (error, stackTrace) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(
              message: (error as Failure).message ?? "Error",
              mode: SnackBarMode.error,
              context: context,
            ),
          );
        },
        loading: () {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(
              context: context,
              message: "Loading",
              mode: SnackBarMode.loading,
            ),
          );
        },
      );
    });

    return child;
  }
}
