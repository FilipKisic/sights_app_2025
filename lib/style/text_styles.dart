import 'package:flutter/material.dart';

const _subtitleTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
const _textFieldTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
const _buttonTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

extension CustomTextStyle on TextTheme {
  TextStyle get subtitleTextStyle => _subtitleTextStyle;
  TextStyle get textFieldTextStyle => _textFieldTextStyle;
  TextStyle get buttonTextStyle => _buttonTextStyle;

}
