import 'dart:async';

import 'package:flame/components.dart';
import 'package:flappydash/component/hidden_coin.dart';
import 'package:flappydash/component/pipe.dart';

class PipePair extends PositionComponent {
  PipePair({
    required super.position,
    this.gap = 250.0,
    this.speed = 200.0,
  });

  final double gap;
  final double speed;
  @override
  void onLoad() {
    super.onLoad();
    addAll([
      Pipe(
        isFlipped: false,
        position: Vector2(0, gap / 2),
      ),
      Pipe(
        isFlipped: true,
        position: Vector2(0, -gap / 2),
      ),
      HiddenCoin(position: Vector2(30, 0))
    ]);
  }

  @override
  void update(double dt) {
    // TODO: implement update
    position.x -= speed * dt;
    super.update(dt);
  }
}
