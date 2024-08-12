import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wenia_test/i18n/strings.g.dart';
import 'package:wenia_test/utils/app_durations.dart';
import 'package:wenia_test/utils/app_spacing.dart';

abstract class CustomViewModel<T> extends StateNotifier<T> {
  CustomViewModel(super.state);

  void showLoading(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      barrierColor: Theme.of(context).colorScheme.onPrimaryContainer,
      useSafeArea: false,
      useRootNavigator: false,
      builder: (BuildContext buildContext) => Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  void closeLoading(BuildContext context) {
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }

  void showSnackbar({
    required String message,
    required BuildContext context,
    VoidCallback? onPressed,
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: AppDurations.snackBarDuration,
        action: action,
        backgroundColor: Theme.of(context).primaryColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.small),
        ),
        margin: const EdgeInsets.all(AppSpacing.large),
      ),
    );
  }

  void showErrorSnackbar({
    required BuildContext context,
    VoidCallback? onPressed,
    String? message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: SnackBar(
          content: Text(message ?? t.error),
          backgroundColor: Theme.of(context).colorScheme.error,
          action: onPressed != null
              ? SnackBarAction(label: t.retry, onPressed: onPressed)
              : null,
        ),
      ),
    );
  }
}
