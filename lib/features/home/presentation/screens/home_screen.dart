import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:rain_for_sleep/core/services/sounds_sevices.dart';
import 'package:rain_for_sleep/shared/shared_widgets/sounds_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 42, 78, 162),
      body: DefaultTabController(
        length: 5,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 90,
              padding: const EdgeInsets.only(left: 15),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0E2A6C), Color.fromARGB(255, 2, 65, 116)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Звуки сна',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 14, 42, 108),
                    Color.fromARGB(255, 2, 65, 116),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              padding: const EdgeInsets.only(bottom: 10, top: 15),
              child: ButtonsTabBar(
                height: 30,
                buttonMargin: const EdgeInsets.symmetric(horizontal: 15),
                unselectedDecoration: BoxDecoration(
                  color: const Color.fromARGB(255, 29, 52, 107),
                  borderRadius: BorderRadius.circular(100),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 19, 137, 234),
                      Color.fromARGB(255, 2, 65, 116),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                tabs: const [
                  Tab(
                    child: Text(
                      'Все',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Дождь',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Снег',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Сон',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Расслабиться',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  //all
                  SoundsScreen(soundCards: SoundsSevices.allSoundCards),
                  //rain
                  SoundsScreen(soundCards: SoundsSevices.rainSoundCards),
                  //snow
                  SoundsScreen(soundCards: SoundsSevices.snowSoundCards),
                  //sleep
                  SoundsScreen(soundCards: SoundsSevices.sleepSoundCards),
                  //relax
                  SoundsScreen(soundCards: SoundsSevices.relaxSoundCards),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
