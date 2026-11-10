import 'dart:math' as math;

import 'package:flutter/material.dart';

void main() {
  runApp(const ConceptLabApp());
}

class AppColors {
  static const background = Color(0xFF071426);
  static const surface = Color(0xFF0D2038);
  static const surfaceLight = Color(0xFF102744);
  static const blue = Color(0xFF1677FF);
  static const cyan = Color(0xFF55B8FF);
  static const text = Color(0xFFF2F7FF);
  static const muted = Color(0xFF9AAFC8);
  static const border = Color(0xFF1C3A5C);
  static const green = Color(0xFF38D9A9);
}

class ConceptLabApp extends StatelessWidget {
  const ConceptLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CONCEPTLAB',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.blue,
          secondary: AppColors.cyan,
          surface: AppColors.surface,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int selectedIndex = 0;

  static const destinations = [
    _Destination('Home', Icons.home_rounded),
    _Destination('Explore', Icons.explore_rounded),
    _Destination('Lab', Icons.science_rounded),
    _Destination('Learn', Icons.menu_book_rounded),
    _Destination('Profile', Icons.person_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: selectedIndex,
          children: const [
            HomePage(),
            PlaceholderPage(
              icon: Icons.explore_rounded,
              title: 'Explore',
              subtitle: 'Discover ideas, subjects, and new questions.',
            ),
            PlaceholderPage(
              icon: Icons.science_rounded,
              title: 'The Lab',
              subtitle: 'A space for experiments and interactive simulations.',
            ),
            PlaceholderPage(
              icon: Icons.menu_book_rounded,
              title: 'Your Learning',
              subtitle: 'Continue lessons and revisit what you discover.',
            ),
            PlaceholderPage(
              icon: Icons.person_rounded,
              title: 'Your Profile',
              subtitle: 'Your learning journey will live here.',
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        height: 68,
        backgroundColor: const Color(0xFF091A2D),
        indicatorColor: AppColors.blue.withOpacity(0.20),
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() => selectedIndex = index);
        },
        destinations: destinations
            .map(
              (item) => NavigationDestination(
                icon: Icon(item.icon, size: 21),
                selectedIcon: Icon(item.icon, size: 22, color: AppColors.cyan),
                label: item.label,
              ),
            )
            .toList(),
      ),
    );
  }
}

class _Destination {
  final String label;
  final IconData icon;

  const _Destination(this.label, this.icon);
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              const _TopBar(),
              const SizedBox(height: 28),
              const Text(
                'HELLO, LEARNER',
                style: TextStyle(
                  color: AppColors.cyan,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.2,
                ),
              ),
              const SizedBox(height: 9),
              const Text(
                'Discover how the\nworld works.',
                style: TextStyle(
                  color: AppColors.text,
                  fontSize: 31,
                  height: 1.12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.8,
                ),
              ),
              const SizedBox(height: 20),
              const _HeroCard(),
              const SizedBox(height: 28),
              const _SectionHeading(
                title: 'Continue learning',
                action: 'See all',
              ),
              const SizedBox(height: 13),
              const _ContinueCard(),
              const SizedBox(height: 28),
              const _SectionHeading(
                title: 'Explore subjects',
                action: 'Browse',
              ),
              const SizedBox(height: 13),
              const _CategoryGrid(),
              const SizedBox(height: 26),
              const _DailyDiscovery(),
            ]),
          ),
        ),
      ],
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              colors: [AppColors.blue, AppColors.cyan],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: const Icon(Icons.bubble_chart_rounded, color: Colors.white),
        ),
        const SizedBox(width: 10),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CONCEPTLAB',
              style: TextStyle(
                color: AppColors.text,
                fontWeight: FontWeight.w800,
                fontSize: 15,
                letterSpacing: 1.5,
              ),
            ),
            Text(
              'UNDERSTAND. EXPERIMENT. DISCOVER.',
              style: TextStyle(
                color: AppColors.muted,
                fontSize: 8,
                letterSpacing: 0.75,
              ),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          tooltip: 'Notifications',
          icon: const Icon(
            Icons.notifications_none_rounded,
            color: AppColors.muted,
          ),
        ),
      ],
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 238,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.border),
        gradient: const LinearGradient(
          colors: [Color(0xFF102B4A), Color(0xFF0A1B31), Color(0xFF09172A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          const Positioned(
            right: -18,
            top: -12,
            bottom: -12,
            width: 220,
            child: _EnergyCore(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 22, 18, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 190,
                  child: Text(
                    'Curiosity is your superpower.',
                    style: TextStyle(
                      color: AppColors.text,
                      fontSize: 21,
                      height: 1.18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 9),
                const SizedBox(
                  width: 175,
                  child: Text(
                    'Turn big questions into discoveries.',
                    style: TextStyle(
                      color: AppColors.muted,
                      fontSize: 12,
                      height: 1.45,
                    ),
                  ),
                ),
                const Spacer(),
                FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 11,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Start exploring'),
                      SizedBox(width: 7),
                      Icon(Icons.arrow_forward_rounded, size: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EnergyCore extends StatefulWidget {
  const _EnergyCore();

  @override
  State<_EnergyCore> createState() => _EnergyCoreState();
}

class _EnergyCoreState extends State<_EnergyCore>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 18),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _EnergyCorePainter(controller.value),
          child: const SizedBox.expand(),
        );
      },
    );
  }
}

class _EnergyCorePainter extends CustomPainter {
  final double progress;

  _EnergyCorePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width * 0.55, size.height * 0.52);
    final rotation = progress * math.pi * 2;
    final glow = Paint()
      ..shader = RadialGradient(
        colors: [
          AppColors.cyan.withOpacity(0.25),
          AppColors.blue.withOpacity(0.12),
          Colors.transparent,
        ],
      ).createShader(Rect.fromCircle(center: center, radius: 105));
    canvas.drawCircle(center, 105, glow);

    for (var ring = 0; ring < 3; ring++) {
      canvas.save();
      canvas.translate(center.dx, center.dy);
      canvas.rotate(rotation * (ring.isEven ? 1 : -0.65) + ring * 0.8);
      final rect = Rect.fromCenter(
        center: Offset.zero,
        width: 104 + ring * 28,
        height: 48 + ring * 18,
      );
      final ringPaint = Paint()
        ..color = (ring.isEven ? AppColors.cyan : AppColors.blue)
            .withOpacity(0.58 - ring * 0.1)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.15;
      canvas.drawOval(rect, ringPaint);
      canvas.restore();
    }

    final corePaint = Paint()
      ..shader = const RadialGradient(
        colors: [Color(0xFFB8F0FF), Color(0xFF45AFFF), Color(0xFF1260D8)],
        stops: [0, 0.35, 1],
      ).createShader(Rect.fromCircle(center: center, radius: 35));
    canvas.drawCircle(center, 34, corePaint);

    final highlight = Paint()..color = Colors.white.withOpacity(0.75);
    canvas.drawCircle(center.translate(-11, -12), 5, highlight);

    for (var i = 0; i < 12; i++) {
      final angle = (i / 12) * math.pi * 2 + rotation;
      final radius = 76 + (i % 3) * 13;
      final point = center.translate(
        math.cos(angle) * radius,
        math.sin(angle) * radius * 0.62,
      );
      canvas.drawCircle(
        point,
        i.isEven ? 2.3 : 1.4,
        Paint()..color = AppColors.cyan.withOpacity(0.75),
      );
    }
  }

  @override
  bool shouldRepaint(covariant _EnergyCorePainter oldDelegate) =>
      oldDelegate.progress != progress;
}

class _SectionHeading extends StatelessWidget {
  final String title;
  final String action;

  const _SectionHeading({required this.title, required this.action});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.text,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        Text(
          action,
          style: const TextStyle(
            color: AppColors.cyan,
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _ContinueCard extends StatelessWidget {
  const _ContinueCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 54,
            height: 58,
            decoration: BoxDecoration(
              color: AppColors.blue.withOpacity(0.15),
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Icon(
              Icons.public_rounded,
              color: AppColors.cyan,
              size: 29,
            ),
          ),
          const SizedBox(width: 13),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PHYSICS · FUNDAMENTALS',
                  style: TextStyle(
                    color: AppColors.cyan,
                    fontSize: 9,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Gravity & Motion',
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 9),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  child: LinearProgressIndicator(
                    value: 0.7,
                    minHeight: 5,
                    backgroundColor: AppColors.border,
                    valueColor: AlwaysStoppedAnimation(AppColors.blue),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '70% completed',
                  style: TextStyle(color: AppColors.muted, fontSize: 10),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.chevron_right_rounded, color: AppColors.muted),
        ],
      ),
    );
  }
}

class _CategoryGrid extends StatelessWidget {
  const _CategoryGrid();

  static const categories = [
    _Category('Physics', Icons.bolt_rounded, Color(0xFF55B8FF)),
    _Category('Chemistry', Icons.science_rounded, Color(0xFF38D9A9)),
    _Category('Biology', Icons.biotech_rounded, Color(0xFFB69CFF)),
    _Category('Mathematics', Icons.functions_rounded, Color(0xFFFFBF69)),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 11,
        mainAxisSpacing: 11,
        childAspectRatio: 2.15,
      ),
      itemBuilder: (context, index) {
        final item = categories[index];
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            children: [
              Icon(item.icon, color: item.color, size: 23),
              const SizedBox(width: 9),
              Expanded(
                child: Text(
                  item.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.text,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Category {
  final String name;
  final IconData icon;
  final Color color;

  const _Category(this.name, this.icon, this.color);
}

class _DailyDiscovery extends StatelessWidget {
  const _DailyDiscovery();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        gradient: const LinearGradient(
          colors: [Color(0xFF102B4A), Color(0xFF0D2038)],
        ),
        border: Border.all(color: AppColors.border),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.lightbulb_outline_rounded, color: AppColors.cyan, size: 25),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'DAILY DISCOVERY',
                  style: TextStyle(
                    color: AppColors.cyan,
                    fontSize: 10,
                    letterSpacing: 1.4,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  'A tiny question can open up a whole universe.',
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: 14,
                    height: 1.35,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Your next discovery is one question away.',
                  style: TextStyle(color: AppColors.muted, fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PlaceholderPage extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const PlaceholderPage({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 76,
              height: 76,
              decoration: BoxDecoration(
                color: AppColors.blue.withOpacity(0.14),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.border),
              ),
              child: Icon(icon, color: AppColors.cyan, size: 36),
            ),
            const SizedBox(height: 22),
            Text(
              title,
              style: const TextStyle(
                color: AppColors.text,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 9),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.muted,
                fontSize: 13,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'COMING IN A FUTURE MILESTONE',
              style: TextStyle(
                color: AppColors.cyan,
                fontSize: 9,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
