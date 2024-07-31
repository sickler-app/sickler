import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/models/models.dart';
import 'package:sickler/screens/auth/sign_in_screen.dart';
import 'package:sickler/screens/global_components/global_components.dart';

import '../../providers/providers.dart';
import '../global_components/bottom_nav_bar.dart';
import '../profile/profile_basic_info_screen.dart';
import 'auth_success.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  static const String id = "register";
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;
    final authProviderNotifier = ref.watch(authProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SicklerAppBar(
                pageTitle: "Register",
                showBackButton: false,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Email", style: theme.textTheme.bodyMedium),
                      const Gap(8),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration:
                            SicklerInputDecoration.inputDecoration(context)
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
                            SicklerInputDecoration.inputDecoration(context)
                                .copyWith(
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
                                    !isDarkMode
                                        ? theme.colorScheme.primary
                                        : theme.iconTheme.color!,
                                    BlendMode.srcIn),
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
                      const Gap(24),
                      Text("Confirm Password",
                          style: theme.textTheme.bodyMedium),
                      const Gap(8),
                      TextFormField(
                        controller: confirmPasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _obscureText,
                        decoration:
                            SicklerInputDecoration.inputDecoration(context)
                                .copyWith(
                          hintText: "Confirm Password",
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
                                    !isDarkMode
                                        ? theme.colorScheme.primary
                                        : theme.iconTheme.color!,
                                    BlendMode.srcIn),
                              )),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please input an password";
                          } else if (value.length < 8) {
                            return "Password cannot be less than 8 characters";
                          } else if (value != passwordController.text.trim()) {
                            return "Passwords don't match";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const Gap(32),
                      const Spacer(),

                      ///Buttons
                      SicklerButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              //Register
                              await authProviderNotifier
                                  .registerWithEmailAndPassword(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );

                              //Get the user from authProvider after signing up.
                              await ref
                                  .watch(authProvider.notifier)
                                  .getCurrentUser();
                              SicklerUser user = ref.watch(authProvider).value!;

                              //Get User Prefs
                              final UserPreferences prefs =
                                  ref.watch(userProvider).value!.preferences;

                              if (context.mounted) {
                                if (prefs.isFirstTime) {
                                  //Set is first time to false and update db
                                  user = user.copyWith(
                                      preferences:
                                          prefs.copyWith(isFirstTime: false));

                                  ref
                                      .watch(userProvider.notifier)
                                      .addUserData(user: user);

                                  //mark as not first time
                                  context.goNamed(AuthSuccessScreen.id);
                                } else {
                                  if (prefs.isOnboardingComplete) {
                                    context.goNamed(BottomNavBar.id);
                                  } else {
                                    context.goNamed(ProfileBasicInfoScreen.id);
                                  }
                                }
                              }
                            }
                          },
                          label: "Sign Up"),
                      const Gap(16),

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
                              isChipButton: true,
                              buttonType: SicklerButtonType.text,
                              onPressed: () {
                                // context.pushReplacementNamed(SignInScreen.id);

                                context.goNamed(SignInScreen.id);

                                // Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignInScreen()));
                              },
                              label: "Sign In Instead",
                            ),
                          )),
                      const Gap(32)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
