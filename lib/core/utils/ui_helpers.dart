import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

void showAppMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: C.white, fontSize: 13),
        ),
        backgroundColor: C.panel2,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.all(14),
        duration: const Duration(seconds: 3),
      ),
    );
}
