import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rain_for_sleep/shared/shared_data/sound_card_dto.dart';
import 'package:rain_for_sleep/shared/shared_widgets/sound_card_widget.dart';

class AllScreen extends HookConsumerWidget {
  const AllScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const List<SoundCardDto> soundCards = [
      SoundCardDto(
        sound: 'assets/sounds/rain.mp3',
        image: 'assets/images/rain/rain_1.png',
        title: 'дожд',
      ),
      SoundCardDto(
        sound: 'assets/sounds/rain.mp3',
        image: 'assets/images/snow/snow_1.png',
        title: 'дожд',
      ),
      SoundCardDto(
        sound: 'assets/sounds/rain.mp3',
        image: 'assets/images/rain/rain_2.png',
        title: 'дожд',
      ),
      SoundCardDto(
        sound: 'assets/sounds/rain.mp3',
        image: 'assets/images/rain/rain_6.png',
        title: 'дожд',
      ),
      SoundCardDto(
        sound: 'assets/sounds/rain.mp3',
        image: 'assets/images/snow/snow_3.png',
        title: 'дожд',
      ),
      SoundCardDto(
        sound: 'assets/sounds/rain.mp3',
        image: 'assets/images/rain/rain_3.png',
        title: 'дожд',
      ),
      SoundCardDto(
        sound: 'assets/sounds/rain.mp3',
        image: 'assets/images/snow/snow_4.png',
        title: 'дожд',
      ),
      SoundCardDto(
        sound: 'assets/sounds/rain.mp3',
        image: 'assets/images/rain/rain_4.png',
        title: 'дожд',
      ),
    ];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 42, 78, 162),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: GridView.builder(
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemBuilder: (context, index) {
            final soundCard = soundCards[index];
            return SoundCardWidget(
              image: soundCard.image,
              sound: soundCard.sound,
              title: soundCard.title,
            );
          },
          itemCount: soundCards.length,
        ),
      ),
    );
  }
}
