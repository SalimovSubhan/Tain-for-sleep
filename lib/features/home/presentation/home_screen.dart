import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:rain_for_sleep/features/home/presentation/screens/all_screen.dart';
import 'package:rain_for_sleep/features/home/presentation/screens/rain_screen.dart';
import 'package:rain_for_sleep/features/home/presentation/screens/relax_screen.dart';
import 'package:rain_for_sleep/features/home/presentation/screens/sllip_screen.dart';
import 'package:rain_for_sleep/features/home/presentation/screens/work_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0E2A6C),
        title: Text('Звуки сна', style: TextStyle(color: Colors.white)),
      ),
      body: DefaultTabController(
        length: 5,
        child: Column(
          children: [
            Container(
              color: Color(0xFF0E2A6C),
              padding: EdgeInsets.only(bottom: 10, top: 15),
              child: ButtonsTabBar(
                height: 35,
                buttonMargin: EdgeInsets.symmetric(horizontal: 20),
                unselectedDecoration: BoxDecoration(
                  color: Color.fromARGB(255, 29, 52, 107),
                  borderRadius: BorderRadius.circular(100),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 19, 137, 234),
                      const Color.fromARGB(255, 2, 65, 116),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                tabs: [
                  Tab(
                    child: Text(
                      'Все',
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
                      'Дождь',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Расслабиться',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Работа',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  AllScreen(),
                  SllipScreen(),
                  RainScreen(),
                  RelaxScreen(),
                  WorkScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
