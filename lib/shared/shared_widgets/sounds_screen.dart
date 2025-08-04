import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rain_for_sleep/shared/shared_data/sound_card_dto.dart';
import 'package:rain_for_sleep/shared/shared_widgets/sound_card_widget.dart';

class SoundsScreen extends HookConsumerWidget {
  const SoundsScreen({super.key, required this.soundCards});
  final List<SoundCardDto> soundCards;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 42, 78, 162),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: GridView.builder(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          padding: const EdgeInsets.only(bottom: 15),
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
