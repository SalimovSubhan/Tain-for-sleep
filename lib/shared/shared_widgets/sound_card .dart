import 'package:flutter/material.dart';

class SoundCard extends StatelessWidget {
  final String title;
  final String image;
  const SoundCard({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 170,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          color: Colors.amber,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 40,
          // padding: EdgeInsets.only(left: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(108),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Text(title, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
