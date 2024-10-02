import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sickler/core/constants.dart';
import 'package:sickler/providers/providers.dart';
import 'package:sickler/screens/global_components/global_components.dart';
import 'package:sickler/screens/profile/profile_basic_info_screen.dart';

class AuthSuccessScreen extends ConsumerStatefulWidget {
  static const id = "auth_success";
  const AuthSuccessScreen({super.key});

  @override
  ConsumerState<AuthSuccessScreen> createState() => _AuthSuccessScreenState();
}

class _AuthSuccessScreenState extends ConsumerState<AuthSuccessScreen> {
  late String userName;
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   await ref.read(userProvider.notifier).getCurrentUserData();
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    String userName = ref.watch(userProvider).value!.profile.displayName ??
        ref.watch(userProvider).value!.email;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Spacer(),
            Text(
              "Hey there,",
              style: theme.textTheme.headlineLarge,
            )
                .animate()
                .moveY(
                    duration: 1500.ms,
                    curve: Curves.easeInOutQuart,
                    begin: 150,
                    end: 0)
                .fadeIn(duration: 800.ms, delay: 600.ms),
            const Gap(kPadding16),
            Text(
              userName.split(" ").first,
              style: theme.textTheme.displayLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: theme.colorScheme.primary),
            )
                .animate(delay: 1000.ms)
                .moveY(
                    duration: 1500.ms,
                    curve: Curves.easeInOutQuart,
                    begin: 120,
                    end: 0)
                .fadeIn(duration: 800.ms, delay: 600.ms),
            const Gap(kPadding48),
            Text(
              "We're glad you're here!",
              style: theme.textTheme.headlineLarge,
            )
                .animate(delay: 2500.ms)
                .moveY(
                    duration: 1500.ms,
                    curve: Curves.easeInOutQuart,
                    begin: 120,
                    end: 0)
                .fadeIn(duration: 800.ms, delay: 600.ms),

            // Row(
            //   children: [
            //     Text("Welcome to ", style: theme.textTheme.headlineLarge)
            //         .animate(delay: 3000.ms)
            //         .moveY(
            //             duration: 1500.ms,
            //             curve: Curves.easeInOutQuart,
            //             begin: 120,
            //             end: 0)
            //         .fadeIn(duration: 800.ms, delay: 600.ms),
            //     Text("Sickler",
            //             style: theme.textTheme.headlineLarge!.copyWith(
            //                 fontWeight: FontWeight.w700,
            //                 color: theme.colorScheme.primary))
            //         .animate(delay: 3500.ms)
            //         .moveY(
            //             duration: 1500.ms,
            //             curve: Curves.easeInOutQuart,
            //             begin: 120,
            //             end: 0)
            //         .fadeIn(duration: 800.ms, delay: 600.ms),
            //   ],
            // ),
            const Spacer(),
            SicklerButton(
                    onPressed: () {
                      context.goNamed(ProfileBasicInfoScreen.id);
                    },
                    label: "Continue")
                .animate(delay: 3500.ms)
                .moveY(
                    duration: 1500.ms,
                    curve: Curves.easeInOutQuart,
                    begin: 150,
                    end: 0)
                .fadeIn(duration: 800.ms, delay: 600.ms),
            const Gap(64),
          ],
        ),
      ),
    );
  }
}
