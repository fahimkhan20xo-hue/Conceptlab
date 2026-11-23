import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class EnergyCore extends StatefulWidget {
  const EnergyCore({super.key});

  @override
  State<EnergyCore> createState() => _EnergyCoreState();
}

class _EnergyCoreState extends State<EnergyCore>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 24),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final enabled = TickerMode.of(context);
    if (enabled && !controller.isAnimating) {
      controller.repeat();
    } else if (!enabled && controller.isAnimating) {
      controller.stop();
    }
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) => CustomPaint(
        painter: CorePainter(controller.value),
        child: const SizedBox.expand(),
      ),
    );
  }
}

class CorePainter extends CustomPainter {
  final double t;
  CorePainter(this.t);

  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width * .55, size.height * .51);
    final a = t * math.pi * 2;

    canvas.drawCircle(
      c,
      108,
      Paint()
        ..shader = RadialGradient(colors: [
          C.cyan.withValues(alpha: .23),
          C.blue.withValues(alpha: .10),
          Colors.transparent,
        ]).createShader(Rect.fromCircle(center: c, radius: 108)),
    );

    for (int i = 0; i < 4; i++) {
      canvas.save();
      canvas.translate(c.dx, c.dy);
      canvas.rotate(a * (i.isEven ? 1 : -.72) + i * .62);
      final rect = Rect.fromCenter(
        center: Offset.zero,
        width: 102 + i * 20.0,
        height: 45 + i * 13.0,
      );
      canvas.drawOval(
        rect,
        Paint()
          ..color = (i.isEven ? C.cyan : C.blue)
              .withValues(alpha: .48 - i * .065)
          ..style = PaintingStyle.stroke
          ..strokeWidth = i == 0 ? 1.5 : 1,
      );
      canvas.restore();
    }

    final core = Rect.fromCircle(center: c, radius: 37);
    canvas.drawCircle(
      c,
      37,
      Paint()
        ..shader = const RadialGradient(colors: [
          Color(0xFFDDF8FF),
          Color(0xFF62C9FF),
          Color(0xFF1677FF),
          Color(0xFF073B9B),
        ], stops: [
          0,
          .18,
          .62,
          1,
        ]).createShader(core),
    );
    canvas.drawCircle(
      c.translate(-12, -13),
      6,
      Paint()..color = Colors.white.withValues(alpha: .78),
    );

    for (int i = 0; i < 20; i++) {
      final angle = i * math.pi * 2 / 20 + a * (i.isEven ? .3 : -.18);
      final radius = 72 + (i % 4) * 13.0;
      final p = c.translate(
        math.cos(angle) * radius,
        math.sin(angle) * radius * .65,
      );
      canvas.drawCircle(
        p,
        i % 3 == 0 ? 2.5 : 1.4,
        Paint()..color = C.cyan.withValues(alpha: .68),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CorePainter oldDelegate) => oldDelegate.t != t;
}
