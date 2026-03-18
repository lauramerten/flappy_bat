import 'dart:ui';

import 'package:flame/components.dart';

/// Renders the player bat inside the game world.
class Bat extends PositionComponent {
  late Sprite _batSprite;

  /// Creates the player bat component for the game world.
  Bat()
    : super(
        position: Vector2(0, 0),
        size: Vector2(91, 80),
        anchor: .center,
      );

  @override
  Future<void> onLoad() async {
    _batSprite = await Sprite.load("bat.png");
    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    _batSprite.render(canvas, size: size);
    super.render(canvas);
  }
}
