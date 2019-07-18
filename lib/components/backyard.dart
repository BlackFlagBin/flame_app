import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flame_app/langaw_game.dart';

class Backyard {
  LangawGame game;
  Sprite bgSprite;
  Rect bgRect;

  Backyard(this.game) {
    bgSprite = Sprite("bg/backyard.png");
    bgRect = Rect.fromLTWH(0, game.screenSize.height - game.tileSize * 24,
        game.tileSize * 9, game.tileSize * 24);
  }

  void render(Canvas canvas) {
    bgSprite.renderRect(canvas, bgRect);
  }

  void update(double t) {}
}
