import 'package:flutter/material.dart';
import 'package:rain_for_sleep/shared/shared_data/sound_card_dto.dart';

class SoundsSevices {
  //all
  static List<SoundCardDto> allSoundCards = [
    SoundCardDto(
      sound: 'assets/sounds/relax/beach.mp3',
      image: 'assets/images/relax/relax2.png',
      titleKey: 'beach',
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF4FC3F7), Color(0xFF81C784)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/sleep/fire.mp3',
      image: 'assets/images/sleep/sleep2.png',
      titleKey: 'crackling_fire',
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFFF7043), Color(0xFF4E342E)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/rain/rain_on_window.mp3',
      image: 'assets/images/rain/rain_1.png',
      titleKey: 'rain_on_window',
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFa6c8e0), Color(0xFF3a5c73)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/rain/morning_rain.mp3',
      image: 'assets/images/rain/rain_2.png',
      titleKey: 'morning_rain',
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFb8f1a9), Color(0xFF3c9c3f)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/relax/fireplace.mp3',
      image: 'assets/images/relax/relax1.png',
      titleKey: 'fireplace',
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFFF8A65), Color(0xFF4E342E)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/snow/winter_forest.mp3',
      image: 'assets/images/snow/snow_1.png',
      titleKey: 'winter_silence_forest',
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF1e3c72), Color(0xFF2a5298)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/rain/rain_on_the_umbrela.mp3',
      image: 'assets/images/rain/rain_3.png',
      titleKey: 'rain_on_umbrella',
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF9cd0f9), Color(0xFF276fbf)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/relax/walking.mp3',
      image: 'assets/images/relax/relax6.png',
      titleKey: 'sand_underfoot',
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFFFF3E0), Color(0xFFBCAAA4)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/snow/snow_house.mp3',
      image: 'assets/images/snow/snow_2.png',
      titleKey: 'snowy_night_house',
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF0f2027), Color(0xFF203a43)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/rain/rain_on_the_roof.mp3',
      image: 'assets/images/rain/rain_4.png',
      titleKey: 'rain_on_roof',
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFa6c6dc), Color(0xFF34516a)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/rain/rain_on_leaves.mp3',
      image: 'assets/images/rain/rain_5.png',
      titleKey: 'rain_on_leaves',
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFb4f1b4), Color(0xFF1b5e20)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/rain/gentle_rain.mp3',
      image: 'assets/images/rain/rain_6.png',
      titleKey: 'gentle_rain',
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF4f5b62), Color(0xFF263238)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/relax/forestbirds.mp3',
      image: 'assets/images/relax/relax3.png',
      titleKey: 'forest_lake',
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF81C784), Color(0xFF4FC3F7)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/relax/water_small_stream.mp3',
      image: 'assets/images/relax/relax4.png',
      titleKey: 'quiet_stream',
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF80CBC4), Color(0xFF009688)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/rain/rain_on_the_tent.mp3',
      image: 'assets/images/rain/rain_7.png',
      titleKey: 'rain_on_tent',
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF4CAF50), Color(0xFF1B5E20)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/sleep/airplane.mp3',
      image: 'assets/images/sleep/sleep3.png',
      titleKey: 'in_airplane',
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF90A4AE), Color(0xFF37474F)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/sleep/beach.mp3',
      image: 'assets/images/sleep/sleep1.png',
      titleKey: 'evening_beach',
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFFFA726), Color(0xFFEF6C00)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/relax/ocean.mp3',
      image: 'assets/images/relax/relax5.png',
      titleKey: 'ocean',
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF4FC3F7), Color(0xFF0288D1)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/sleep/night_shore.mp3',
      image: 'assets/images/sleep/sleep4.png',
      titleKey: 'moonlight',
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF0D1B2A), Color(0xFF1B263B)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/snow/snow_storm.mp3',
      image: 'assets/images/snow/snow_4.png',
      titleKey: 'blizzard',
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF263238), Color(0xFF455A64)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/snow/snowstorm_among_firs.mp3',
      image: 'assets/images/snow/snow_3.png',
      titleKey: 'snowstorm_firs',
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF607D8B), Color(0xFF90A4AE)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/rain/rain_on_the_home.mp3',
      image: 'assets/images/rain/rain_8.png',
      titleKey: 'rain_on_home',
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF0D1B2A), Color(0xFF1B263B)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/snow/walk_on_snow.mp3',
      image: 'assets/images/snow/snow_5.png',
      titleKey: 'snow_walk_evening',
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF37474F), Color(0xFF78909C)],
      ),
    ),
  ];

  //rain
  static List<SoundCardDto> rainSoundCards = [
    SoundCardDto(
      sound: 'assets/sounds/rain/rain_on_window.mp3',
      image: 'assets/images/rain/rain_1.png',
      titleKey: 'rain_on_window',
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFa6c8e0), Color(0xFF3a5c73)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/rain/morning_rain.mp3',
      image: 'assets/images/rain/rain_2.png',
      titleKey: 'morning_rain',
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFb8f1a9), Color(0xFF3c9c3f)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/rain/rain_on_the_umbrela.mp3',
      image: 'assets/images/rain/rain_3.png',
      titleKey: 'rain_on_umbrella',
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF9cd0f9), Color(0xFF276fbf)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/rain/rain_on_the_roof.mp3',
      image: 'assets/images/rain/rain_4.png',
      titleKey: 'rain_on_roof',
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFa6c6dc), Color(0xFF34516a)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/rain/rain_on_leaves.mp3',
      image: 'assets/images/rain/rain_5.png',
      titleKey: 'rain_on_leaves',
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFb4f1b4), Color(0xFF1b5e20)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/rain/gentle_rain.mp3',
      image: 'assets/images/rain/rain_6.png',
      titleKey: 'gentle_rain',
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF4f5b62), Color(0xFF263238)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/rain/rain_on_the_tent.mp3',
      image: 'assets/images/rain/rain_7.png',
      titleKey: 'rain_on_tent',
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF4CAF50), Color(0xFF1B5E20)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/rain/rain_on_the_home.mp3',
      image: 'assets/images/rain/rain_8.png',
      titleKey: 'rain_on_home',
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF0D1B2A), Color(0xFF1B263B)],
      ),
    ),
  ];

  //snow
  static List<SoundCardDto> snowSoundCards = [
    SoundCardDto(
      sound: 'assets/sounds/snow/winter_forest.mp3',
      image: 'assets/images/snow/snow_1.png',
      titleKey: 'winter_silence_forest',
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF1e3c72), Color(0xFF2a5298)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/snow/snow_house.mp3',
      image: 'assets/images/snow/snow_2.png',
      titleKey: 'snowy_night_house',
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF0f2027), Color(0xFF203a43)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/snow/snowstorm_among_firs.mp3',
      image: 'assets/images/snow/snow_3.png',
      titleKey: 'snowstorm_firs',
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF607D8B), Color(0xFF90A4AE)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/snow/snow_storm.wav',
      image: 'assets/images/snow/snow_4.png',
      titleKey: 'blizzard',
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF263238), Color(0xFF455A64)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/snow/walk_on_snow.mp3',
      image: 'assets/images/snow/snow_5.png',
      titleKey: 'snow_walk_evening',
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF37474F), Color(0xFF78909C)],
      ),
    ),
  ];

  //sleep
  static List<SoundCardDto> sleepSoundCards = [
    SoundCardDto(
      sound: 'assets/sounds/sleep/beach.mp3',
      image: 'assets/images/sleep/sleep1.png',
      titleKey: 'evening_beach',
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFFFA726), Color(0xFFEF6C00)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/sleep/fire.mp3',
      image: 'assets/images/sleep/sleep2.png',
      titleKey: 'crackling_fire',
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFFF7043), Color(0xFF4E342E)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/sleep/airplane.mp3',
      image: 'assets/images/sleep/sleep3.png',
      titleKey: 'in_airplane',
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF90A4AE), Color(0xFF37474F)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/sleep/night_shore.mp3',
      image: 'assets/images/sleep/sleep4.png',
      titleKey: 'moonlight',
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF0D1B2A), Color(0xFF1B263B)],
      ),
    ),
  ];

  //relax
  static List<SoundCardDto> relaxSoundCards = [
    SoundCardDto(
      sound: 'assets/sounds/relax/fireplace.mp3',
      image: 'assets/images/relax/relax1.png',
      titleKey: 'fireplace',
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFFF8A65), Color(0xFF4E342E)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/relax/beach.mp3',
      image: 'assets/images/relax/relax2.png',
      titleKey: 'beach',
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF4FC3F7), Color(0xFF81C784)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/relax/forestbirds.mp3',
      image: 'assets/images/relax/relax3.png',
      titleKey: 'forest_lake',
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF81C784), Color(0xFF4FC3F7)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/relax/water_small_stream.mp3',
      image: 'assets/images/relax/relax4.png',
      titleKey: 'quiet_stream',
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF80CBC4), Color(0xFF009688)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/relax/ocean.mp3',
      image: 'assets/images/relax/relax5.png',
      titleKey: 'ocean',
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF4FC3F7), Color(0xFF0288D1)],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/relax/walking.mp3',
      image: 'assets/images/relax/relax6.png',
      titleKey: 'sand_underfoot',
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFFFF3E0), Color(0xFFBCAAA4)],
      ),
    ),
  ];
}
