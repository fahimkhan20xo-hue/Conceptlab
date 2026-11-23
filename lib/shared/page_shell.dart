import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../features/home/widgets/brand_header.dart';
import '../features/home/widgets/eyebrow.dart';

class PageShell extends StatelessWidget {
  final String eyebrow, title, subtitle;
  final Widget child;
  const PageShell({
    super.key,
    required this.eyebrow,
    required this.title,
    required this.subtitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 22, 20, 30),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const BrandHeader(),
                const SizedBox(height: 34),
                Eyebrow(eyebrow),
                const SizedBox(height: 9),
                Text(title,
                    style: const TextStyle(
                        color: C.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -.8)),
                const SizedBox(height: 8),
                Text(subtitle,
                    style: const TextStyle(
                        color: C.muted, fontSize: 12, height: 1.5)),
                const SizedBox(height: 28),
                child,
              ]),
            ),
          ),
        ],
      );
}
