import 'package:flutter/material.dart';
import 'package:rain_for_sleep/shared/shared_widgets/sound_card%20.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Выбор звуков'), toolbarHeight: 50),
      body: Container(
        height: 800,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.greenAccent, const Color.fromARGB(255, 43, 89, 44)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(width: double.infinity, height: 105),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SoundCard(title: 'Дожди'),
                  SizedBox(width: 20),
                  SoundCard(title: 'Снегопад'),
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SoundCard(title: 'Шторм'),
                  SizedBox(width: 20),
                  SoundCard(title: 'Буря'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
