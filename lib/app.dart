import 'package:flappy_bat/features/gameplay/presentation/game_view.dart';
import 'package:flutter/material.dart';

/// Configures the root widget tree of the app.
class App extends StatelessWidget {
  /// Creates the root widget tree of the app.
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flappy Bat",
      debugShowCheckedModeBanner: false,
      home: GameView(),
    );
  }
}
