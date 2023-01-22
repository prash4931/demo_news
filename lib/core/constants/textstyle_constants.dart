import 'package:demo_news/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

class TextStyleConstants {
  TextStyle get itemHeadingTextStyle => const TextStyle(
      fontSize: 16, fontFamily: 'Poppins-Bold', fontWeight: FontWeight.bold);

  TextStyle get appBarHeadingTextStyle => const TextStyle(
      fontSize: 16, fontFamily: 'Poppins-Bold', fontWeight: FontWeight.bold);

  TextStyle get itemDescriptionTextStyle =>
      const TextStyle(fontSize: 15, fontFamily: 'Poppins-Regular');

  TextStyle get itemDateTimeTextStyle => TextStyle(
        fontSize: 12,
        color: ColorConstants().fainterPrimaryColor,
      );
}
