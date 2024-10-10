import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

class Dash extends PositionComponent {
  Dash()
      : super(
            position: Vector2(0, 0),
            size: Vector2.all(100.0),
            anchor: Anchor.center);

  late Sprite _dashSprite;
  final Vector2 _gravity = Vector2(0, 900.0);
  Vector2 _velocity = Vector2(0, 0);
  final Vector2 _jumpForce = Vector2(0, -400);

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    _dashSprite = await Sprite.load('dash.png');
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    // _velocity += _gravity * dt;
    // position += _velocity * dt;
  }

  void jump() {
    _velocity = _jumpForce;
  }

  @override
  void render(Canvas canvas) {
    // TODO: implement render
    super.render(canvas);
    _dashSprite.render(
      canvas,
      size: size,
    );
  }
}
