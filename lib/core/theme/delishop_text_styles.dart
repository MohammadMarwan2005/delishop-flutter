import 'package:flutter/material.dart';

import 'delishop_colors.dart';
import 'font_weight_helper.dart';

abstract class DelishopTextStyles {
  static TextStyle font28BlackBold = const TextStyle(
    fontSize: 28,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );
  static TextStyle font24OrangeBold = TextStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.bold,
    color: DelishopColors.primary,
  );
  static TextStyle font32OrangeBold = TextStyle(
    fontSize: 32,
    fontWeight: FontWeightHelper.bold,
    color: DelishopColors.primary,
  );
  static TextStyle font32BlackBold = const TextStyle(
    fontSize: 32,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );
  static TextStyle font14RegularGrey = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.regular,
    color: DelishopColors.grey,
  );
  static TextStyle font15MediumBlack = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeightHelper.medium,
    color: Colors.black,
  );
  static TextStyle font12MediumBlack = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.medium,
    color: Colors.black,
  );
  static TextStyle font16SemiBoldWhite = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.white,
  );
  static TextStyle font16SemiBoldBlack = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.black,
  );
  static TextStyle font18SemiBoldBlack = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.black,
  );
  static TextStyle font16SemiBoldGreen = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.w600, color: Colors.green);

  static TextStyle font16RegularGrey = TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.regular,
    color: DelishopColors.grey,
  );

  static TextStyle font13VeryLightGrey = TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.regular,
    color: DelishopColors.grey,
  );

  static TextStyle font13BoldBlack = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );

  static var priceStyle = TextStyle(
      fontSize: 18, fontWeight: FontWeight.w700, color: DelishopColors.primary);
}
