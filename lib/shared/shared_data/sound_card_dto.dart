import 'package:flutter/material.dart';

class SoundCardDto {
  final String title;
  final String image;
  final String sound;
  final Gradient? gradient;

  const SoundCardDto({
    required this.image,
    required this.sound,
    required this.title,
    this.gradient,
  });
}
