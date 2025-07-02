import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:rain_for_sleep/features/home/presentation/screens/all_screen.dart';
import 'package:rain_for_sleep/features/home/presentation/screens/rain_screen.dart';
import 'package:rain_for_sleep/features/home/presentation/screens/relax_screen.dart';
import 'package:rain_for_sleep/features/home/presentation/screens/sllip_screen.dart';
import 'package:rain_for_sleep/features/home/presentation/screens/snow_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E2A6C),
        title: const Text('Звуки сна', style: TextStyle(color: Colors.white)),
      ),
      body: DefaultTabController(
        length: 5,
        child: Column(
          children: [
            Container(
              color: const Color(0xFF0E2A6C),
              padding: const EdgeInsets.only(bottom: 10, top: 15),
              child: ButtonsTabBar(
                height: 35,
                buttonMargin: const EdgeInsets.symmetric(horizontal: 20),
                unselectedDecoration: BoxDecoration(
                  color: const Color.fromARGB(255, 29, 52, 107),
                  borderRadius: BorderRadius.circular(100),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 25),
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
            // ignore: prefer_const_constructors
            Expanded(
              child: const TabBarView(
                children: [
                  AllScreen(),
                  RainScreen(),
                  SnowScreen(),
                  SllipScreen(),
                  RelaxScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
