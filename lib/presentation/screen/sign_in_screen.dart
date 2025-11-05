import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sights_app/di.dart';
import 'package:sights_app/presentation/style/extensions.dart';
import 'package:sights_app/presentation/widget/custom_action_button.dart';
import 'package:sights_app/presentation/widget/custom_text_field.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authenticationNotifierProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset("assets/images/sign_in_image.png", height: 275),
              const SizedBox(height: 20),
              Text(
                "Please sign in to your account.",
                style: context.textSubtitle,
              ),
              const SizedBox(height: 40),
              CustomTextField(placeholder: "Email", controller: emailController),
              const SizedBox(height: 20),
              CustomTextField(placeholder: "Password", controller: passwordController),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot password?",
                    style: context.textLabel,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              CustomActionButton(
                onPressed: () {
                  print("Email: ${emailController.text}");
                  print("Password: ${passwordController.text}");
                  ref.read(authenticationNotifierProvider.notifier).signIn(
                        emailController.text,
                        passwordController.text,
                      );
                },
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: context.textSubtitle,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Sign up.",
                      style: context.textSubtitle.copyWith(color: context.colorLink),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
