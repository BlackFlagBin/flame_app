import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flame_app/langaw_game.dart';

import 'fly.dart';

class AgileFly extends Fly {
  double get speed => game.tileSize * 3;

  AgileFly(LangawGame game, double x, double y) : super(game, x, y) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.5, game.tileSize * 1.5);

    flyingSprite = List();
    flyingSprite.add(Sprite('flies/agile-fly-1.png'));
    flyingSprite.add(Sprite('flies/agile-fly-2.png'));
    deadSprite = Sprite('flies/agile-fly-dead.png');
  }
}
