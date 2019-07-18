import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flame_app/components/fly.dart';
import 'package:flame_app/langaw_game.dart';

class HungryFly extends Fly {
  HungryFly(LangawGame game, double x, double y) : super(game, x, y) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize*1.65, game.tileSize*1.65);

    flyingSprite = List();
    flyingSprite.add(Sprite('flies/hungry-fly-1.png'));
    flyingSprite.add(Sprite('flies/hungry-fly-2.png'));
    deadSprite = Sprite('flies/hungry-fly-dead.png');
  }
}
