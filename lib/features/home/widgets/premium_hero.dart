import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import 'energy_core.dart';
import 'hero_star_painter.dart';

class PremiumHero extends StatelessWidget {
  final VoidCallback onTap;
  const PremiumHero({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) => Container(
        height: 300,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: C.line),
          gradient: const LinearGradient(
            colors: [Color(0xFF102C4C), Color(0xFF0A1B30), Color(0xFF08172A)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: C.blue.withValues(alpha: .08),
              blurRadius: 28,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Stack(
          children: [
            const Positioned(
              right: -32,
              top: 2,
              bottom: 0,
              width: 270,
              child: EnergyCore(),
            ),
            Positioned.fill(
              child: IgnorePointer(child: CustomPaint(painter: HeroStarPainter())),
            ),
            Positioned(
              left: 20,
              top: 23,
              bottom: 20,
              child: SizedBox(
                width: 205,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 9, vertical: 5),
                      decoration: BoxDecoration(
                        color: C.blue.withValues(alpha: .16),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: C.blue.withValues(alpha: .3)),
                      ),
                      child: const Text('THE WORLD IS YOUR LAB',
                          style: TextStyle(
                              color: C.cyan,
                              fontSize: 8,
                              letterSpacing: 1.1,
                              fontWeight: FontWeight.w800)),
                    ),
                    const SizedBox(height: 14),
                    const Text('Curiosity is your superpower.',
                        style: TextStyle(
                            color: C.white,
                            fontSize: 21,
                            height: 1.15,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -.4)),
                    const SizedBox(height: 9),
                    const Text('Turn big questions into discoveries.',
                        style: TextStyle(
                            color: C.muted, fontSize: 12, height: 1.4)),
                    const Spacer(),
                    FilledButton(
                      onPressed: onTap,
                      style: FilledButton.styleFrom(
                        backgroundColor: C.blue,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Start exploring',
                              style: TextStyle(fontWeight: FontWeight.w700)),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward_rounded, size: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
