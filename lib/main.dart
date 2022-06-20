import 'package:clock_ui/screen/home_screen.dart';
import 'package:clock_ui/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Analog Clock',
        theme: themeData(context),
        darkTheme: darkThemeData(context),
        themeMode: ThemeMode.dark,
        home: const HomeScreen(),
      );
}
