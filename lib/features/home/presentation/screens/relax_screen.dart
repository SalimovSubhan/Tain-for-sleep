import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rain_for_sleep/shared/shared_widgets/sound_card%20.dart';

class RelaxScreen extends HookConsumerWidget {
  const RelaxScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 42, 78, 162),
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SoundCard(
                  title: 'Камин',
                  image: 'assets/images/relax/relax1.png',
                  sound: 'assets/sounds/rain.mp3',
                ),
                SizedBox(width: 15),
                SoundCard(
                  title: 'Пляж',
                  image: 'assets/images/relax/relax2.png',
                  sound: 'assets/sounds/rain.mp3',
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SoundCard(
                  title: 'Лесное озеро',
                  image: 'assets/images/relax/relax3.png',
                  sound: 'assets/sounds/rain.mp3',
                ),
                SizedBox(width: 15),
                SoundCard(
                  title: 'Тихий ручей',
                  image: 'assets/images/relax/relax4.png',
                  sound: 'assets/sounds/rain.mp3',
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SoundCard(
                  title: 'Океан',
                  image: 'assets/images/relax/relax5.png',
                  sound: 'assets/sounds/rain.mp3',
                ),
                SizedBox(width: 15),
                SoundCard(
                  title: 'Песок под ногами',
                  image: 'assets/images/relax/relax6.png',
                  sound: 'assets/sounds/rain.mp3',
                ),
              ],
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
