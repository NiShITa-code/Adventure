import 'dart:async';
import 'package:flame/components.dart';
import '../adventure.dart';

// enum is a special type of class that
//represents a group of constants

// we use enum to represent the state of the player
enum PlayerState {
  idle,
  running,
}

// with keyword is used to mix in a class
// SpriteAnimationGroupComponent with HasGameRef<Adventure> means
// that we can use the methods and properties of the HasGameRef class
// in our Player class
// HasGameRef] mixin provides property [game] (or [gameRef]), which is the cached accessor for the top-level game instance.

class Player extends SpriteAnimationGroupComponent with HasGameRef<Adventure> {
  late final SpriteAnimation idleAnimation;
  late final SpriteAnimation runningAnimation;
  final double stepTime = 0.05;

  Player({position, required this.character}) : super(position: position);
  String character;

  @override
  FutureOr<void> onLoad() {
    _loadAllAnimations();
    return super.onLoad();
  }

  void _loadAllAnimations() {
    // Create animation
    // We use SpriteAnimation.fromFrameData to create an animation from a
    // image file that contains multiple frames.
    idleAnimation = _spriteAnimation('Idle', 11);
    runningAnimation = _spriteAnimation('Run', 12);
    // list of all animations
    animations = {
      PlayerState.idle: idleAnimation,
      PlayerState.running: runningAnimation,
    };

    // set the current animation
    current = PlayerState.idle;
  }

  SpriteAnimation _spriteAnimation(String state, int amount) {
    return SpriteAnimation.fromFrameData(
      game.images.fromCache(
        'Main Characters/$character/$state (32x32).png',
      ),
      SpriteAnimationData.sequenced(
        amount: amount,
        stepTime: stepTime,
        textureSize: Vector2.all(32),
      ),
    );
  }
}
