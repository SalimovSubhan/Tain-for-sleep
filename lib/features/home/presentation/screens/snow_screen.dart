import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rain_for_sleep/shared/shared_widgets/sound_card%20.dart';

class SnowScreen extends HookConsumerWidget {
  const SnowScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 42, 78, 162),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SoundCard(
                  title: 'Тишина в метели',
                  image: 'assets/images/snow/snow_1.png',
                  sound: 'assets/sounds/rain.mp3',
                ),
                SizedBox(width: 15),
                SoundCard(
                  title: 'Зимняя улица',
                  image: 'assets/images/snow/snow_2.png',
                  sound: 'assets/sounds/rain.mp3',
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SoundCard(
                  title: 'Вьюга',
                  image: 'assets/images/snow/snow_3.png',
                  sound: 'assets/sounds/rain.mp3',
                ),
                SizedBox(width: 15),
                SoundCard(
                  title: 'Снег на лесу',
                  image: 'assets/images/snow/snow_4.png',
                  sound: 'assets/sounds/rain.mp3',
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SoundCard(
                  title: 'Ночной снег',
                  image: 'assets/images/snow/snow_5.png',
                  sound: 'assets/sounds/rain.mp3',
                ),
                SizedBox(width: 15),
                SoundCard(
                  title: 'Снегопад',
                  image: 'assets/images/snow/snow_6.png',
                  sound: 'assets/sounds/rain.mp3',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
