import 'package:flutter/material.dart';
import 'package:jualan/pages/login.dart';
import 'package:jualan/pages/home.dart';
import 'package:jualan/pages/splashscreen.dart';
import 'package:jualan/pages/test.dart';
import 'package:jualan/pages/timeline.dart';
import 'package:jualan/pages/semua_kategori.dart';


void main() {
  return runApp(Login());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'MelekPedia',
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/homepage': (BuildContext context) => HomePage(),
        '/kategori' : (BuildContext context) => KategoriPage(),
      },
      theme: ThemeData(
        primaryColor: Colors.green[600],
        primaryColorLight: Colors.amber[400],
        primaryIconTheme:
            Theme.of(context).primaryIconTheme.copyWith(color: Colors.white),
        primaryTextTheme: TextTheme(title: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class Testing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'testing',
      home:  CarouselDemo(),
    );
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'testing',
      home:  LoginPage(),
    );
  }
}

class TimeLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coba TimeLine',
      home:  TimeLinePage(),
    );
  }
}
