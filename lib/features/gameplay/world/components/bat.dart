import 'dart:ui';

import 'package:flame/components.dart';

/// Renders the player bat inside the game world.
class Bat extends PositionComponent {
  late final Sprite _sprite;
  final Vector2 _gravity = Vector2(0, 1400);
  Vector2 _velocity = Vector2(0, 0);
  final Vector2 _jumpForce = Vector2(0, -530);

  /// Creates the player bat component for the game world.
  Bat()
    : super(
        position: Vector2(0, 0),
        anchor: .center,
      );

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    _sprite = await Sprite.load("bat.png");
    final double ratio = _sprite.srcSize.y / _sprite.srcSize.x;
    final double width = 100;
    size = Vector2(width, width * ratio);
  }

  @override
  void update(double dt) {
    _velocity += _gravity * dt;
    position += _velocity * dt;
    super.update(dt);
  }

  /// Applies the upward impulse.
  void jump() {
    _velocity = _jumpForce;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    _sprite.render(canvas, size: size);
  }
}
