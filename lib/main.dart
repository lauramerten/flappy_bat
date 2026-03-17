import 'package:flappy_bat/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Main entry point.
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const App());
}
