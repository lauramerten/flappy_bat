import 'package:flame/components.dart';
import 'package:flappy_bat/features/gameplay/world/components/pipes/pipe.dart';

/// Groups the top and bottom pipes.
class PipePair extends PositionComponent {
  /// The vertical gap between the pipes.
  final double gap;

  /// The speed of the pipes.
  final double speed;

  /// Creates a moving pair of pipes at the provided world position.
  PipePair({
    required super.position,
    this.gap = 250,
    this.speed = 270,
  });

  @override
  void onLoad() {
    super.onLoad();
    addAll([
      Pipe.bottom(position: Vector2(0, gap / 2)),
      Pipe.top(position: Vector2(0, -gap / 2)),
    ]);
  }

  @override
  void update(double dt) {
    position.x -= speed * dt;
    super.update(dt);
  }
}
