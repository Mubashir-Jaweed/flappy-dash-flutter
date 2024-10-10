import 'dart:async';

import 'package:flame/components.dart';
import 'package:flappydash/component/pipe.dart';

class PipePair extends PositionComponent {
  PipePair({
    required super.position,
    this.gap = 200.0,
  });

  final double gap;
  @override
  void onLoad() {
    // TODO: implement onLoad
    super.onLoad();
    addAll([
      Pipe(isFlipped: false, position: Vector2(0, gap/ 2)),
      Pipe(isFlipped: true, position: Vector2(0, -gap /2)),
    ]);
  }
}
