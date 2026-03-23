import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bat/features/gameplay/world/components/bat.dart';
import 'package:flappy_bat/features/gameplay/world/components/parallax_background.dart';
import 'package:flappy_bat/features/gameplay/world/components/pipes/pipe_pair.dart';
import 'package:flappy_bat/features/gameplay/world/gameplay_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Defines the main Flame game instance.
class FlappyBatGame extends FlameGame<FlappyBatWorld> with KeyboardEvents, HasCollisionDetection {
  /// Creates the main Flame game instance for the active gameplay session.
  FlappyBatGame()
    : super(
        world: FlappyBatWorld(),
        camera: CameraComponent.withFixedResolution(
          width: WorldConfig.width,
          height: WorldConfig.height,
        ),
      );

  @override
  KeyEventResult onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    final isKeyDown = event is KeyDownEvent;
    final isSpace = keysPressed.contains(LogicalKeyboardKey.space);

    if (isSpace && isKeyDown) {
      world.onSpaceDown();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }
}

/// Contains the components of the active game world.
class FlappyBatWorld extends World with TapCallbacks, HasGameReference<FlappyBatGame> {
  late final Bat _bat;
  late PipePair _lastPipes;

  @override
  void onLoad() {
    super.onLoad();
    add(ParallaxBackground());
    add(_bat = Bat());
    _generatePipes(fromX: PipeConfig.distance);
  }

  @override
  void update(double dt) {
    if (_bat.x >= _lastPipes.x) {
      _generatePipes(fromX: PipeConfig.distance);
      _removeOldPipes();
    }
    game.camera.viewfinder.zoom = 1;
    super.update(dt);
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    _bat.jump();
  }

  /// Applies the jump action.
  void onSpaceDown() {
    _bat.jump();
  }

  void _generatePipes({int count = 5, double fromX = 0}) {
    const double area = PipeConfig.spawnArea;
    for (int i = 0; i < count; i++) {
      final double y = (Random().nextDouble() * area) - (area / 2);
      add(_lastPipes = PipePair(position: Vector2(fromX + (i * PipeConfig.distance), y)));
    }
  }

  void _removeOldPipes() {
    final List<PipePair> pipes = List.from(children.whereType<PipePair>());
    final int shouldBeRemoved = max(pipes.length - 5, 0);
    pipes.take(shouldBeRemoved).forEach((pipe) => pipe.removeFromParent());
  }
}
