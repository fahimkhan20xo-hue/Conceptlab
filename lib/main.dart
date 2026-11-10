import 'dart:math' as math;
import 'package:flutter/material.dart';

void main() => runApp(const ConceptLabApp());

class C {
  static const bg = Color(0xFF061326);
  static const panel = Color(0xFF0B1D33);
  static const panel2 = Color(0xFF102945);
  static const blue = Color(0xFF1684FF);
  static const cyan = Color(0xFF65D5FF);
  static const white = Color(0xFFF2F7FF);
  static const muted = Color(0xFF9CB2CC);
  static const line = Color(0xFF1C3D60);
  static const mint = Color(0xFF42DDB1);
  static const violet = Color(0xFFB39BFF);
}

class ConceptLabApp extends StatelessWidget {
  const ConceptLabApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'CONCEPTLAB',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: C.bg,
      colorScheme: const ColorScheme.dark(primary: C.blue, secondary: C.cyan, surface: C.panel),
      useMaterial3: true,
      fontFamily: 'Roboto',
    ),
    home: const MainNavigation(),
  );
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});
  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int index = 0;
  void go(int value) => setState(() => index = value);
  @override
  Widget build(BuildContext context) {
    final pages = [
      HomePage(onExplore: () => go(1), onLab: () => go(2), onLearn: () => go(3)),
      const ExplorePage(),
      const LabPage(),
      const LearnPage(),
      const ProfilePage(),
    ];
    return Scaffold(
      body: SafeArea(child: IndexedStack(index: index, children: pages)),
      bottomNavigationBar: NavigationBar(
        height: 70,
        backgroundColor: const Color(0xFF08192C),
        indicatorColor: C.blue.withValues(alpha: 0.22),
        selectedIndex: index,
        onDestinationSelected: go,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_rounded), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.explore_rounded), label: 'Explore'),
          NavigationDestination(icon: Icon(Icons.science_rounded), label: 'Lab'),
          NavigationDestination(icon: Icon(Icons.menu_book_rounded), label: 'Learn'),
          NavigationDestination(icon: Icon(Icons.person_rounded), label: 'Profile'),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final VoidCallback onExplore, onLab, onLearn;
  const HomePage({super.key, required this.onExplore, required this.onLab, required this.onLearn});
  @override
  Widget build(BuildContext context) => CustomScrollView(
    physics: const BouncingScrollPhysics(),
    slivers: [
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 30),
        sliver: SliverList(delegate: SliverChildListDelegate([
          const BrandHeader(),
          const SizedBox(height: 30),
          const Eyebrow('YOUR CURIOSITY, UNLOCKED'),
          const SizedBox(height: 10),
          const Text('Discover how the\nworld works.', style: TextStyle(color: C.white, fontSize: 34, height: 1.08, fontWeight: FontWeight.w800, letterSpacing: -1.1)),
          const SizedBox(height: 22),
          PremiumHero(onTap: onExplore),
          const SizedBox(height: 30),
          SectionTitle(title: 'Pick up where you left off', action: 'View all', onTap: onLearn),
          const SizedBox(height: 14),
          ContinueCard(onTap: onLearn),
          const SizedBox(height: 30),
          SectionTitle(title: 'Explore the universe', action: 'All subjects', onTap: onExplore),
          const SizedBox(height: 14),
          SubjectGrid(onTap: onExplore),
          const SizedBox(height: 28),
          const DailyCard(),
          const SizedBox(height: 18),
          LabBanner(onTap: onLab),
        ])),
      ),
    ],
  );
}

class BrandHeader extends StatelessWidget {
  const BrandHeader({super.key});
  @override
  Widget build(BuildContext context) => Row(children: [
    Container(width: 42, height: 42, decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14),
      gradient: const LinearGradient(colors: [C.blue, C.cyan], begin: Alignment.bottomLeft, end: Alignment.topRight),
      boxShadow: [BoxShadow(color: C.blue.withValues(alpha: .25), blurRadius: 18, spreadRadius: 1)],
    ), child: const Icon(Icons.hub_rounded, color: Colors.white, size: 25)),
    const SizedBox(width: 12),
    const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('CONCEPTLAB', style: TextStyle(color: C.white, fontSize: 16, fontWeight: FontWeight.w800, letterSpacing: 1.7)),
      SizedBox(height: 3),
      Text('UNDERSTAND. EXPERIMENT. DISCOVER.', style: TextStyle(color: C.muted, fontSize: 8.5, letterSpacing: .9)),
    ])),
    IconButton(onPressed: () => _message(context, 'Notifications are coming soon.'), icon: const Icon(Icons.notifications_none_rounded, color: C.muted, size: 25)),
  ]);
}

class Eyebrow extends StatelessWidget {
  final String text;
  const Eyebrow(this.text, {super.key});
  @override
  Widget build(BuildContext context) => Text(text, style: const TextStyle(color: C.cyan, fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 2));
}

class PremiumHero extends StatelessWidget {
  final VoidCallback onTap;
  const PremiumHero({super.key, required this.onTap});
  @override
  Widget build(BuildContext context) => Container(
    height: 250, clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      border: Border.all(color: C.line),
      gradient: const LinearGradient(colors: [Color(0xFF102C4C), Color(0xFF0A1B30), Color(0xFF08172A)], begin: Alignment.topLeft, end: Alignment.bottomRight),
      boxShadow: [BoxShadow(color: C.blue.withValues(alpha: .08), blurRadius: 28, offset: const Offset(0, 12))],
    ),
    child: Stack(children: [
      const Positioned(right: -15, top: -5, bottom: -5, width: 225, child: EnergyCore()),
      Positioned(left: 20, top: 23, bottom: 20, child: SizedBox(width: 205, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5), decoration: BoxDecoration(color: C.blue.withValues(alpha: .16), borderRadius: BorderRadius.circular(20), border: Border.all(color: C.blue.withValues(alpha: .3))), child: const Text('THE WORLD IS YOUR LAB', style: TextStyle(color: C.cyan, fontSize: 8, letterSpacing: 1.1, fontWeight: FontWeight.w800))),
        const SizedBox(height: 14),
        const Text('Curiosity is your superpower.', style: TextStyle(color: C.white, fontSize: 21, height: 1.15, fontWeight: FontWeight.w800, letterSpacing: -.4)),
        const SizedBox(height: 9),
        const Text('Turn big questions into discoveries.', style: TextStyle(color: C.muted, fontSize: 12, height: 1.4)),
        const Spacer(),
        FilledButton(onPressed: onTap, style: FilledButton.styleFrom(backgroundColor: C.blue, foregroundColor: Colors.white, elevation: 0, padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: const Row(mainAxisSize: MainAxisSize.min, children: [Text('Start exploring', style: TextStyle(fontWeight: FontWeight.w700)), SizedBox(width: 8), Icon(Icons.arrow_forward_rounded, size: 16)])),
      ]))),
    ]),
  );
}

class EnergyCore extends StatefulWidget {
  const EnergyCore({super.key});
  @override
  State<EnergyCore> createState() => _EnergyCoreState();
}
class _EnergyCoreState extends State<EnergyCore> with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  @override
  void initState() { super.initState(); controller = AnimationController(vsync: this, duration: const Duration(seconds: 24))..repeat(); }
  @override
  void dispose() { controller.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) => AnimatedBuilder(animation: controller, builder: (_, __) => CustomPaint(painter: CorePainter(controller.value), child: const SizedBox.expand()));
}
class CorePainter extends CustomPainter {
  final double t;
  CorePainter(this.t);
  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width * .55, size.height * .51);
    final a = t * math.pi * 2;
    canvas.drawCircle(c, 108, Paint()..shader = RadialGradient(colors: [C.cyan.withValues(alpha: .23), C.blue.withValues(alpha: .10), Colors.transparent]).createShader(Rect.fromCircle(center: c, radius: 108)));
    for (int i = 0; i < 4; i++) {
      canvas.save(); canvas.translate(c.dx, c.dy); canvas.rotate(a * (i.isEven ? 1 : -.72) + i * .62);
      final rect = Rect.fromCenter(center: Offset.zero, width: 102 + i * 20.0, height: 45 + i * 13.0);
      canvas.drawOval(rect, Paint()..color = (i.isEven ? C.cyan : C.blue).withValues(alpha: .48 - i * .065)..style = PaintingStyle.stroke..strokeWidth = i == 0 ? 1.5 : 1);
      canvas.restore();
    }
    final core = Rect.fromCircle(center: c, radius: 37);
    canvas.drawCircle(c, 37, Paint()..shader = const RadialGradient(colors: [Color(0xFFDDF8FF), Color(0xFF62C9FF), Color(0xFF1677FF), Color(0xFF073B9B)], stops: [0, .18, .62, 1]).createShader(core));
    canvas.drawCircle(c.translate(-12, -13), 6, Paint()..color = Colors.white.withValues(alpha: .78));
    for (int i = 0; i < 20; i++) {
      final angle = i * math.pi * 2 / 20 + a * (i.isEven ? .3 : -.18);
      final radius = 72 + (i % 4) * 13.0;
      final p = c.translate(math.cos(angle) * radius, math.sin(angle) * radius * .65);
      canvas.drawCircle(p, i % 3 == 0 ? 2.5 : 1.4, Paint()..color = C.cyan.withValues(alpha: .68));
    }
  }
  @override
  bool shouldRepaint(covariant CorePainter oldDelegate) => oldDelegate.t != t;
}

class SectionTitle extends StatelessWidget {
  final String title, action;
  final VoidCallback onTap;
  const SectionTitle({super.key, required this.title, required this.action, required this.onTap});
  @override
  Widget build(BuildContext context) => Row(children: [
    Expanded(child: Text(title, style: const TextStyle(color: C.white, fontSize: 17, fontWeight: FontWeight.w800, letterSpacing: -.3))),
    TextButton(onPressed: onTap, child: Text(action, style: const TextStyle(color: C.cyan, fontSize: 11, fontWeight: FontWeight.w700))),
  ]);
}

class ContinueCard extends StatelessWidget {
  final VoidCallback onTap;
  const ContinueCard({super.key, required this.onTap});
  @override
  Widget build(BuildContext context) => Material(
    color: C.panel, borderRadius: BorderRadius.circular(19),
    child: InkWell(onTap: onTap, borderRadius: BorderRadius.circular(19), child: Container(
      padding: const EdgeInsets.all(16), decoration: BoxDecoration(borderRadius: BorderRadius.circular(19), border: Border.all(color: C.line)),
      child: Row(children: [
        Container(width: 58, height: 62, decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), gradient: LinearGradient(colors: [C.blue.withValues(alpha: .24), C.cyan.withValues(alpha: .08)])), child: const Icon(Icons.public_rounded, color: C.cyan, size: 30)),
        const SizedBox(width: 14),
        const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('PHYSICS  /  FUNDAMENTALS', style: TextStyle(color: C.cyan, fontSize: 9, fontWeight: FontWeight.w800, letterSpacing: 1)),
          SizedBox(height: 5),
          Text('Gravity & Motion', style: TextStyle(color: C.white, fontSize: 15, fontWeight: FontWeight.w800)),
          SizedBox(height: 10),
          ClipRRect(borderRadius: BorderRadius.all(Radius.circular(8)), child: LinearProgressIndicator(value: .35, minHeight: 5, backgroundColor: C.line, valueColor: AlwaysStoppedAnimation(C.blue))),
          SizedBox(height: 6),
          Text('Ready for your first experiment', style: TextStyle(color: C.muted, fontSize: 10)),
        ])),
        const SizedBox(width: 7), const Icon(Icons.arrow_forward_ios_rounded, color: C.muted, size: 15),
      ]),
    )),
  );
}

class SubjectGrid extends StatelessWidget {
  final VoidCallback onTap;
  const SubjectGrid({super.key, required this.onTap});
  static const items = [
    ('Physics', Icons.bolt_rounded, C.cyan, '12 concepts'),
    ('Chemistry', Icons.science_rounded, C.mint, 'Coming soon'),
    ('Biology', Icons.biotech_rounded, C.violet, 'Coming soon'),
    ('Mathematics', Icons.functions_rounded, Color(0xFFFFC477), 'Coming soon'),
  ];
  @override
  Widget build(BuildContext context) => GridView.builder(
    shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), itemCount: items.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 1.85),
    itemBuilder: (_, i) { final item = items[i]; return Material(color: C.panel, borderRadius: BorderRadius.circular(17), child: InkWell(onTap: onTap, borderRadius: BorderRadius.circular(17), child: Container(
      padding: const EdgeInsets.all(14), decoration: BoxDecoration(borderRadius: BorderRadius.circular(17), border: Border.all(color: C.line)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(item.$2, color: item.$3, size: 25), const SizedBox(height: 9),
        Text(item.$1, style: const TextStyle(color: C.white, fontWeight: FontWeight.w800, fontSize: 13)),
        const SizedBox(height: 3), Text(item.$4, style: const TextStyle(color: C.muted, fontSize: 9)),
      ]),
    ))); },
  );
}

class DailyCard extends StatelessWidget {
  const DailyCard({super.key});
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(17), decoration: BoxDecoration(borderRadius: BorderRadius.circular(18), gradient: const LinearGradient(colors: [Color(0xFF112E4D), Color(0xFF0B1D33)]), border: Border.all(color: C.line)), child: const Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Icon(Icons.auto_awesome_rounded, color: C.cyan, size: 24), SizedBox(width: 12),
    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('DAILY DISCOVERY', style: TextStyle(color: C.cyan, fontSize: 9, letterSpacing: 1.5, fontWeight: FontWeight.w800)),
      SizedBox(height: 7), Text('Why does the sky change colour at sunset?', style: TextStyle(color: C.white, fontSize: 14, height: 1.35, fontWeight: FontWeight.w700)),
      SizedBox(height: 5), Text('A new question to spark your curiosity.', style: TextStyle(color: C.muted, fontSize: 10)),
    ])),
  ]));
}

class LabBanner extends StatelessWidget {
  final VoidCallback onTap;
  const LabBanner({super.key, required this.onTap});
  @override
  Widget build(BuildContext context) => Material(color: C.panel, borderRadius: BorderRadius.circular(18), child: InkWell(onTap: onTap, borderRadius: BorderRadius.circular(18), child: Container(padding: const EdgeInsets.all(17), decoration: BoxDecoration(borderRadius: BorderRadius.circular(18), border: Border.all(color: C.line)), child: const Row(children: [
    Icon(Icons.science_outlined, color: C.mint, size: 27), SizedBox(width: 12),
    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('STEP INTO THE LAB', style: TextStyle(color: C.mint, fontSize: 9, letterSpacing: 1.3, fontWeight: FontWeight.w800)),
      SizedBox(height: 5), Text('Test an idea. See what happens.', style: TextStyle(color: C.white, fontSize: 13, fontWeight: FontWeight.w700)),
    ])),
    Icon(Icons.arrow_forward_rounded, color: C.cyan),
  ]))));
}

class PageShell extends StatelessWidget {
  final String eyebrow, title, subtitle;
  final Widget child;
  const PageShell({super.key, required this.eyebrow, required this.title, required this.subtitle, required this.child});
  @override
  Widget build(BuildContext context) => CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
    SliverPadding(padding: const EdgeInsets.fromLTRB(20, 22, 20, 30), sliver: SliverList(delegate: SliverChildListDelegate([
      const BrandHeader(), const SizedBox(height: 34), Eyebrow(eyebrow), const SizedBox(height: 9),
      Text(title, style: const TextStyle(color: C.white, fontSize: 30, fontWeight: FontWeight.w800, letterSpacing: -.8)),
      const SizedBox(height: 8), Text(subtitle, style: const TextStyle(color: C.muted, fontSize: 13, height: 1.5)),
      const SizedBox(height: 25), child,
    ]))),
  ]);
}

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});
  @override
  Widget build(BuildContext context) => PageShell(eyebrow: 'FOLLOW YOUR QUESTIONS', title: 'Explore', subtitle: 'Choose a field and discover the ideas that shape our world.', child: Column(children: [
    _FeatureTile(icon: Icons.bolt_rounded, color: C.cyan, label: 'PHYSICS', title: 'Motion, forces & the universe', detail: '12 concepts · Interactive starter', onTap: () => _openGravity(context)),
    const SizedBox(height: 12),
    const _FeatureTile(icon: Icons.science_rounded, color: C.mint, label: 'CHEMISTRY', title: 'Matter at its smallest scale', detail: 'Learning path in development'),
    const SizedBox(height: 12),
    const _FeatureTile(icon: Icons.biotech_rounded, color: C.violet, label: 'BIOLOGY', title: 'Life, cells & living systems', detail: 'Learning path in development'),
    const SizedBox(height: 12),
    const _FeatureTile(icon: Icons.functions_rounded, color: Color(0xFFFFC477), label: 'MATHEMATICS', title: 'Patterns behind everything', detail: 'Learning path in development'),
  ]));
}

class _FeatureTile extends StatelessWidget {
  final IconData icon; final Color color; final String label, title, detail; final VoidCallback? onTap;
  const _FeatureTile({required this.icon, required this.color, required this.label, required this.title, required this.detail, this.onTap});
  @override
  Widget build(BuildContext context) => Material(color: C.panel, borderRadius: BorderRadius.circular(18), child: InkWell(onTap: onTap, borderRadius: BorderRadius.circular(18), child: Container(padding: const EdgeInsets.all(17), decoration: BoxDecoration(borderRadius: BorderRadius.circular(18), border: Border.all(color: C.line)), child: Row(children: [
    Container(width: 48, height: 48, decoration: BoxDecoration(color: color.withValues(alpha: .12), borderRadius: BorderRadius.circular(14)), child: Icon(icon, color: color, size: 25)),
    const SizedBox(width: 13), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label, style: TextStyle(color: color, fontSize: 9, fontWeight: FontWeight.w800, letterSpacing: 1.2)),
      const SizedBox(height: 5), Text(title, style: const TextStyle(color: C.white, fontSize: 13, fontWeight: FontWeight.w700)),
      const SizedBox(height: 4), Text(detail, style: const TextStyle(color: C.muted, fontSize: 10)),
    ])), const Icon(Icons.chevron_right_rounded, color: C.muted),
  ]))));
}

class LabPage extends StatelessWidget {
  const LabPage({super.key});
  @override
  Widget build(BuildContext context) => PageShell(eyebrow: 'LEARN BY DOING', title: 'The Lab', subtitle: 'Change a variable, make a prediction, and explore the result.', child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(borderRadius: BorderRadius.circular(22), gradient: const LinearGradient(colors: [Color(0xFF12385B), Color(0xFF0B1D33)]), border: Border.all(color: C.line)), child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Icon(Icons.science_rounded, color: C.cyan, size: 30), SizedBox(height: 14),
      Text('Your virtual lab starts here.', style: TextStyle(color: C.white, fontSize: 19, fontWeight: FontWeight.w800)),
      SizedBox(height: 7), Text('Experiments are simplified learning models. Explore the variables and see how the results change.', style: TextStyle(color: C.muted, fontSize: 12, height: 1.5)),
    ])),
    const SizedBox(height: 20), const Text('AVAILABLE EXPERIMENT', style: TextStyle(color: C.cyan, fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 1.4)),
    const SizedBox(height: 11),
    _FeatureTile(icon: Icons.sports_basketball_rounded, color: C.cyan, label: 'PHYSICS · MOTION', title: 'Free-fall explorer', detail: 'Adjust drop height and explore falling time.', onTap: () => _openGravity(context)),
  ]));
}

void _openGravity(BuildContext context) => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const GravityExperimentPage()));

class GravityExperimentPage extends StatefulWidget {
  const GravityExperimentPage({super.key});
  @override
  State<GravityExperimentPage> createState() => _GravityExperimentPageState();
}
class _GravityExperimentPageState extends State<GravityExperimentPage> {
  double height = 20;
  String? prediction;
  bool revealed = false;

  String get correctRange {
    final seconds = math.sqrt(2 * height / 9.81);
    if (seconds < 1) return 'Under 1 second';
    if (seconds <= 3) return '1–3 seconds';
    return 'Over 3 seconds';
  }

  @override
  Widget build(BuildContext context) {
    final time = math.sqrt(2 * height / 9.81);
    final speed = 9.81 * time;
    return Scaffold(backgroundColor: C.bg, appBar: AppBar(backgroundColor: C.bg, title: const Text('Free-fall explorer', style: TextStyle(color: C.white, fontWeight: FontWeight.w700)), iconTheme: const IconThemeData(color: C.white)), body: ListView(padding: const EdgeInsets.all(20), children: [
      const Eyebrow('INTERACTIVE PHYSICS MODEL'), const SizedBox(height: 10),
      const Text('What happens when height changes?', style: TextStyle(color: C.white, fontSize: 25, height: 1.15, fontWeight: FontWeight.w800)),
      const SizedBox(height: 10), const Text('Assuming an object is dropped from rest near Earth, ignoring air resistance.', style: TextStyle(color: C.muted, fontSize: 12, height: 1.5)),
      const SizedBox(height: 25),
      Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: C.panel, borderRadius: BorderRadius.circular(20), border: Border.all(color: C.line)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [const Expanded(child: Text('Drop height', style: TextStyle(color: C.white, fontWeight: FontWeight.w700))), Text('${height.toStringAsFixed(0)} m', style: const TextStyle(color: C.cyan, fontSize: 18, fontWeight: FontWeight.w800))]),
        Slider(value: height, min: 1, max: 100, divisions: 99, activeColor: C.blue, inactiveColor: C.line, onChanged: (v) => setState(() { height = v; prediction = null; revealed = false; })),
        const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('1 m', style: TextStyle(color: C.muted, fontSize: 10)), Text('100 m', style: TextStyle(color: C.muted, fontSize: 10))]),
      ])),
      const SizedBox(height: 16),
      Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(color: C.panel, borderRadius: BorderRadius.circular(20), border: Border.all(color: C.line)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('MAKE A PREDICTION', style: TextStyle(color: C.cyan, fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 1.3)),
          const SizedBox(height: 8),
          const Text('How long do you think the object will take to fall?', style: TextStyle(color: C.white, fontSize: 14, fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          Wrap(spacing: 8, runSpacing: 8, children: [
            'Under 1 second', '1–3 seconds', 'Over 3 seconds'
          ].map((option) => ChoiceChip(
            label: Text(option),
            selected: prediction == option,
            onSelected: revealed ? null : (_) => setState(() => prediction = option),
            selectedColor: C.blue.withValues(alpha: .28),
            backgroundColor: C.panel2,
            labelStyle: TextStyle(color: prediction == option ? C.white : C.muted, fontSize: 11),
            side: BorderSide(color: prediction == option ? C.blue : C.line),
          )).toList()),
          const SizedBox(height: 12),
          SizedBox(width: double.infinity, child: FilledButton(
            onPressed: prediction == null ? null : () => setState(() => revealed = true),
            child: Text(revealed ? 'Prediction checked' : 'Check my prediction'),
          )),
          if (revealed) ...[
            const SizedBox(height: 12),
            Text(prediction == correctRange ? 'That’s right! Great prediction.' : 'Good try! The correct range is $correctRange.',
              style: TextStyle(color: prediction == correctRange ? C.mint : C.cyan, fontWeight: FontWeight.w700, fontSize: 12)),
            const SizedBox(height: 5),
            Text('The calculated fall time is ${time.toStringAsFixed(2)} seconds in this simplified model.',
              style: const TextStyle(color: C.muted, fontSize: 11, height: 1.4)),
            TextButton(onPressed: () => setState(() { prediction = null; revealed = false; }), child: const Text('Try again')),
          ],
        ]),
      ),
      const SizedBox(height: 16),
      Row(children: [
        Expanded(child: _MetricCard(label: 'FALL TIME', value: '${time.toStringAsFixed(2)} s', icon: Icons.timer_outlined)),
        const SizedBox(width: 12), Expanded(child: _MetricCard(label: 'FINAL SPEED', value: '${speed.toStringAsFixed(1)} m/s', icon: Icons.speed_rounded)),
      ]),
      const SizedBox(height: 20),
      Container(padding: const EdgeInsets.all(18), decoration: BoxDecoration(color: const Color(0xFF102B46), borderRadius: BorderRadius.circular(18), border: Border.all(color: C.line)), child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('THE SCIENCE', style: TextStyle(color: C.cyan, fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 1.3)),
        SizedBox(height: 9), Text('t = √(2h / g)', style: TextStyle(color: C.white, fontSize: 23, fontWeight: FontWeight.w800)),
        SizedBox(height: 7), Text('h = drop height  ·  g = 9.81 m/s²  ·  t = time', style: TextStyle(color: C.muted, fontSize: 11)),
        SizedBox(height: 12), Text('Try doubling the height. Does the fall time also double? Change the slider and observe the relationship.', style: TextStyle(color: C.white, fontSize: 12, height: 1.5)),
      ])),
      const SizedBox(height: 18),
      OutlinedButton.icon(onPressed: () => setState(() { height = 20; prediction = null; revealed = false; }), icon: const Icon(Icons.restart_alt_rounded), label: const Text('Reset experiment'), style: OutlinedButton.styleFrom(foregroundColor: C.cyan, side: const BorderSide(color: C.line), padding: const EdgeInsets.symmetric(vertical: 14))),
    ]));
  }
}

class _MetricCard extends StatelessWidget {
  final String label, value; final IconData icon;
  const _MetricCard({required this.label, required this.value, required this.icon});
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(15), decoration: BoxDecoration(color: C.panel, borderRadius: BorderRadius.circular(17), border: Border.all(color: C.line)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Icon(icon, color: C.cyan, size: 21), const SizedBox(height: 12),
    Text(label, style: const TextStyle(color: C.muted, fontSize: 9, letterSpacing: 1, fontWeight: FontWeight.w700)),
    const SizedBox(height: 5), FittedBox(fit: BoxFit.scaleDown, child: Text(value, style: const TextStyle(color: C.white, fontSize: 20, fontWeight: FontWeight.w800))),
  ]));
}

class LearnPage extends StatelessWidget {
  const LearnPage({super.key});
  @override
  Widget build(BuildContext context) => PageShell(eyebrow: 'YOUR LEARNING JOURNEY', title: 'Learn', subtitle: 'Build understanding one concept at a time.', child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Container(padding: const EdgeInsets.all(18), decoration: BoxDecoration(color: C.panel, borderRadius: BorderRadius.circular(18), border: Border.all(color: C.line)), child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('YOUR FIRST PATH', style: TextStyle(color: C.cyan, fontSize: 9, letterSpacing: 1.3, fontWeight: FontWeight.w800)),
      SizedBox(height: 8), Text('Gravity & Motion', style: TextStyle(color: C.white, fontSize: 20, fontWeight: FontWeight.w800)),
      SizedBox(height: 8), Text('Start with motion, explore gravity, then test your predictions in the lab.', style: TextStyle(color: C.muted, fontSize: 12, height: 1.5)),
    ])),
    const SizedBox(height: 18),
    const _LessonRow(number: '01', title: 'What is motion?', subtitle: 'Position, distance and time', done: false),
    const _LessonRow(number: '02', title: 'Understanding gravity', subtitle: 'Why objects fall toward Earth', done: false),
    const _LessonRow(number: '03', title: 'Test it in the lab', subtitle: 'Explore a free-fall model', done: false),
  ]));
}
class _LessonRow extends StatelessWidget {
  final String number, title, subtitle; final bool done;
  const _LessonRow({required this.number, required this.title, required this.subtitle, required this.done});
  @override
  Widget build(BuildContext context) => Padding(padding: const EdgeInsets.only(bottom: 11), child: Container(padding: const EdgeInsets.all(15), decoration: BoxDecoration(color: C.panel, borderRadius: BorderRadius.circular(16), border: Border.all(color: C.line)), child: Row(children: [
    Container(width: 37, height: 37, alignment: Alignment.center, decoration: BoxDecoration(color: C.blue.withValues(alpha: .14), borderRadius: BorderRadius.circular(11)), child: Text(number, style: const TextStyle(color: C.cyan, fontWeight: FontWeight.w800))),
    const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: const TextStyle(color: C.white, fontSize: 13, fontWeight: FontWeight.w700)),
      const SizedBox(height: 4), Text(subtitle, style: const TextStyle(color: C.muted, fontSize: 10)),
    ])), const Icon(Icons.lock_outline_rounded, color: C.muted, size: 18),
  ])));
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) => PageShell(eyebrow: 'YOUR SPACE', title: 'Profile', subtitle: 'Your discoveries, progress and preferences.', child: Column(children: [
    Container(width: double.infinity, padding: const EdgeInsets.all(22), decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), gradient: const LinearGradient(colors: [Color(0xFF12365A), Color(0xFF0B1D33)]), border: Border.all(color: C.line)), child: const Column(children: [
      CircleAvatar(radius: 34, backgroundColor: Color(0xFF174B7B), child: Icon(Icons.person_rounded, color: C.cyan, size: 36)),
      SizedBox(height: 12), Text('Curious Learner', style: TextStyle(color: C.white, fontSize: 18, fontWeight: FontWeight.w800)),
      SizedBox(height: 5), Text('Your learning journey starts here', style: TextStyle(color: C.muted, fontSize: 11)),
    ])),
    const SizedBox(height: 16),
    const _ProfileOption(icon: Icons.insights_rounded, title: 'Learning progress', detail: 'Your milestones will appear here'),
    const _ProfileOption(icon: Icons.bookmark_outline_rounded, title: 'Saved concepts', detail: 'Keep interesting ideas close'),
    const _ProfileOption(icon: Icons.settings_outlined, title: 'Settings', detail: 'Preferences and app information'),
    const SizedBox(height: 16),
    const Text('CONCEPTLAB · EARLY ACCESS', style: TextStyle(color: C.muted, fontSize: 9, letterSpacing: 1.3)),
  ]));
}
class _ProfileOption extends StatelessWidget {
  final IconData icon; final String title, detail;
  const _ProfileOption({required this.icon, required this.title, required this.detail});
  @override
  Widget build(BuildContext context) => Padding(padding: const EdgeInsets.only(bottom: 10), child: Container(padding: const EdgeInsets.all(15), decoration: BoxDecoration(color: C.panel, borderRadius: BorderRadius.circular(15), border: Border.all(color: C.line)), child: Row(children: [
    Icon(icon, color: C.cyan), const SizedBox(width: 13), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: const TextStyle(color: C.white, fontSize: 12, fontWeight: FontWeight.w700)),
      const SizedBox(height: 3), Text(detail, style: const TextStyle(color: C.muted, fontSize: 10)),
    ])), const Icon(Icons.chevron_right_rounded, color: C.muted),
  ])));
}

void _message(BuildContext context, String text) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text), behavior: SnackBarBehavior.floating));
