import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

void showDailyDiscovery(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: C.panel,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) => Padding(
      padding: const EdgeInsets.fromLTRB(22, 24, 22, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.wb_twilight_rounded, color: C.cyan, size: 34),
          const SizedBox(height: 14),
          const Text('WHY SUNSETS LOOK ORANGE',
              style: TextStyle(
                  color: C.cyan,
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.4)),
          const SizedBox(height: 10),
          const Text(
              'Sunlight contains many colours. At sunset, light travels through more of Earth’s atmosphere. Shorter blue wavelengths are scattered away more strongly, so more red and orange light reaches your eyes directly.',
              style: TextStyle(
                  color: C.white, fontSize: 14, height: 1.55)),
          const SizedBox(height: 14),
          const Text(
              'Try this: compare the colour of the sky near midday with its colour close to sunset. The changing path through the atmosphere makes the difference.',
              style: TextStyle(
                  color: C.muted, fontSize: 12, height: 1.5)),
          const SizedBox(height: 18),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Got it'),
            ),
          ),
        ],
      ),
    ),
  );
}
