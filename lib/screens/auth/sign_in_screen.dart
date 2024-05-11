import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/models/auth/sickler_user_model.dart';
import 'package:sickler/screens/global_components/global_components.dart';

import '../../main.dart';

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
    final authProviderNotifier = ref.watch(authProvider.notifier);
    print("print the state during sign in");
print(ref.watch(authProvider));
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SicklerAppBar(pageTitle: "Sign In"),
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
                        const Gap(32),
                        const Spacer(),

                        ///Buttons
                        SicklerButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await authProviderNotifier
                                    .signInWithEmailAndPassword(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                );
                              }

                            },
                            label: "Sign In"),

                        const Gap(16),
                        Row(
                          children: [
                            Expanded(
                              child: SicklerButton(
                                  color: theme.iconTheme.color,
                                  overrideIconColor: false,
                                  buttonType: SicklerButtonType.outline,
                                  iconPath: "assets/svg/google.svg",
                                  onPressed: () {
                                    //Todo: Perform Google Sign In Action
                                  },
                                  label: "Continue"),
                            ),
                            const Gap(16),
                            Expanded(
                              child: SicklerButton(
                                  color: theme.iconTheme.color,
                                  // overrideIconColor: false,
                                  buttonType: SicklerButtonType.outline,
                                  onPressed: () {
                                    //Todo: Perform Apple Sign In Option
                                  },
                                  iconPath: "assets/svg/apple.svg",
                                  label: "Continue"),
                            ),
                          ],
                        ),
                        const Gap(12),
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
                            child: SicklerButton(
                              isChipButton: true,
                              buttonType: SicklerButtonType.text,
                              onPressed: () {
                                //  Todo: Navigate to Create Account Screen
                              },
                              label: "Create an Account",
                            )),
                        const Gap(64)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
