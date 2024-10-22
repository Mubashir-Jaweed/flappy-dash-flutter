import 'package:flappydash/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TapToPlay extends StatelessWidget {
  const TapToPlay({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: const Text(
        'TAP TO PLAY',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          letterSpacing: 3,
          fontSize: 38,
        ),
      )
          .animate(
            onPlay: (controller) => controller.repeat(
              reverse: true,
            ),
          )
          .scale(
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.1, 1.1),
            duration: const Duration(milliseconds: 500),
          ),
    );
  }
}
