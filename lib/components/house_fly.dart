import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flame_app/langaw_game.dart';

import 'fly.dart';

class HouseFly extends Fly {
  HouseFly(LangawGame game, double x, double y) : super(game, x, y) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);

    flyingSprite = [];
    flyingSprite.add(Sprite("flies/house-fly-1.png"));
    flyingSprite.add(Sprite("flies/house-fly-2.png"));
    deadSprite = Sprite("flies/house-fly-dead.png");
  }
}
