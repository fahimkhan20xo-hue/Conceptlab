import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import 'widgets/brand_header.dart';
import 'widgets/eyebrow.dart';
import 'widgets/premium_hero.dart';
import 'widgets/section_title.dart';
import 'widgets/continue_card.dart';
import 'widgets/subject_grid.dart';
import 'widgets/daily_card.dart';
import 'widgets/lab_banner.dart';
import '../learn/daily_discovery_sheet.dart';

class HomePage extends StatelessWidget {
  final VoidCallback onExplore, onLab, onLearn;
  const HomePage({
    super.key,
    required this.onExplore,
    required this.onLab,
    required this.onLearn,
  });

  @override
  Widget build(BuildContext context) => CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 30),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const BrandHeader(),
                const SizedBox(height: 30),
                const Eyebrow('YOUR CURIOSITY, UNLOCKED'),
                const SizedBox(height: 10),
                const Text('Discover how the\nworld works.',
                    style: TextStyle(
                        color: C.white,
                        fontSize: 34,
                        height: 1.08,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -1.1)),
                const SizedBox(height: 8),
                const Text('Explore  ·  Experiment  ·  Learn',
                    style: TextStyle(
                        color: C.muted,
                        fontSize: 12,
                        letterSpacing: .35)),
                const SizedBox(height: 20),
                PremiumHero(onTap: onExplore),
                const SizedBox(height: 30),
                SectionTitle(
                  title: 'Pick up where you left off',
                  action: 'View all',
                  onTap: onLearn,
                ),
                const SizedBox(height: 14),
                ContinueCard(onTap: onLearn),
                const SizedBox(height: 30),
                SectionTitle(
                  title: 'Explore the universe',
                  action: 'All subjects',
                  onTap: onExplore,
                ),
                const SizedBox(height: 14),
                SubjectGrid(onTap: onExplore),
                const SizedBox(height: 28),
                DailyCard(onTap: () => showDailyDiscovery(context)),
                const SizedBox(height: 18),
                LabBanner(onTap: onLab),
              ]),
            ),
          ),
        ],
      );
}
