import 'package:flutter/material.dart';

class SoundCardDto {
  String titleKey;
  final String image;
  final String sound;
  final Gradient? gradient;

  SoundCardDto({
    required this.image,
    required this.sound,
    required this.titleKey,
    this.gradient,
  });
}
