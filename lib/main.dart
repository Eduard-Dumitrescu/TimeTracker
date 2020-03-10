import 'package:flutter/material.dart';
import 'package:timetracker/ui/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      //onGenerateRoute: RouteGenerator.generateRoute,
      routes: {
        '/home': (context) => const HomePage(
              title: 'Track me',
            ),
      },
    );
  }
}
