import 'package:flame/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';

import 'box_game.dart';

void main() async {
  var flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);
  
  var boxGame = BoxGame();
  var tapper = TapGestureRecognizer();
  tapper.onTapDown=boxGame.onTapDown;
  runApp(boxGame.widget);

  flameUtil.addGestureRecognizer(tapper);
}
