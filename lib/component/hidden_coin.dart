import 'dart:async';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';

class HiddenCoin extends PositionComponent {
  HiddenCoin({
    required super.position,
  }) : super(
          size: Vector2(40, 40),
          anchor: Anchor.center,
        );

  @override
  void onLoad() {
    super.onLoad();

    add(
      CircleHitbox(
        collisionType: CollisionType.passive,
      ),
    );
  }

  // @override
  // void render(Canvas canvas) {
  //   // TODO: implement render
  //   super.render(canvas);
  //   canvas.drawCircle(
  //     (size / 2).toOffset(),
  //     size.x / 2,
  //     BasicPalette.darkGray.paint(),
  //   );
  // }
}
