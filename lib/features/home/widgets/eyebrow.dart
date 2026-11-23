import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class Eyebrow extends StatelessWidget {
  final String text;
  const Eyebrow(this.text, {super.key});

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: const TextStyle(
            color: C.cyan,
            fontSize: 10,
            fontWeight: FontWeight.w800,
            letterSpacing: 2),
      );
}
