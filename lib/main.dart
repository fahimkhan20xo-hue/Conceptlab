import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_colors.dart';
import 'features/navigation/main_navigation.dart';

void main() => runApp(const ProviderScope(child: ConceptLabApp()));

class ConceptLabApp extends StatelessWidget {
  const ConceptLabApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'CONCEPTLAB',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: C.bg,
          colorScheme: const ColorScheme.dark(
            primary: C.blue,
            secondary: C.cyan,
            surface: C.panel,
          ),
          useMaterial3: true,
        ),
        home: const MainNavigation(),
      );
}
