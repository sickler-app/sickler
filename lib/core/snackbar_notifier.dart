import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/components.dart';
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
          data: (data) {},
          // data: (user) {
          //   ScaffoldMessenger.of(context).clearSnackBars();
          //   showCustomSnackBar(
          //     context: context,
          //     message: "Success",
          //     mode: SnackBarMode.success,
          //   );
          // },
          error: (error, stackTrace) {
            ScaffoldMessenger.of(context).clearSnackBars();
            showCustomSnackBar(
              message: (error as Failure).message ?? "Error",
              mode: SnackBarMode.error,
              context: context,
            );
          },
          loading: () {}
          // loading: () {
          //   ScaffoldMessenger.of(context).clearSnackBars();
          //   showCustomSnackBar(
          //     context: context,
          //     message: "Loading",
          //     mode: SnackBarMode.loading,
          //   );
          // },
          );
    });

    return child;
  }
}
