import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BoxGame extends Game {
  Size screenSize;
  bool hasWon = false;

  @override
  void render(Canvas canvas) {
    var bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    var bgPaint = Paint()..color = Color(0xff000000);
    canvas.drawRect(bgRect, bgPaint);

    var boxRect = Rect.fromLTWH(
        screenSize.width / 2 - 75, screenSize.height / 2 - 75, 150, 150);

    var boxPaint = Paint();
    if (hasWon) {
      boxPaint.color = Color(0xff00ff00);
    } else {
      boxPaint.color = Color(0xffffff);
    }
    canvas.drawRect(boxRect, boxPaint);
  }

  @override
  void update(double t) {}

  @override
  void resize(Size size) {
    screenSize = size;
    super.resize(size);
  }

  void onTapDown(TapDownDetails detail) {
    var screenCenterX = screenSize.width / 2;
    var screenCenterY = screenSize.height / 2;
    if (detail.globalPosition.dx >= screenCenterX - 75 &&
        detail.globalPosition.dx <= screenCenterX + 75 &&
        detail.globalPosition.dy >= screenCenterY - 75 &&
        detail.globalPosition.dy < screenCenterY + 75) {
      hasWon = true;
    } else {
      hasWon = false;
    }
  }
}
