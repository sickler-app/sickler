import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/screens/global_components/global_components.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SicklerAppBar(pageTitle: "Register"),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Email", style: theme.textTheme.bodyMedium),
                        const SizedBox(height: 8),
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
                        const SizedBox(height: 24),
                        Text("Password", style: theme.textTheme.bodyMedium),
                        const SizedBox(height: 8),
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
                                      theme.brightness == Brightness.light
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
                        const SizedBox(height: 24),
                        Text("Confirm Password",
                            style: theme.textTheme.bodyMedium),
                        const SizedBox(height: 8),
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
                                      theme.brightness == Brightness.light
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
                            } else if (value !=
                                passwordController.text.trim()) {
                              return "Passwords don't match";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 32),
                        const Spacer(),

                        ///Buttons
                        SicklerButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                //Todo: Perform sign in action
                              }
                            },
                            label: "Sign In"),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: SicklerButton(
                                  color: theme.iconTheme.color,
                                  overrideIconColor: false,
                                  buttonType: SicklerButtonType.outline,
                                  showIcon: true,
                                  iconPath: "assets/svg/google.svg",
                                  onPressed: () {
                                    //Todo: Perform Google Sign In Action
                                  },
                                  label: "Continue"),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: SicklerButton(
                                  color: theme.iconTheme.color,
                                  // overrideIconColor: false,
                                  buttonType: SicklerButtonType.outline,
                                  onPressed: () {
                                    //Todo: Perform Apple Sign In Option
                                  },
                                  showIcon: true,
                                  iconPath: "assets/svg/apple.svg",
                                  label: "Continue"),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
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
                            child: SicklerChipButton(
                              buttonType: SicklerButtonType.text,
                              onPressed: () {
                                //  Todo: Navigate to Create Account Screen
                              },
                              label: "Create an Account",
                            )),
                        const SizedBox(height: 64)
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
