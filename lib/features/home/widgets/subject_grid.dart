import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class SubjectGrid extends StatelessWidget {
  final VoidCallback onTap;
  const SubjectGrid({super.key, required this.onTap});

  static const items = [
    ('Physics', Icons.bolt_rounded, C.cyan, 'Learning path available'),
    ('Chemistry', Icons.science_rounded, C.mint, 'Explore foundations'),
    ('Biology', Icons.biotech_rounded, C.violet, 'Explore life sciences'),
    ('Mathematics', Icons.functions_rounded, Color(0xFFFFC477),
        'Explore patterns'),
  ];

  @override
  Widget build(BuildContext context) => GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.48,
        ),
        itemBuilder: (_, i) {
          final item = items[i];
          return Material(
            color: C.panel,
            borderRadius: BorderRadius.circular(17),
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(17),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  border: Border.all(color: C.line),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item.$2, color: item.$3, size: 25),
                    const SizedBox(height: 9),
                    Text(item.$1,
                        style: const TextStyle(
                            color: C.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 13)),
                    const SizedBox(height: 3),
                    Text(item.$4,
                        style: const TextStyle(
                            color: C.muted, fontSize: 9)),
                  ],
                ),
              ),
            ),
          );
        },
      );
}
