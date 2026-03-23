import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy_bat/features/gameplay/world/gameplay_config.dart';

/// Invisible trigger area that awards a score once the bat passes a pipe pair.
class HiddenScoreTrigger extends PositionComponent {
  /// Creates the hidden scoring trigger at the provided world position.
  HiddenScoreTrigger({required super.position})
    : super(
        size: Vector2(ScoreTriggerConfig.width, ScoreTriggerConfig.height),
        anchor: .center,
      );

  @override
  void onLoad() {
    super.onLoad();
    add(RectangleHitbox(collisionType: .passive));
  }
}
