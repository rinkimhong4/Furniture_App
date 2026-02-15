// ignore_for_file: file_names

import 'package:flutter/material.dart';

Widget smartImage(String path, {BoxFit? fit = BoxFit.cover}) {
  if (path.startsWith('http') || path.startsWith('https')) {
    return Image.network(
      path,
      fit: fit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const Center(child: CircularProgressIndicator(strokeWidth: 2));
      },
      errorBuilder: (context, error, stackTrace) => const Center(
        child: Icon(Icons.broken_image_outlined, size: 64, color: Colors.grey),
      ),
    );
  }

  return Image.asset(
    path,
    fit: fit,
    errorBuilder: (context, error, stackTrace) => const Center(
      child: Icon(Icons.broken_image_outlined, size: 64, color: Colors.grey),
    ),
  );
}
