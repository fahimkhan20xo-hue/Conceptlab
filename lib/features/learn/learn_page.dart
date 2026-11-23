import 'package:flutter/material.dart';
import '../../shared/page_shell.dart';

class LearnPage extends StatelessWidget {
  const LearnPage({super.key});
  @override
  Widget build(BuildContext context) => const PageShell(
        eyebrow: 'LEARN',
        title: 'Your learning paths.',
        subtitle: 'Continue where you left off.',
        child: SizedBox.shrink(),
      );
}
