import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy_bat/features/gameplay/world/components/hidden_score_trigger.dart';
import 'package:flappy_bat/features/gameplay/world/components/pipes/pipe.dart';
import 'package:flappy_bat/features/gameplay/world/gameplay_config.dart';

/// Renders the player bat inside the game world.
class Bat extends PositionComponent with CollisionCallbacks {
  late final Sprite _sprite;
  final Vector2 _gravity = Vector2(0, BatConfig.gravity);
  Vector2 _velocity = Vector2(0, 0);
  final Vector2 _jumpForce = Vector2(0, BatConfig.jumpForce);

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
    final double width = BatConfig.width;
    size = Vector2(width, width * ratio);
    final double radius = size.x / 2;
    final Vector2 center = size / 2;
    add(
      CircleHitbox(
        radius: radius * 0.79,
        position: center * 1.1,
        anchor: .center,
      ),
    );
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

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is HiddenScoreTrigger) {
      // TODO(lmerten): increase score
      other.removeFromParent();
    } else if (other is Pipe) {
      // TODO(lmerten): game over
    }
  }
}
