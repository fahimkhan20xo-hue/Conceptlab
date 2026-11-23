import 'package:flutter/material.dart';
import '../../shared/page_shell.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});
  @override
  Widget build(BuildContext context) => const PageShell(
        eyebrow: 'EXPLORE',
        title: 'The universe, indexed.',
        subtitle: 'Browse every concept, subject, and discovery.',
        child: SizedBox.shrink(),
      );
}
