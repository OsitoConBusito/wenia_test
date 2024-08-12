import 'package:flutter/material.dart';
import 'package:wenia_test/utils/app_spacing.dart';

class AppPaddings {
  // Uniform extra small padding of 4.0 points on all sides
  static const EdgeInsets xSmall = EdgeInsets.all(AppSpacing.xSmall);

  // Uniform small padding of 8.0 points on all sides
  static const EdgeInsets small = EdgeInsets.all(AppSpacing.small);

  // Uniform medium padding of 16.0 points on all sides
  static const EdgeInsets medium = EdgeInsets.all(AppSpacing.medium);

  // Uniform large padding of 24.0 points on all sides
  static const EdgeInsets large = EdgeInsets.all(AppSpacing.large);

  // Uniform extra-large padding of 32.0 points on all sides
  static const EdgeInsets xLarge = EdgeInsets.all(AppSpacing.xLarge);

  // Uniform extra-extra-large padding of 40.0 points on all sides
  static const EdgeInsets xxLarge = EdgeInsets.all(AppSpacing.xxLarge);

  // Medium horizontal padding of 16.0 points, applied to the left and right sides
  static const EdgeInsets horizontalMedium =
      EdgeInsets.symmetric(horizontal: AppSpacing.medium);

  // Small vertical padding of 8.0 points, applied to the top and bottom sides
  static const EdgeInsets verticalSmall =
      EdgeInsets.symmetric(vertical: AppSpacing.small);

  // Medium vertical padding of 16.0 points, applied to the top and bottom sides
  static const EdgeInsets verticalMedium =
      EdgeInsets.symmetric(vertical: AppSpacing.medium);
}
