import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../learn/progress_provider.dart';

class ContinueCard extends ConsumerWidget {
  final VoidCallback onTap;
  const ContinueCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(progressProvider);

    return Material(
      color: C.panel,
      borderRadius: BorderRadius.circular(19),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(19),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19),
            border: Border.all(color: C.line),
          ),
          child: Row(
            children: [
              Container(
                width: 76,
                height: 76,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color(0xFF062B62),
                      Color(0xFF0A75C8),
                      Color(0xFF071A38),
                    ],
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: const [
                    Positioned(
                        bottom: 8,
                        left: 8,
                        child: Icon(Icons.public_rounded,
                            color: C.cyan, size: 49)),
                    Positioned(
                        top: 8,
                        right: 8,
                        child: Icon(Icons.sports_baseball_rounded,
                            color: Colors.redAccent, size: 18)),
                    Positioned(
                        bottom: 7,
                        right: 15,
                        child: Icon(Icons.south_rounded,
                            color: C.mint, size: 18)),
                  ],
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(progress.subject,
                        style: const TextStyle(
                            color: C.cyan,
                            fontSize: 9,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1)),
                    const SizedBox(height: 5),
                    Text(progress.topic,
                        style: const TextStyle(
                            color: C.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w800)),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      child: LinearProgressIndicator(
                        value: progress.value,
                        minHeight: 5,
                        backgroundColor: C.line,
                        valueColor: const AlwaysStoppedAnimation(C.blue),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                        '${(progress.value * 100).round()}% completed  ·  Continue your path',
                        style:
                            const TextStyle(color: C.muted, fontSize: 10)),
                  ],
                ),
              ),
              const SizedBox(width: 7),
              const Icon(Icons.arrow_forward_ios_rounded,
                  color: C.muted, size: 15),
            ],
          ),
        ),
      ),
    );
  }
}
