import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class LabBanner extends StatelessWidget {
  final VoidCallback onTap;
  const LabBanner({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) => Material(
        color: C.panel,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(18),
          child: Container(
            padding: const EdgeInsets.all(17),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: C.line),
            ),
            child: const Row(
              children: [
                Icon(Icons.science_outlined, color: C.mint, size: 27),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('STEP INTO THE LAB',
                          style: TextStyle(
                              color: C.mint,
                              fontSize: 9,
                              letterSpacing: 1.3,
                              fontWeight: FontWeight.w800)),
                      SizedBox(height: 5),
                      Text('Test an idea. See what happens.',
                          style: TextStyle(
                              color: C.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_rounded, color: C.cyan),
              ],
            ),
          ),
        ),
      );
}
