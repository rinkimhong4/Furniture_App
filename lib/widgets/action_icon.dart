import 'package:flutter/material.dart';

/// Reusable action icon widget
class ActionIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const ActionIcon({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black.withValues(alpha: 0.06),
        ),
        child: Icon(icon, color: Colors.black87),
      ),
    );
  }
}
