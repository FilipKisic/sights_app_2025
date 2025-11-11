import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sights_app/di.dart';
import 'package:sights_app/presentation/auth/notifier/state/authentication_state.dart';
import 'package:sights_app/presentation/core/app_router.dart';
import 'package:sights_app/presentation/core/style/extensions.dart';
import 'package:sights_app/presentation/core/widget/custom_action_button.dart';
import 'package:sights_app/presentation/auth/widget/custom_text_field.dart';

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

    ref.listen(authenticationNotifierProvider, (_, currentState) {
      if (currentState is AuthenticatedState) {
        Navigator.of(context).pushReplacementNamed(AppRouter.homeScreen);
      }

      if (currentState is ErrorState) {
        ErrorSnackBar.show(context, 'There was an error');
      }
    });

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
                isLoading: state is LoadingState,
                onPressed: () {
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

class ErrorSnackBar {
  static void show(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: context.colorError,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.info_outline,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style:  TextStyle(
                color: context.colorError,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: context.colorError,
          width: 2,
        ),
      ),
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      duration: const Duration(seconds: 4),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
