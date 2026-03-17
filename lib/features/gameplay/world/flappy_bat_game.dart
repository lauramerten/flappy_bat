import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flappy_bat/features/gameplay/world/components/bat.dart';
import 'package:flappy_bat/features/gameplay/world/components/parallax_background.dart';

/// Defines the main Flame game instance.
class FlappyBatGame extends FlameGame<FlappyBatWorld> {
  /// Creates the main Flame game instance for the active gameplay session.
  FlappyBatGame()
    : super(
        world: FlappyBatWorld(),
        camera: CameraComponent.withFixedResolution(
          width: 600,
          height: 1000,
        ),
      );
}

/// Contains the components of the active game world.
class FlappyBatWorld extends World {
  @override
  void onLoad() {
    super.onLoad();
    add(ParallaxBackground());
    add(Bat());
  }
}
