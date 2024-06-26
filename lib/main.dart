import 'package:flutter/material.dart';
import 'package:local_sql/injector.dart';
import 'package:local_sql/ui/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initInjector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const SplashPage(),
    );
  }
}

