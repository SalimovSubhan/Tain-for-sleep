import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rain_for_sleep/shared/shared_widgets/sound_card%20.dart';

class RainScreen extends HookConsumerWidget {
  const RainScreen({super.key});

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
                  title: 'Тропический дождь',
                  image: 'assets/images/rain/rain_1.png',
                  sound: 'assets/sounds/rain.mp3',
                ),
                SizedBox(width: 15),
                SoundCard(
                  title: 'Утренний дождь',
                  image: 'assets/images/rain/rain_2.png',
                  sound: 'assets/sounds/rain.mp3',
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SoundCard(
                  title: 'Зонтик и дождь',
                  image: 'assets/images/rain/rain_3.png',
                  sound: 'assets/sounds/rain.mp3',
                ),
                SizedBox(width: 15),
                SoundCard(
                  title: 'Дождь по крыше',
                  image: 'assets/images/rain/rain_4.png',
                  sound: 'assets/sounds/rain.mp3',
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SoundCard(
                  title: 'Ливень на крыше',
                  image: 'assets/images/rain/rain_5.png',
                  sound: 'assets/sounds/rain.mp3',
                ),
                SizedBox(width: 15),
                SoundCard(
                  title: 'Лёгкий дождь',
                  image: 'assets/images/rain/rain_6.png',
                  sound: 'assets/sounds/rain.mp3',
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SoundCard(
                  title: 'Ливень на деревьях',
                  image: 'assets/images/rain/rain_7.png',
                  sound: 'assets/sounds/rain.mp3',
                ),
                SizedBox(width: 15),
                SoundCard(
                  title: 'Трасса в дожде',
                  image: 'assets/images/rain/rain_8.png',
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
