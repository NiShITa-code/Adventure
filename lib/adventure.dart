import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'levels/level.dart';

class Adventure extends FlameGame {
  @override
  Color backgroundColor() => const Color(0xFF211F30);
  // The camera is a component that allows us to
  // move around the world
  // We use camera to view the level

  late final CameraComponent cam;
  final world = Level(levelName: 'level_02');
  @override
  FutureOr<void> onLoad() async {
    // Load all images to cache
    await images.loadAllImages();
    cam = CameraComponent.withFixedResolution(
      width: 640,
      height: 360,
      world: world,
    );

    cam.viewfinder.anchor = Anchor.topLeft;
    addAll([
      cam,
      world,
    ]);
    return super.onLoad();
  }
}
