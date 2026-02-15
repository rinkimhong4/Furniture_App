import 'package:flutter/material.dart';

class AppData {
  // =========================
  // App Info
  // =========================
  static const String appName = "Furniture App";
  static const String slogan = "Modern Home • Smart Living";

  // =========================
  // Colors (Nature Theme)
  // =========================
  static const primaryColor = Color(0xFF4CAF50); // Forest green
  static const secondaryColor = Color(0xFFAED581); // Light moss green
  static const accentColor = Color(0xFF8D6E63); // Earthy brown
  static const backgroundColor = Color(0xFFE8F5E9); // Soft green/cream
  static const textPrimary = Color(0xFF1B5E20); // Dark green
  static const textSecondary = Color(0xFF558B2F); // Olive green

  // =========================
  // Animation Durations
  // =========================
  static const splashDuration = Duration(seconds: 2);
  static const pageAnimation = Duration(milliseconds: 400);

  // =========================
  // Onboarding Data
  // =========================
  static List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/image1.png",
      "title": "Modern Furniture",
      "text":
          "Discover premium modern furniture designs that bring comfort and elegance to your home.",
    },
    {
      "image": "assets/images/image2.png",
      "title": "Smart Living Spaces",
      "text":
          "Design your living space with smart, stylish, and functional furniture solutions.",
    },
    {
      "image": "assets/images/image3.png",
      "title": "Fast & Safe Delivery",
      "text":
          "Get your furniture delivered safely, quickly, and right to your doorstep.",
    },
  ];

  // // =========================
  // // Categories
  // // =========================
  // static List<Map<String, dynamic>> categories = [
  //   {"name": "Sofas", "icon": Icons.weekend},
  //   {"name": "Chairs", "icon": Icons.chair},
  //   {"name": "Tables", "icon": Icons.table_bar},
  //   {"name": "Beds", "icon": Icons.bed},
  //   {"name": "Storage", "icon": Icons.inventory_2},
  // ];

  // =========================
  // Demo Products
  // =========================
  static List<Map<String, dynamic>> products = [
    {
      "id": 1,
      "name": "Modern Sofa",
      "price": 299.99,
      "image": "https://images.unsplash.com/modern-sofa",
      "category": "Sofas",
    },
    {
      "id": 2,
      "name": "Wooden Chair",
      "price": 89.99,
      "image": "https://images.unsplash.com/wooden-chair",
      "category": "Chairs",
    },
    {
      "id": 3,
      "name": "Luxury Bed",
      "price": 499.99,
      "image": "https://images.unsplash.com/luxury-bed",
      "category": "Beds",
    },
  ];

  //
  static final List<Map<String, dynamic>> categories = [
    {"name": "Table", "icon": Icons.table_restaurant_outlined},
    {"name": "Chair", "icon": Icons.chair},
    {"name": "Bed", "icon": Icons.bed},
    {"name": "Lamp", "icon": Icons.light_rounded},
    {"name": "Sofa", "icon": Icons.weekend},
    {"name": "Shelf", "icon": Icons.dashboard},
  ];

  static const explore = [
    {
      'name': 'Adirondack Chair',
      'price': '100',
      'image':
          'https://static.vecteezy.com/system/resources/previews/037/485/748/non_2x/ai-generated-eggshell-white-chair-scandinavian-modern-minimalist-style-transparent-background-isolated-image-png.png',
    },
    {
      'name': 'Adirondack Chair',
      'price': '100',
      'image':
          'https://static.vecteezy.com/system/resources/previews/037/485/748/non_2x/ai-generated-eggshell-white-chair-scandinavian-modern-minimalist-style-transparent-background-isolated-image-png.png',
    },
    {
      'name': 'Adirondack Chair',
      'price': '100',
      'image':
          'https://static.vecteezy.com/system/resources/previews/037/485/748/non_2x/ai-generated-eggshell-white-chair-scandinavian-modern-minimalist-style-transparent-background-isolated-image-png.png',
    },
    {
      'name': 'Adirondack Chair',
      'price': '100',
      'image':
          'https://static.vecteezy.com/system/resources/previews/037/485/748/non_2x/ai-generated-eggshell-white-chair-scandinavian-modern-minimalist-style-transparent-background-isolated-image-png.png',
    },
    {
      'name': 'Adirondack Chair',
      'price': '100',
      'image':
          'https://static.vecteezy.com/system/resources/previews/037/485/748/non_2x/ai-generated-eggshell-white-chair-scandinavian-modern-minimalist-style-transparent-background-isolated-image-png.png',
    },
    {
      'name': 'Adirondack Chair',
      'price': '100',
      'image':
          'https://static.vecteezy.com/system/resources/previews/037/485/748/non_2x/ai-generated-eggshell-white-chair-scandinavian-modern-minimalist-style-transparent-background-isolated-image-png.png',
    },
  ];
}
