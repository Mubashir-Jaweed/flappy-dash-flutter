import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';

class Pipe extends PositionComponent {
  late Sprite _pipeStripe;
  final bool isFlipped;

  Pipe({required this.isFlipped, required super.position})
      : super(
          priority: 2,
        );

  @override
  Future<void> onLoad() async {
    // TODO: implement onLoad
    await super.onLoad();
    _pipeStripe = await Sprite.load('pipe.png');
    anchor = Anchor.topCenter;
    final ratio = _pipeStripe.srcSize.y / _pipeStripe.srcSize.x;
    const width = 100.0;
    size = Vector2(width, width * ratio);
    if (isFlipped) {
      flipVertically();
    }
  }

  @override
  void render(Canvas canvas) {
    // TODO: implement render
    super.render(canvas);
    _pipeStripe.render(
      canvas,
      position: Vector2.zero(),
      size: size,
    );
  }
}
