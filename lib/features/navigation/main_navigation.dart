import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../home/home_page.dart';
import '../explore/explore_page.dart';
import '../lab/lab_page.dart';
import '../learn/learn_page.dart';
import '../profile/profile_page.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _index = 0;
  void _go(int value) => setState(() => _index = value);

  late final List<Widget> _pages = [
    HomePage(
      onExplore: () => _go(1),
      onLab: () => _go(2),
      onLearn: () => _go(3),
    ),
    const ExplorePage(),
    const LabPage(),
    const LearnPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: _index, children: _pages),
      ),
      bottomNavigationBar: NavigationBar(
        height: 70,
        backgroundColor: const Color(0xFF08192C),
        indicatorColor: C.blue.withValues(alpha: 0.22),
        selectedIndex: _index,
        onDestinationSelected: _go,
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
