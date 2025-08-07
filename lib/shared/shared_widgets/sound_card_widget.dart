import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SoundCardWidget extends StatelessWidget {
  final String titleKey;
  final String image;
  final String sound;
  final Gradient? gradient;
  const SoundCardWidget({
    super.key,
    required this.titleKey,
    required this.image,
    required this.sound,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          '/timer_screen',
          extra: {
            'image': image,
            'title': titleKey,
            'sound': sound,
            'gradient': gradient,
          },
        );
      },
      child: Container(
        height: 170,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 40,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(108),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Text(
            titleKey.tr(),
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
