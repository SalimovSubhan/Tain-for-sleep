import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rain_for_sleep/router/router.dart';
import 'package:rain_for_sleep/shared/shared_data/sound_card_dto.dart';

class SoundCardWidget extends StatelessWidget {
  final SoundCardDto soundCard;
  const SoundCardWidget({super.key, required this.soundCard});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.pushTimerScreen(context: context, soundCard: soundCard);
      },
      child: Container(
        height: 170,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(soundCard.image),
            fit: BoxFit.cover,
          ),
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
            soundCard.titleKey.tr(),
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
