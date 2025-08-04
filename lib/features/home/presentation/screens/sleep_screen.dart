import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rain_for_sleep/shared/shared_widgets/sound_card%20.dart';

class SllipScreen extends HookConsumerWidget {
  const SllipScreen({super.key});

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
                  title: 'дожд',
                  image: 'assets/images/sleep/sleep1.png',
                  sound: 'assets/sounds/rain.mp3',
                ),
                SizedBox(width: 15),
                SoundCard(
                  title: 'дожд',
                  image: 'assets/images/sleep/sleep2.png',
                  sound: 'assets/sounds/rain.mp3',
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SoundCard(
                  title: 'дожд',
                  image: 'assets/images/sleep/sleep3.png',
                  sound: 'assets/sounds/rain.mp3',
                ),
                SizedBox(width: 15),
                SoundCard(
                  title: 'дожд',
                  image: 'assets/images/sleep/sleep4.png',
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
