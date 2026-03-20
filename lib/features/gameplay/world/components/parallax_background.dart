import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flappy_bat/features/gameplay/world/flappy_bat_game.dart';

/// Renders the scrolling background of the game world.
class ParallaxBackground extends ParallaxComponent<FlappyBatGame> {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    anchor = .center;
    parallax = await game.loadParallax(
      [
        ParallaxImageData("background/01-sky.png"),
        ParallaxImageData("background/02-distant-clouds.png"),
        ParallaxImageData("background/03-distant-clouds.png"),
        ParallaxImageData("background/04-clouds.png"),
        ParallaxImageData("background/05-huge-clouds.png"),
        ParallaxImageData("background/06-hill.png"),
        ParallaxImageData("background/07-hill.png"),
        ParallaxImageData("background/08-bushes.png"),
        ParallaxImageData("background/09-distant-trees.png"),
        ParallaxImageData("background/10-trees.png"),
        ParallaxImageData("background/11-ground.png"),
      ],
      baseVelocity: Vector2(1, 0),
      velocityMultiplierDelta: Vector2(1.57, 0),
    );
  }
}
