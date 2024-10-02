import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/screens/auth/register_screen.dart';
import 'package:sickler/screens/global_components/global_components.dart';
import 'package:sickler/screens/profile/profile_basic_info_screen.dart';

import '../../models/models.dart';
import '../../providers/providers.dart';
import '../global_components/bottom_nav_bar.dart';
import 'auth_success.dart';

class SignInScreen extends ConsumerStatefulWidget {
  static const String id = "sign_in";
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final authNotifier = ref.read(authProvider.notifier);
    final userNotifier = ref.read(userProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SicklerAppBar(
                  pageTitle: "Sign In",
                  showBackButton: false,
                ),
                Text("Email", style: theme.textTheme.bodyMedium),
                const Gap(8),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: SicklerInputDecoration.inputDecoration(context)
                      .copyWith(hintText: "Email"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please input an email";
                    } else {
                      return null;
                    }
                  },
                ),
                const Gap(24),
                Text("Password", style: theme.textTheme.bodyMedium),
                const Gap(8),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _obscureText,
                  decoration:
                      SicklerInputDecoration.inputDecoration(context).copyWith(
                    hintText: "Password",
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        icon: SvgPicture.asset(
                          _obscureText
                              ? "assets/svg/eye.svg"
                              : "assets/svg/eye-off.svg",
                          colorFilter: ColorFilter.mode(
                              theme.iconTheme.color!, BlendMode.srcIn),
                        )),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please input an password";
                    } else if (value.length < 8) {
                      return "Password cannot be less than 8 characters";
                    } else {
                      return null;
                    }
                  },
                ),

                const Gap(16),
                const Spacer(),

                ///Buttons
                SicklerButton(
                  label: "Sign In",
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await authNotifier.signInWithEmailAndPassword(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim());

                      if (authNotifier.isSuccessful) {
                        await userNotifier.getCurrentUserData();
                        SicklerUser user = ref.watch(userProvider).value!;
                        if (context.mounted) {
                          showCustomSnackBar(
                              context: context,
                              message: "Signed in successfully",
                              mode: SnackBarMode.success);
                          if (user.preferences.isFirstTime) {
                            ///Set as is Not First Time
                            await userNotifier.updateUserData(
                                user: user.copyWith(
                                    preferences: user.preferences
                                        .copyWith(isFirstTime: false)));

                            if (context.mounted) {
                              context.goNamed(AuthSuccessScreen.id);
                            }
                          } else {
                            if (user.preferences.isOnboarded) {
                              context.goNamed(BottomNavBar.id);
                            } else {
                              context.goNamed(ProfileBasicInfoScreen.id);
                            }
                          }
                        }
                      } else if (authNotifier.errorMessage != null) {
                        if (context.mounted) {
                          showCustomSnackBar(
                              context: context,
                              message: authNotifier.errorMessage!,
                              mode: SnackBarMode.error);
                        }
                      }
                    }
                  },
                ),
                const Gap(kPadding16),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "or",
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: SicklerColours.neutral50),
                  ),
                ),
                Align(
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: SicklerButton(
                        isLoading: ref.watch(authProvider).isLoading,
                        isChipButton: true,
                        buttonType: SicklerButtonType.text,
                        onPressed: () {
                          context.goNamed(RegisterScreen.id);

                          //      Navigator.push(context, MaterialPageRoute(builder: (context)=> const RegisterScreen()));
                        },
                        label: "Create an Account",
                      ),
                    )),
                const Gap(32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
