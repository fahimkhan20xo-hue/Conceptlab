import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class DailyCard extends StatelessWidget {
  final VoidCallback onTap;
  const DailyCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) => Material(
        color: C.panel,
        borderRadius: BorderRadius.circular(19),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(19),
          child: Container(
            padding: const EdgeInsets.all(17),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19),
              gradient: const LinearGradient(
                  colors: [Color(0xFF102F50), Color(0xFF0A1B30)]),
              border: Border.all(color: C.line),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 68,
                  height: 68,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    gradient: const RadialGradient(
                        colors: [Color(0xFF155A9B), Color(0xFF081A31)]),
                  ),
                  child: const Icon(Icons.wb_twilight_rounded,
                      color: C.cyan, size: 42),
                ),
                const SizedBox(width: 13),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('DAILY DISCOVERY  ·  NEW',
                          style: TextStyle(
                              color: C.cyan,
                              fontSize: 8,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w800)),
                      SizedBox(height: 7),
                      Text('Why does the sky turn orange at sunset?',
                          style: TextStyle(
                              color: C.white,
                              fontSize: 13,
                              height: 1.3,
                              fontWeight: FontWeight.w700)),
                      SizedBox(height: 5),
                      Text('Explore the science behind the colours.',
                          style: TextStyle(
                              color: C.muted,
                              fontSize: 10,
                              height: 1.35)),
                    ],
                  ),
                ),
                const SizedBox(width: 6),
                const Icon(Icons.arrow_forward_rounded,
                    color: C.cyan, size: 18),
              ],
            ),
          ),
        ),
      );
}
