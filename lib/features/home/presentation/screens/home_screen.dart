import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart'; // добавлено
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rain_for_sleep/core/services/sounds_sevices.dart';
import 'package:rain_for_sleep/features/home/presentation/widgets/setings_alert_dialog.dart';
import 'package:rain_for_sleep/shared/shared_widgets/sounds_screen.dart';

final checkLanguage = StateProvider((ref) => 0);

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(checkLanguage);
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'title'.tr(), // Звуки сна
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: IconButton(
                      onPressed: () {
                        // isShowSettings.value = true;
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const SetingsAlertDialog();
                          },
                        );
                      },
                      icon: const Icon(Icons.settings, color: Colors.white),
                      iconSize: 25,
                    ),
                  ),
                ],
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
                tabs: [
                  Tab(
                    child: Text(
                      'all'.tr(), // Все
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'rain'.tr(), // Дождь
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'snow'.tr(), // Снег
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'sleep'.tr(), // Сон
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'relax'.tr(), // Расслабиться
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SoundsScreen(soundCards: SoundsSevices.allSoundCards),
                  SoundsScreen(soundCards: SoundsSevices.rainSoundCards),
                  SoundsScreen(soundCards: SoundsSevices.snowSoundCards),
                  SoundsScreen(soundCards: SoundsSevices.sleepSoundCards),
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
