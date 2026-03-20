import 'package:flame/game.dart';
import 'package:flappy_bat/features/gameplay/world/flappy_bat_game.dart';
import 'package:flutter/material.dart';

/// Displays the active gameplay session.
class GameView extends StatefulWidget {
  /// Creates the gameplay screen which displays the active gameplay session.
  const GameView({super.key});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  late FlappyBatGame _game;

  @override
  void initState() {
    super.initState();
    _game = FlappyBatGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(
        game: _game,
      ),
    );
  }
}
