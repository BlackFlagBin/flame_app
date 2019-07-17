import 'dart:math';
import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'components/fly.dart';

class LangawGame extends Game {
  Size screenSize;
  double tileSize;
  List<Fly> flies;

  Random rnd;

  LangawGame() {
    initialize();
  }

  void initialize() async {
    rnd = Random();

    flies = List<Fly>();
    resize(await Flame.util.initialDimensions());

    spawnFly();
  }

  @override
  void render(Canvas canvas) {
    var bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    var bgPaint = Paint()..color = Color(0xff576574);
    canvas.drawRect(bgRect, bgPaint);
    flies.forEach((Fly fly) => fly.render(canvas));
  }

  @override
  void update(double t) {
    flies.forEach((Fly fly) => fly.update(t));
    flies.removeWhere((Fly fly) => fly.isOffScreen);
  }

  @override
  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

  void onTapDown(TapDownDetails tapDownDetails) {
    flies.forEach((Fly fly) => {
          if (fly.flyRect.contains(tapDownDetails.globalPosition))
            {fly.onTapDown()}
        });
  }

  void spawnFly() {
    var x = rnd.nextDouble() * (screenSize.width - tileSize);
    var y = rnd.nextDouble() * (screenSize.height - tileSize);
    flies.add(Fly(this, x, y));
  }
}
