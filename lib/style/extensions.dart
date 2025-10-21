import 'package:flutter/material.dart';
import 'package:sights_app/style/text_styles.dart';

extension StyleExtensions on BuildContext {
  TextStyle get textSubtitle => Theme.of(this).textTheme.subtitleTextStyle;
}