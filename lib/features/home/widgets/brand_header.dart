import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/ui_helpers.dart';

class BrandHeader extends StatelessWidget {
  const BrandHeader({super.key});

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: const LinearGradient(
                colors: [C.blue, C.cyan],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: C.blue.withValues(alpha: .25),
                  blurRadius: 18,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: const Icon(Icons.scatter_plot_rounded,
                color: Colors.white, size: 27),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('CONCEPTLAB',
                    style: TextStyle(
                        color: C.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.7)),
                SizedBox(height: 3),
                Text('UNDERSTAND. EXPERIMENT. DISCOVER.',
                    style: TextStyle(
                        color: C.muted,
                        fontSize: 8.5,
                        letterSpacing: .9)),
              ],
            ),
          ),
          IconButton(
            onPressed: () => showAppMessage(
                context, 'You are all caught up. New discoveries will appear here.'),
            icon: const Icon(Icons.notifications_none_rounded,
                color: C.muted, size: 25),
          ),
          const SizedBox(width: 2),
          const CircleAvatar(
            radius: 17,
            backgroundColor: Color(0xFF123B68),
            child: Icon(Icons.person_rounded, color: C.cyan, size: 20),
          ),
        ],
      );
}
