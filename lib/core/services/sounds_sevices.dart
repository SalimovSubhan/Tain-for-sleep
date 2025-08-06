import 'package:flutter/material.dart';
import 'package:rain_for_sleep/shared/shared_data/sound_card_dto.dart';

class SoundsSevices {
  //all
  static const List<SoundCardDto> allSoundCards = [
    SoundCardDto(
      sound: 'assets/sounds/relax/beach.mp3',
      image: 'assets/images/relax/relax2.png',
      title: 'Пляж',
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF4FC3F7), // небесно-голубой
          Color(0xFF81C784), // тропическая зелень
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/sleep/fire.mp3',
      image: 'assets/images/sleep/sleep2.png',
      title: 'Треск костра',
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFFF7043), // огненно-оранжевый
          Color(0xFF4E342E), // тёмный древесный коричневый
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/rain/rain_on_window.mp3',
      image: 'assets/images/rain/rain_1.png',
      title: 'Дождь в окно',
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFa6c8e0), // светло-голубой (вверху)
          Color(0xFF3a5c73), // тёмно-синий (внизу)
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/rain/morning_rain.mp3',
      image: 'assets/images/rain/rain_2.png',
      title: 'Утренний дождь',
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFb8f1a9), // светло-зелёный (вверху, мягкий свет)
          Color(0xFF3c9c3f), // насыщенный зелёный (внизу, трава)
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/relax/fireplace.mp3',
      image: 'assets/images/relax/relax1.png',
      title: 'Камин',
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFFF8A65), // огненно-оранжевый
          Color(0xFF4E342E), // древесно-коричневый
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/snow/winter_forest.mp3',
      image: 'assets/images/snow/snow_1.png',
      title: 'Зимняя тишина в лесу',
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF1e3c72), // тёмно-синий, как небо
          Color(0xFF2a5298), // снежный синий
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/rain/rain_on_the_umbrela.mp3',
      image: 'assets/images/rain/rain_3.png',
      title: 'Дождь по зонтику',
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF9cd0f9), // голубой утренний (выше, мягкий свет)
          Color(0xFF276fbf), // насыщенный синий (внизу — оттенок зонта)
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/relax/walking.mp3',
      image: 'assets/images/relax/relax6.png',
      title: 'Песок под ногами',
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFFFF3E0), // светло-бежевый
          Color(0xFFBCAAA4), // песочно-коричневый
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/snow/snow_house.mp3',
      image: 'assets/images/snow/snow_2.png',
      title: 'Дом в заснеженной ночи',
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF0f2027), // ночной чёрно-синий
          Color(0xFF203a43), // приглушённый тёмно-синий
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/rain/rain_on_the_roof.mp3',
      image: 'assets/images/rain/rain_4.png',
      title: 'Дождь по крыше',
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFa6c6dc), // светло-серый с синим оттенком (как небо)
          Color(0xFF34516a), // тёмный сине-серый (как крыша под дождём)
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/rain/rain_on_leaves.mp3',
      image: 'assets/images/rain/rain_5.png',
      title: 'Ливень на листьях',
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFb4f1b4), // светло-зелёный, как верх листьев
          Color(0xFF1b5e20), // глубокий зелёный, как тень под листьями
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/rain/gentle_rain.mp3',
      image: 'assets/images/rain/rain_6.png',
      title: 'Лёгкий дождь',
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF4f5b62), // серо-синий (небо, мокрая атмосфера)
          Color(0xFF263238), // тёмно-серый, асфальт, вечерний дождь
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/relax/forestbirds.mp3',
      image: 'assets/images/relax/relax3.png',
      title: 'Лесное озеро',
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF81C784), // мягкий зелёный (лес)
          Color(0xFF4FC3F7), // голубой (озеро)
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/relax/water_small_stream.mp3',
      image: 'assets/images/relax/relax4.png',
      title: 'Тихий ручей',
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF80CBC4), // мятный
          Color(0xFF009688), // тёмный бирюзовый
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/rain/rain_on_the_tent.mp3',
      image: 'assets/images/rain/rain_7.png',
      title: 'Дождь по палатке',
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF4CAF50), // насыщенный зелёный
          Color(0xFF1B5E20), // тёмный лесной зелёный
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/sleep/airplane.mp3',
      image: 'assets/images/sleep/sleep3.png',
      title: 'В самолёта',
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF90A4AE), // светло-серый / мягкий воздух
          Color(0xFF37474F), // металлический серо-синий
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/sleep/beach.mp3',
      image: 'assets/images/sleep/sleep1.png',
      title: 'Пляж вечером',
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFFFA726), // оранжево-жёлтый закат
          Color(0xFFEF6C00), // насыщенный закатный оранжевый
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/relax/ocean.mp3',
      image: 'assets/images/relax/relax5.png',
      title: 'Океан',
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF4FC3F7), // небесный
          Color(0xFF0288D1), // океанский синий
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/sleep/night_shore.mp3',
      image: 'assets/images/sleep/sleep4.png',
      title: 'Лунный свет',
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF0D1B2A), // глубокий ночной синий
          Color(0xFF1B263B), // тёмно-синий / небо с луной
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/snow/snow_storm.wav',
      image: 'assets/images/snow/snow_4.png',
      title: 'Буря',
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF263238), // холодный серый
          Color(0xFF455A64), // буря и ветер
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/snow/snowstorm_among_firs.mp3',
      image: 'assets/images/snow/snow_3.png',
      title: 'Снежная буря среди елей',
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF607D8B), // серо-синий как снег и ветер
          Color(0xFF90A4AE), // более светлый для нижнего свечения
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/rain/rain_on_the_home.mp3',
      image: 'assets/images/rain/rain_8.png',
      title: 'Дом под дождём',
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF0D1B2A), // глубокий синий/ночной
          Color(0xFF1B263B), // тёмно-синий с оттенком серого
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/snow/walk_on_snow.mp3',
      image: 'assets/images/snow/snow_5.png',
      title: 'Прогулка в метельной вечери',
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF37474F), // тёмный синий как вечер
          Color(0xFF78909C), // приглушённый серо-голубой
        ],
      ),
    ),
  ];

  //rain
  static const List<SoundCardDto> rainSoundCards = [
    SoundCardDto(
      sound: 'assets/sounds/rain/rain_on_window.mp3',
      image: 'assets/images/rain/rain_1.png',
      title: 'Дождь в окно',
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFa6c8e0), // светло-голубой (вверху)
          Color(0xFF3a5c73), // тёмно-синий (внизу)
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/rain/morning_rain.mp3',
      image: 'assets/images/rain/rain_2.png',
      title: 'Утренний дождь',
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFb8f1a9), // светло-зелёный (вверху, мягкий свет)
          Color(0xFF3c9c3f), // насыщенный зелёный (внизу, трава)
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/rain/rain_on_the_umbrela.mp3',
      image: 'assets/images/rain/rain_3.png',
      title: 'Дождь по зонтику',
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF9cd0f9), // голубой утренний (выше, мягкий свет)
          Color(0xFF276fbf), // насыщенный синий (внизу — оттенок зонта)
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/rain/rain_on_the_roof.mp3',
      image: 'assets/images/rain/rain_4.png',
      title: 'Дождь по крыше',
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFa6c6dc), // светло-серый с синим оттенком (как небо)
          Color(0xFF34516a), // тёмный сине-серый (как крыша под дождём)
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/rain/rain_on_leaves.mp3',
      image: 'assets/images/rain/rain_5.png',
      title: 'Ливень на листьях',
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFb4f1b4), // светло-зелёный, как верх листьев
          Color(0xFF1b5e20), // глубокий зелёный, как тень под листьями
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/rain/gentle_rain.mp3',
      image: 'assets/images/rain/rain_6.png',
      title: 'Лёгкий дождь',
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF4f5b62), // серо-синий (небо, мокрая атмосфера)
          Color(0xFF263238), // тёмно-серый, асфальт, вечерний дождь
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/rain/rain_on_the_tent.mp3',
      image: 'assets/images/rain/rain_7.png',
      title: 'Дождь по палатке',
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF4CAF50), // насыщенный зелёный
          Color(0xFF1B5E20), // тёмный лесной зелёный
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/rain/rain_on_the_home.mp3',
      image: 'assets/images/rain/rain_8.png',
      title: 'Дом под дождём',
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF0D1B2A), // глубокий синий/ночной
          Color(0xFF1B263B), // тёмно-синий с оттенком серого
        ],
      ),
    ),
  ];

  //snow
  static const List<SoundCardDto> snowSoundCards = [
    SoundCardDto(
      sound: 'assets/sounds/snow/winter_forest.mp3',
      image: 'assets/images/snow/snow_1.png',
      title: 'Зимняя тишина в лесу',
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF1e3c72), // тёмно-синий, как небо
          Color(0xFF2a5298), // снежный синий
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/snow/snow_house.mp3',
      image: 'assets/images/snow/snow_2.png',
      title: 'Дом в заснеженной ночи',
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF0f2027), // ночной чёрно-синий
          Color(0xFF203a43), // приглушённый тёмно-синий
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/snow/snowstorm_among_firs.mp3',
      image: 'assets/images/snow/snow_3.png',
      title: 'Снежная буря среди елей',
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF607D8B), // серо-синий как снег и ветер
          Color(0xFF90A4AE), // более светлый для нижнего свечения
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/snow/snow_storm.wav',
      image: 'assets/images/snow/snow_4.png',
      title: 'Буря',
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF263238), // холодный серый
          Color(0xFF455A64), // буря и ветер
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/snow/walk_on_snow.mp3',
      image: 'assets/images/snow/snow_5.png',
      title: 'Прогулка в метельной вечери',
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF37474F), // тёмный синий как вечер
          Color(0xFF78909C), // приглушённый серо-голубой
        ],
      ),
    ),
  ];

  //sleep
  static const List<SoundCardDto> sleepSoundCards = [
    SoundCardDto(
      sound: 'assets/sounds/sleep/beach.mp3',
      image: 'assets/images/sleep/sleep1.png',
      title: 'Пляж вечером',
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFFFA726), // оранжево-жёлтый закат
          Color(0xFFEF6C00), // насыщенный закатный оранжевый
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/sleep/fire.mp3',
      image: 'assets/images/sleep/sleep2.png',
      title: 'Треск костра',
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFFF7043), // огненно-оранжевый
          Color(0xFF4E342E), // тёмный древесный коричневый
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/sleep/airplane.mp3',
      image: 'assets/images/sleep/sleep3.png',
      title: 'В самолёта',
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF90A4AE), // светло-серый / мягкий воздух
          Color(0xFF37474F), // металлический серо-синий
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/sleep/night_shore.mp3',
      image: 'assets/images/sleep/sleep4.png',
      title: 'Лунный свет',
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF0D1B2A), // глубокий ночной синий
          Color(0xFF1B263B), // тёмно-синий / небо с луной
        ],
      ),
    ),
  ];

  //relax
  static const List<SoundCardDto> relaxSoundCards = [
    SoundCardDto(
      sound: 'assets/sounds/relax/fireplace.mp3',
      image: 'assets/images/relax/relax1.png',
      title: 'Камин',
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFFF8A65), // огненно-оранжевый
          Color(0xFF4E342E), // древесно-коричневый
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/relax/beach.mp3',
      image: 'assets/images/relax/relax2.png',
      title: 'Пляж',
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF4FC3F7), // небесно-голубой
          Color(0xFF81C784), // тропическая зелень
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/relax/forestbirds.mp3',
      image: 'assets/images/relax/relax3.png',
      title: 'Лесное озеро',
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF81C784), // мягкий зелёный (лес)
          Color(0xFF4FC3F7), // голубой (озеро)
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/relax/water_small_stream.mp3',
      image: 'assets/images/relax/relax4.png',
      title: 'Тихий ручей',
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF80CBC4), // мятный
          Color(0xFF009688), // тёмный бирюзовый
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/relax/ocean.mp3',
      image: 'assets/images/relax/relax5.png',
      title: 'Океан',
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF4FC3F7), // небесный
          Color(0xFF0288D1), // океанский синий
        ],
      ),
    ),
    SoundCardDto(
      sound: 'assets/sounds/relax/walking.mp3',
      image: 'assets/images/relax/relax6.png',
      title: 'Песок под ногами',
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFFFF3E0), // светло-бежевый
          Color(0xFFBCAAA4), // песочно-коричневый
        ],
      ),
    ),
  ];
}
