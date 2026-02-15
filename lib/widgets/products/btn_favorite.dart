import 'package:flutter/material.dart';

class BtnFavorite extends StatelessWidget {
  const BtnFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.7),
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.favorite_border, color: Colors.black, size: 20),
      ),
    );
  }
}
