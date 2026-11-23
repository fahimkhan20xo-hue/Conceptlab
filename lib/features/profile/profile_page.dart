import 'package:flutter/material.dart';
import '../../shared/page_shell.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) => const PageShell(
        eyebrow: 'PROFILE',
        title: 'Your progress.',
        subtitle: 'Stats, streaks, and achievements.',
        child: SizedBox.shrink(),
      );
}
