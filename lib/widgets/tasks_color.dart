import 'dart:math';
import 'package:flutter/material.dart';

Color getRandomTaskColor()
{
  final colors = [
    Colors.blue.shade500,
    Colors.redAccent,
    Colors.orangeAccent,
    Colors.purpleAccent,
    Colors.teal,
    Colors.indigo,
  ];

  return colors[Random().nextInt(colors.length)];
}
