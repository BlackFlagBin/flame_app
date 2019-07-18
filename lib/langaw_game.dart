import 'dart:math';
import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'components/agile_fly.dart';
import 'components/backyard.dart';
import 'components/drooler_fly.dart';
import 'components/fly.dart';
import 'components/house_fly.dart';
import 'components/hungry_fly.dart';
import 'components/macho_fly.dart';

class LangawGame extends Game {
  Size screenSize;
  double tileSize;
  List<Fly> flies;
  Backyard background;

  Random rnd;

  LangawGame() {
    initialize();
  }

  void initialize() async {
    rnd = Random();

    flies = List<Fly>();
    resize(await Flame.util.initialDimensions());

    background = Backyard(this);
    spawnFly();
  }

  @override
  void render(Canvas canvas) {
    background.render(canvas);
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
    var x = rnd.nextDouble() * (screenSize.width - tileSize * 2.025);
    var y = rnd.nextDouble() * (screenSize.height - tileSize * 2.025);
    switch (rnd.nextInt(5)) {
      case 0:
        flies.add(HouseFly(this, x, y));
        break;
      case 1:
        flies.add(DroolerFly(this, x, y));
        break;
      case 2:
        flies.add(AgileFly(this, x, y));
        break;
      case 3:
        flies.add(MachoFly(this, x, y));
        break;
      case 4:
        flies.add(HungryFly(this, x, y));
        break;
    }
  }
}
