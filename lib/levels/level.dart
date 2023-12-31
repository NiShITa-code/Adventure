import 'dart:async';
import 'package:adventure/actors/player.dart';
import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';

class Level extends World {
  final String levelName;
  Level({required this.levelName});
  late TiledComponent level;

  // An onLoad event
  // This is called when the level is loaded
  @override
  FutureOr<void> onLoad() async {
    level = await TiledComponent.load(
      '$levelName.tmx',
      Vector2.all(16),
    );
    add(level);
    final spawnPointsLayer = level.tileMap.getLayer<ObjectGroup>('SpawnPoints');
    if (spawnPointsLayer != null) {
      for (final spawnPoint in spawnPointsLayer.objects) {
        switch (spawnPoint.class_) {
          case 'Player':
            final player = Player(
              character: 'Mask Dude',
              position: Vector2(
                spawnPoint.x,
                spawnPoint.y,
              ),
            );
            add(player);
            break;
          default:
        }
      }
    }

    // super calls the parent class's onLoad method
    return super.onLoad();
  }
}
