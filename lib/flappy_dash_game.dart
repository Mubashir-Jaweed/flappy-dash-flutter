import 'dart:async';
import 'dart:math';

import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flame/parallax.dart';
import 'package:flappydash/component/dash.dart';
import 'package:flappydash/component/dash_parallax_background.dart';
import 'package:flappydash/component/pipe.dart';
import 'package:flappydash/component/pipe_pair.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlappyDashGame extends FlameGame<FlappyDashWorld> with KeyboardEvents {
  FlappyDashGame()
      : super(
          world: FlappyDashWorld(),
          camera: CameraComponent.withFixedResolution(
            width: 600,
            height: 1150,
          ),
        );

  @override
  KeyEventResult onKeyEvent(
    KeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    final isKeyDown = event is KeyDownEvent;

    final isSpace = keysPressed.contains(LogicalKeyboardKey.space);

    if (isSpace && isKeyDown) {
      //
      world.onSpaceDown();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }
}

class FlappyDashWorld extends World with TapCallbacks, HasGameRef<FlappyDashGame> {
  late Dash _dash;
  late PipePair _lastPipe;
  static const _pipesDistance = 400.0;

  @override
  void onLoad() {
    super.onLoad();
    add(DashParallaxBackground());
    add(_dash = Dash());
    _generatePipes();
  }

  void _generatePipes({
    int count = 5,
    double fromX = 400.0,
  }) {
    for (int i = 0; i < count; i++) {
      const area = 600;
      final y = (Random().nextDouble() * area) - (area / 2);

      add(
        _lastPipe = PipePair(
          position: Vector2(fromX + (i * _pipesDistance), y),
        ),
      );
    }
  }

  void _removePipes() {
    final pipes = children.whereType<PipePair>();
    final shouldBeRemoved = max(pipes.length -5  , 0);
    pipes.take(shouldBeRemoved).forEach((pipe){
      pipe.removeFromParent();
    });
    print(pipes.length);
  }


  @override
  void onTapDown(TapDownEvent event) {
    // TODO: implement onTapDown
    super.onTapDown(event);
    _dash.jump();
  }

  void onSpaceDown() {
    _dash.jump();
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    if(_dash.x >= _lastPipe.x){
      _generatePipes(
        fromX: _pipesDistance
      );
      _removePipes();
    }
    // game.camera.viewfinder.zoom = 0.05;
  }
  
}
