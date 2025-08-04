import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SoundCardWidget extends StatelessWidget {
  final String title;
  final String image;
  final String sound;
  const SoundCardWidget({
    super.key,
    required this.title,
    required this.image,
    required this.sound,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          '/timer_screen',
          extra: {'image': image, 'title': title, 'sound': sound},
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
            title,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
