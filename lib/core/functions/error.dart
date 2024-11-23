import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bountains/core/extensions/build_context.dart';
import 'package:bountains/core/ui/ui.dart';

void showErrorMessage(BuildContext context, String message) {
  if (!context.mounted) return;

  HapticFeedback.heavyImpact();
  context.messenger
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        backgroundColor: AppColors.error,
        elevation: 1.0,
        content: Text(
          message,
          style: AppTextStyles.title2Semibold.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
}

void showSnackBarWithMessage(BuildContext context, String message,
    {Color? backgroundColor}) {
  if (!context.mounted) return;

  HapticFeedback.heavyImpact();
  context.messenger
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor ?? AppColors.error,
        elevation: 1.0,
        content: Text(
          message,
          style: AppTextStyles.title2Semibold.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
}
