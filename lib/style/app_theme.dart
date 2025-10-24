import 'package:flutter/material.dart';
import 'package:sights_app/style/colors.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Montserrat',
  extensions: const [
    AppColors(
      text: textColorLight,
      background: backgroundColorLight,
      border: borderColorLight,
      error: errorColorLight,
      gradientBegin: gradientBeginColorLight,
      gradientEnd: gradientEndColorLight,
      cardText: cardTextColorLight,
    ),
  ],
);
