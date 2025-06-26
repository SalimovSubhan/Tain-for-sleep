import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TainmerScreen extends HookConsumerWidget {
  final String title;
  final String image;

  const TainmerScreen({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(149, 119, 195, 122),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.close, color: Colors.white),
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Icon(Icons.add_circle_outline_sharp, color: Colors.white),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),

              SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_circle_outline, color: Colors.white, size: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.stop_sharp),
                    ),
                  ),
                  Icon(Icons.timer_sharp, color: Colors.white, size: 30),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
