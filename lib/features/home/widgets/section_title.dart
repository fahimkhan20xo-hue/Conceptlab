import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class SectionTitle extends StatelessWidget {
  final String title, action;
  final VoidCallback onTap;
  const SectionTitle({
    super.key,
    required this.title,
    required this.action,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: Text(title,
                style: const TextStyle(
                    color: C.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -.3)),
          ),
          TextButton(
            onPressed: onTap,
            child: Text(action,
                style: const TextStyle(
                    color: C.cyan,
                    fontSize: 11,
                    fontWeight: FontWeight.w700)),
          ),
        ],
      );
}
