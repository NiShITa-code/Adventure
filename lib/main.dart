import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'adventure.dart';

void main() {
  // This line is required to initialize the engine before using any of the
  // other Flame features.
  WidgetsFlutterBinding.ensureInitialized();
  // This line enables full-screen mode.
  Flame.device.fullScreen();
  // This line forces the device into landscape mode.
  Flame.device.setLandscape();
  Adventure game = Adventure();
  runApp(GameWidget(
    // We use adventure so that we can use hot reload during development.    // In production, we use the game variable because it is more efficient.

    game: kDebugMode ? Adventure() : game,
  ));
}
