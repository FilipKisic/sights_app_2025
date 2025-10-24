import 'package:flutter/material.dart';
import 'package:sights_app/style/colors.dart';
import 'package:sights_app/style/extensions.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.colorGradientBegin,
            context.colorGradientEnd,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      width: double.maxFinite,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: () {},
        child: Text(
          "Sign in",
          style: context.textButton,
        ),
      ),
    );
  }
}
