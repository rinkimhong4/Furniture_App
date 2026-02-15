import 'package:flutter/material.dart';
import 'package:furniture_app/core/provider/password_provider.dart';
import 'package:furniture_app/core/routes/app_pages.dart';
import 'package:furniture_app/core/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => PasswordProvider())],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Furniture App',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        // home: const SplashWidget(),
        // home: SplashScreen(),
        // initialRoute: RouteView.splash.name,
        initialRoute: RouteView.home.name,
        getPages: AppRouting.route,
      ),
    );
  }
}
