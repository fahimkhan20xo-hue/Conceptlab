import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class HeroStarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final glow = Paint()
      ..shader = RadialGradient(colors: [
        C.blue.withValues(alpha: .12),
        Colors.transparent,
      ]).createShader(
        Rect.fromCircle(
          center: Offset(size.width * .8, size.height * .48),
          radius: size.width * .55,
        ),
      );
    canvas.drawRect(Offset.zero & size, glow);

    for (int i = 0; i < 42; i++) {
      final x = ((i * 73) % 997) / 997 * size.width;
      final y = ((i * 137) % 991) / 991 * size.height;
      canvas.drawCircle(
        Offset(x, y),
        i % 7 == 0 ? 1.5 : .7,
        Paint()
          ..color = (i % 5 == 0 ? C.violet : C.cyan)
              .withValues(alpha: i % 4 == 0 ? .62 : .24),
      );
    }
  }

  @override
  bool shouldRepaint(covariant HeroStarPainter oldDelegate) => false;
}
