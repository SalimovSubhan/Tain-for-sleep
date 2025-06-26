import 'package:flutter/material.dart';

class RadioWithTextWidget extends StatelessWidget {
  final int value;
  final String title;
  final void Function()? onTap;
  final bool isSelected;
  const RadioWithTextWidget({
    super.key,
    required this.onTap,
    required this.title,
    required this.value,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 25),
        color: Colors.amber.withAlpha(0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 10,
              backgroundColor: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(4),
                child: CircleAvatar(
                  backgroundColor: isSelected ? Colors.blue : Colors.white,
                  radius: 10,
                ),
              ),
            ),
            SizedBox(width: 15),
            Text(title, style: TextStyle(color: Colors.white, fontSize: 17)),
          ],
        ),
      ),
    );
  }
}
