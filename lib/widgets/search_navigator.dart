import 'package:flutter/material.dart';
import 'package:furniture_app/widgets/search_screen_widget.dart';

Widget searchNavigator(BuildContext context) => TextFormField(
  readOnly: true,
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const SearchScreenWidget()),
    );
  },
  decoration: InputDecoration(
    hintText: 'Search',
    filled: true,
    fillColor: const Color(0xFFF5F5F5),
    prefixIcon: const Icon(Icons.search, color: Colors.grey),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
  ),
);
